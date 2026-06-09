-- Essential Variables & Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")

local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

_G.AutoFarm = false
_G.FastAttack = false
_G.AutoClick = false
_G.SelectWeapon = "Melee" -- Default

-- ==========================================
-- LIGHTWEIGHT DRAGGABLE UI
-- ==========================================
local guiParent = pcall(function() return CoreGui end) and CoreGui or Player:WaitForChild("PlayerGui")
for _, v in pairs(guiParent:GetChildren()) do if v.Name == "MiniHub" then v:Destroy() end end

local ScreenGui = Instance.new("ScreenGui", guiParent)
ScreenGui.Name = "MiniHub"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 230)
MainFrame.Position = UDim2.new(0.8, 0, 0.5, -115)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Makes UI Draggable!
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "  Lightweight Hub"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local function CreateToggle(yPos, text, globalVar, callback)
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Size = UDim2.new(1, -20, 0, 30)
    Btn.Position = UDim2.new(0, 10, 0, yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    Btn.Text = text .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 100, 100)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    Btn.MouseButton1Click:Connect(function()
        _G[globalVar] = not _G[globalVar]
        if _G[globalVar] then
            Btn.Text = text .. ": ON"
            Btn.TextColor3 = Color3.fromRGB(100, 255, 100)
        else
            Btn.Text = text .. ": OFF"
            Btn.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
        if callback then callback(_G[globalVar]) end
    end)
end

local function CreateWeaponCycle(yPos)
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Size = UDim2.new(1, -20, 0, 30)
    Btn.Position = UDim2.new(0, 10, 0, yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    Btn.Text = "Weapon: " .. _G.SelectWeapon
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    local weapons = {"Melee", "Sword", "Blox Fruit"}
    local idx = 1

    Btn.MouseButton1Click:Connect(function()
        idx = (idx % #weapons) + 1
        _G.SelectWeapon = weapons[idx]
        Btn.Text = "Weapon: " .. _G.SelectWeapon
    end)
end

CreateToggle(40, "Auto Farm", "AutoFarm")
CreateToggle(75, "Fast Attack / Aura", "FastAttack")
CreateToggle(110, "Auto Click", "AutoClick")
CreateWeaponCycle(145)

local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(1, -20, 0, 25)
CloseBtn.Position = UDim2.new(0, 10, 0, 190)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "Close Script"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function()
    _G.AutoFarm = false _G.FastAttack = false _G.AutoClick = false
    ScreenGui:Destroy()
end)

-- ==========================================
-- SCRIPT LOGIC
-- ==========================================

-- Helper: Auto Equip Weapon
local function EquipWeapon(tooltipName)
    pcall(function()
        for _, tool in pairs(Player.Backpack:GetChildren()) do
            if tool.ToolTip == tooltipName then
                Player.Character.Humanoid:EquipTool(tool)
            end
        end
    end)
end

-- Core: Fast Attack / Fruit Aura Logic
local FastAttack = { Distance = 150 }

function FastAttack:Execute()
    local enemiesList = {}
    local mainTarget = nil
    local char = Player.Character
    if not char then return end

    -- Gather nearby enemies
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local head = enemy:FindFirstChild("Head")
        local root = enemy:FindFirstChild("HumanoidRootPart")
        if head and enemy.Humanoid.Health > 0 and Player:DistanceFromCharacter(head.Position) < self.Distance then
            table.insert(enemiesList, {enemy, head})
            mainTarget = head
            
            -- Expand Hitbox so Fruit Projectiles hit instantly
            if root then
                root.Size = Vector3.new(60, 60, 60)
                root.CanCollide = false
                root.Transparency = 1
            end
        end
    end
    
    if not mainTarget or #enemiesList == 0 then return end

    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        if tool.ToolTip == "Blox Fruit" and tool:FindFirstChild("LeftClickRemote") then
            -- FRUIT AURA: Auto-aims and spams the fruit ability directly at the enemy
            for _, enemyData in ipairs(enemiesList) do
                pcall(function()
                    local direction = (enemyData[2].Position - char:GetPivot().Position).Unit
                    tool.LeftClickRemote:FireServer(direction, 1)
                end)
            end
        else
            -- MELEE/SWORD AURA: Uses RegisterHit to do instant damage
            pcall(function()
                RegisterAttack:FireServer(0)
                RegisterHit:FireServer(mainTarget, enemiesList)
            end)
        end
    end
end

-- Loop: Fast Attack & Auto Click
task.spawn(function()
    while task.wait() do
        if _G.FastAttack then
            FastAttack:Execute()
        end
        if _G.AutoClick and Player.Character and Player.Character:FindFirstChildOfClass("Tool") then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end
    end
end)

-- Loop: Auto Farm Teleport
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            EquipWeapon(_G.SelectWeapon)
                            
                            -- Position player above enemy
                            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") then
                                Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 35, 0)
                                Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            end
                            
                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            end)
        end
    end
end)

-- Notification
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Status",
        Text = "Executed Lightweight Hub!",
        Duration = 3
    })
end)
