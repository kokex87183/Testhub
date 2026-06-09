-- Essential Variables & Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

_G.AutoFarm = true
_G.FastAttack = true
_G.AutoClick = true

-- Helper: Equip Selected Weapon
local function EquipWeapon(weaponName)
    local backpack = Player:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild(weaponName) then
        Player.Character.Humanoid:EquipTool(backpack[weaponName])
    end
end

-- Core: Fast Attack & Auto Click Logic [cite: 177, 187]
local FastAttack = { Distance = 100 }

function FastAttack:Attack(targetHead, enemiesList)
    if not targetHead or #enemiesList == 0 then return end
    RegisterAttack:FireServer(0)
    RegisterHit:FireServer(targetHead, enemiesList)
end

function FastAttack:Execute()
    local enemiesList = {}
    local mainTarget = nil
    
    -- Process nearby enemies [cite: 179, 180]
    for _, enemy in pairs(workspace.Enemies:GetChildren()) do
        local head = enemy:FindFirstChild("Head")
        if head and enemy.Humanoid.Health > 0 and Player:DistanceFromCharacter(head.Position) < self.Distance then
            table.insert(enemiesList, {enemy, head})
            mainTarget = head
        end
    end
    
    if mainTarget then
        self:Attack(mainTarget, enemiesList)
    end
end

-- Main Loop: Handles Auto Click and Fast Attack [cite: 187]
task.spawn(function()
    while task.wait() do
        if _G.AutoClick and _G.FastAttack then
            FastAttack:Execute()
        end
    end
end)

-- Core: Auto Farm Logic (Simplified) [cite: 22, 134]
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                for _, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat
                            task.wait()
                            EquipWeapon(_G.SelectWeapon or "Melee")
                            
                            -- Position player above enemy for safe farming [cite: 22, 31]
                            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                                Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            end
                            
                            -- Trigger damage [cite: 22]
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            end)
        end
    end
end)
