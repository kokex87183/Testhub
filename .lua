repeat task.wait() until game:IsLoaded()

local lplr = game.Players.LocalPlayer

-- Load Dependencies Safely
local QuestData, WalkTween
pcall(function()
    QuestData = loadstring(game:HttpGet("https://raw.githubusercontent.com/eixotic07/Bloxfruit/main/Autofarm%20Data.lua"))()
    WalkTween = loadstring(game:HttpGet("https://raw.githubusercontent.com/eixotic07/Utils/main/Universal%20Tween.lua"))()
end)

if not QuestData then warn("Failed to load QuestData") end
if not WalkTween then warn("Failed to load WalkTween") end

-- Combat Framework / No Cooldown (Safe Hook)
task.spawn(function()
    pcall(function()
        require(game.ReplicatedStorage.Util.CameraShaker):Stop()
    end)
    
    local CombatFrameworkOld = lplr.PlayerScripts:WaitForChild("CombatFramework", 5)
    if CombatFrameworkOld then
        local debug_getup = getupvalues or debug.getupvalues
        local CombatFramework = debug_getup(require(CombatFrameworkOld))[2]

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                if CombatFramework and CombatFramework.activeController and CombatFramework.activeController.equipped then
                    CombatFramework.activeController.attacking = false
                    CombatFramework.activeController.increment = 3
                    CombatFramework.activeController.blocking = false
                    CombatFramework.activeController.timeToNextBlock = 0
                    CombatFramework.activeController.timeToNextAttack = 0
                    CombatFramework.activeController.hitboxMagnitude = 54
                end
            end)
        end)
    end
end)

-- in-game functions
local World = 1
if game.PlaceId == 2753915549 then
    World = 1
elseif game.PlaceId == 4442272183 then
    World = 2
elseif game.PlaceId == 7449423635 then
    World = 3
end

function StartQuest(Enemy)
    if not QuestData then return end
    local Quest_Person, Quest_Data = QuestData.getQuest(Enemy)
    if not Quest_Data then return end
    
    local CFramePos
    for i,v in pairs(Quest_Data) do
        if i == "CFramePos" then
            CFramePos = v
        elseif typeof(v) == "CFrame" then
            CFramePos = v
        end
    end

    if not lplr.Character or not lplr.Character:FindFirstChild("HumanoidRootPart") or not CFramePos then return end

    if (Vector3.new(CFramePos.X, CFramePos.Y, CFramePos.Z) - lplr.Character.HumanoidRootPart.Position).Magnitude >= 10000 and Quest_Data.Entrance then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Quest_Data.Entrance)
        task.wait(0.4)
     else
        task.wait(1)
        if WalkTween then WalkTween(lplr.Character.HumanoidRootPart, CFramePos, 300) end
        task.wait(0.4)
        if (Vector3.new(CFramePos.X, CFramePos.Y, CFramePos.Z) - lplr.Character.HumanoidRootPart.Position).Magnitude <= 20 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", Quest_Data.QuestName, Quest_Data.LevelQuest)
            task.wait(0.5)
        end
    end
end

function Attack(Enemy)
    local mainGui = lplr.PlayerGui:FindFirstChild("Main")
    if mainGui and mainGui.Quest.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name:find(Enemy) then
                repeat task.wait()
                    if not lplr.Character or not lplr.Character:FindFirstChild("PrimaryPart") then break end
                    
                    if (v.HumanoidRootPart.Position - lplr.Character.PrimaryPart.Position).Magnitude <= 54 then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1000, 1000))
                    end
                    if WalkTween then
                        WalkTween(lplr.Character.HumanoidRootPart, CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y + 50, v.HumanoidRootPart.Position.Z), 400)
                    end
                until not v.Parent or v.Humanoid.Health <= 0 or not SelectedQuest.Enabled
            else
                for i,v in pairs(game.Workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                    if v.Name:find(Enemy) and lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart") then
                        if WalkTween then WalkTween(lplr.Character.HumanoidRootPart, v.CFrame, 300) end
                        break
                    end
                end
            end
        end
    else
        StartQuest(Enemy)
    end
end


-- UI LIBRARY (FIXED: Official Permanent Link)
local Meteor = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Bloxburg = Meteor:CreateWindow({
    Name = "Meteor Lite : Bloxfruit",
    LoadingTitle = "Meteor Lite",
    LoadingSubtitle = "by eixotic07",
    ConfigurationSaving = { Enabled = true, FolderName = "MeteorLite", FileName = "Bloxburg" }
})

local Autofarm = Bloxburg:CreateTab("Autofarm")

-- Safely initialize tables in case GitHub data fails
QuestData = QuestData or {}
QuestData.FirstSea = QuestData.FirstSea or {}
QuestData.SecondSea = QuestData.SecondSea or {}
QuestData.ThirdSea = QuestData.ThirdSea or {}

table.insert(QuestData.FirstSea, "First Sea")
table.insert(QuestData.SecondSea, "Second Sea")
table.insert(QuestData.ThirdSea, "Third Sea")

-- Global variable for our loop to read
getgenv().SelectedQuest = {Quest = "", Enabled = false, AutoSelect = false}

local FirstSeaD = Autofarm:CreateDropdown({
    Name = "Quest : FirstSea",
    Options = QuestData.FirstSea,
    Flag = "Dropdown1",
    CurrentOption = {"First Sea"},
    Callback = function(Option)
        getgenv().SelectedQuest.Quest = Option[1] or Option
    end,
})

local SecondSeaD = Autofarm:CreateDropdown({
    Name = "Quest : SecondSea",
    Options = QuestData.SecondSea,
    Flag = "Dropdown2",
    CurrentOption = {"Second Sea"},
    Callback = function(Option)
        getgenv().SelectedQuest.Quest = Option[1] or Option
    end,
})

local ThirdSeaD = Autofarm:CreateDropdown({
    Name = "Quest : ThirdSea",
    Options = QuestData.ThirdSea,
    Flag = "Dropdown3",
    CurrentOption = {"Third Sea"},
    Callback = function(Option)
        getgenv().SelectedQuest.Quest = Option[1] or Option
    end,
})

Autofarm:CreateToggle({ 
    Name = "Auto Select", 
    CurrentValue = false, 
    Flag = "Toggle2",
    Callback = function(Value)
        getgenv().SelectedQuest.AutoSelect = Value
        
        task.spawn(function()
            while getgenv().SelectedQuest.AutoSelect do
                task.wait(1)
                pcall(function()
                    local currentLevel = lplr.Data.Level.Value
                    local SelectedEnemy = QuestData.CalculateLevel(currentLevel)

                    if QuestData.Quests then
                        for i,v in pairs(QuestData.Quests) do
                            if v.EnemyName == SelectedEnemy then
                                if v.World == 1 and World == 1 then
                                    FirstSeaD:Set({v.EnemyName})
                                elseif v.World == 2 and World == 2 then
                                    SecondSeaD:Set({v.EnemyName})
                                elseif v.World == 3 and World == 3 then
                                    ThirdSeaD:Set({v.EnemyName})
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

Autofarm:CreateSection("Quest Autofarm")

Autofarm:CreateToggle({ 
    Name = "Quest Autofarm", 
    CurrentValue = false, 
    Flag = "Toggle1",
    Callback = function(Value)
        getgenv().SelectedQuest.Enabled = Value

        task.spawn(function()
            while getgenv().SelectedQuest.Enabled do
                task.wait()
                pcall(function()
                    Attack(getgenv().SelectedQuest.Quest)
                end)
            end
        end)
    end
})
