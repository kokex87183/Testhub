-- Services & Core Setup
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")

local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

-- Global States
_G.AutoFarm = false
_G.FastAttack = false
_G.AutoClick = false

-- CREATE LIGHTWEIGHT UI
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "MatsuneMini"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.Size = UDim2.new(0, 200, 0, 185)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Native draggable functionality

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "Matsune Mini"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

-- UI Toggle Creator Helper
local function CreateToggle(name, position, globalVar)
    local Button = Instance.new("TextButton", MainFrame)
    Button.Size = UDim2.new(0, 180, 0, 35)
    Button.Position = position
    Button.BorderSizePixel = 0
    Button.Font = Enum.Font.GothamMedium
    Button.TextSize = 13
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local BtnCorner = Instance.new("UICorner", Button)
    BtnCorner.CornerRadius = UDim.new(0, 6)
    
    local function updateVisuals()
        if _G[globalVar] then
            Button.BackgroundColor3 = Color3.fromRGB(46, 204, 113) -- Green
            Button.Text = name .. ": ON"
        else
            Button.BackgroundColor3 = Color3.fromRGB(231, 76, 60) -- Red
            Button.Text = name .. ": OFF"
        end
    end
    
    updateVisuals()
    Button.MouseButton1Click:Connect(function()
        _G[globalVar] = not _G[globalVar]
        updateVisuals()
    end)
end

-- Render the buttons
CreateToggle("Auto Farm", UDim2.new(0, 10, 0, 45), "AutoFarm")
CreateToggle("Fast Attack", UDim2.new(0, 10, 0, 90), "FastAttack")
CreateToggle("Auto Click", UDim2.new(0, 10, 0, 135), "AutoClick")


-- GAMEPLAY FUNCTIONALITY CODE

-- Fast Attack Execution
local FastAttack = { Distance = 100 }
function FastAttack:Execute()
    local enemiesList = {}
    local mainTarget = nil
    
    if workspace:FindFirstChild("Enemies") then
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            local head = enemy:FindFirstChild("Head")
            if head and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and Player:DistanceFromCharacter(head.Position) < self.Distance then
                table.insert(enemiesList, {enemy, head})
                mainTarget = head
            end
        end
    end
    
    if mainTarget then
        RegisterAttack:FireServer(0)
        RegisterHit:FireServer(mainTarget, enemiesList)
    end
end

-- Fast Attack & Auto Click Worker Loop
task.spawn(function()
    while task.wait() do
        if _G.AutoClick and _G.FastAttack then
            FastAttack:Execute()
        end
    end
end)

-- Auto Farm Worker Loop
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                if workspace:FindFirstChild("Enemies") then
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait()
                                
                                -- Auto Equip Tool from Inventory
                                local backpack = Player:FindFirstChild("Backpack")
                                if backpack then
                                    local tool = backpack:FindFirstChildOfClass("Tool")
                                    if tool then
                                        Player.Character.Humanoid:EquipTool(tool)
                                    end
                                end
                                
                                -- Safely lock player position over target mob
                                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                                    Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
                                end
                                
                                -- Trigger weapon input
                                VirtualUser:Button1Down(Vector2.new(1280, 672))
                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                end
            end)
        end
    end
end)
