-- ============================================================
--  BUNNY HUB | WindUI Mobile Edition
--  Advanced Aimlock, ESP, & Combat Features
-- ============================================================

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui          = game:GetService("CoreGui")
local Lighting         = game:GetService("Lighting")
local StarterGui       = game:GetService("StarterGui")
local LocalPlayer      = Players.LocalPlayer
local Camera           = workspace.CurrentCamera

-- ============================================================
--  FAST LOCALS
-- ============================================================
local mathFloor  = math.floor
local mathClamp  = math.clamp
local mathAbs    = math.abs
local mathMax    = math.max
local mathRandom = math.random
local Vector2New = Vector2.new
local Vector3New = Vector3.new
local Color3RGB  = Color3.fromRGB
local CFrameNew  = CFrame.new

-- ============================================================
--  SETTINGS 
-- ============================================================
local Settings = {
    Aimlock = {
        Enabled            = false,
        Prediction         = 0.135,
        PredictionEnabled  = true,
        AimMode            = "Smart",
        IsAiming           = false,
        CurrentTarget      = nil,
        WallCheck          = true,
        TeamCheck          = true,
        SmoothAiming       = false,
        SmoothSpeed        = 0.3,
        StrafePrediction   = 1.0,
        PeriodicDisable    = false,
        Keybind            = "RightClick",
    },
    FOV = {
        Visible        = true,
        FollowCursor   = true,
        Radius         = 150,
        Thickness      = 1.5,
        Color          = Color3RGB(255, 255, 255),
        Transparency   = 0.8,
        Filled         = false,
        FilledColor    = Color3RGB(255, 255, 255),
        FilledTransp   = 0.92,
    },
    Visuals = {
        ESPEnabled         = false,
        ESPBoxes           = true,
        ESPNames           = true,
        ESPNameStyle       = "Display Name",
        ESPOutline         = true,
        ESPTextScale       = 14,
        UseCustomNameColor = false,
        ESPNameColor       = Color3RGB(255, 255, 255),
        ESPUsernameColor   = Color3RGB(180, 180, 200),
        TeamCheck          = true,
        ShowTeammates      = false,
        TeammateColor      = Color3RGB(0, 200, 255),
        UseVisColors       = true,
        VisColor           = Color3RGB(50, 255, 80),
        HiddenColor        = Color3RGB(255, 60, 60),
        DistanceDisplay    = false,
        HealthNumbers      = false,
        HealthBar          = true,
        ChamsEnabled       = false,
        ChamsFillColor     = Color3RGB(255, 30, 30),
        ChamsOutlineColor  = Color3RGB(255, 255, 255),
        ChamsDepth         = true,
        TracerLines        = false,
        TracerOrigin       = "Bottom",
        TracerColor        = Color3RGB(0, 200, 255),
        SnapLines          = false,
        SnapLineColor      = Color3RGB(255, 0, 220),
        TargetUI           = true,
        HealthPosition     = "TopRight",
        MaxESPDistance     = 1000,
    },
    Player = {
        WalkSpeedEnabled = false,
        WalkSpeed        = 16,
        JumpPowerEnabled = false,
        JumpPower        = 50,
        NoclipEnabled    = false,
        NoclipKeybind    = "N",
    },
    DetectionAvoidance = {
        RandomJitter       = false,
        JitterAmount       = 0.05,
        PeriodicAimDisable = false,
        DisableChance      = 0.1,
        DisableDuration    = 0.2,
    },
    UI = {
        ToggleKey = "K",
    },
    
    -- [ BUNNY HUB SPECIFIC SETTINGS ] --
    Bunny = {
        TargetMode    = "Players",
        TargetPlayer  = "Nearest",
        SpecificPlayer= nil,
        SilentAim     = false,
        AimbotGun     = false,
        AimbotSkill   = false,
        FastAttack    = false,
        FastAtkDelay  = 0,
        AutoHaki      = false,
        AutoV3        = false,
        AutoV4        = false,
        WalkWater     = false,
        SafeMode      = false,
        SafeHPThresh  = 30,
        ESPRange      = 500,
    }
}

local SelectWeaponGun = ""

-- ============================================================
--  BUNNY HUB HELPERS & TARGETING
-- ============================================================
local function Notify(title, text, dur)
    pcall(function() StarterGui:SetCore("SendNotification",{Title=title,Text=text,Duration=dur or 2}) end)
end

local function InSafeZone()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if pg and pg:FindFirstChild("Main") and pg.Main:FindFirstChild("SafeZone") and pg.Main.SafeZone.Visible then return true end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("ForceField") then return true end
    return false
end

local function IsValidBunnyPlayer(p)
    if not p or not p.Character then return false end
    local hum = p.Character:FindFirstChild("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    if InSafeZone() then return false end
    if p.Character:FindFirstChildOfClass("ForceField") then return false end
    return true
end

local function GetNearestBunnyPlayer()
    if InSafeZone() then return nil end
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    if Settings.Bunny.TargetPlayer == "Specific" and Settings.Bunny.SpecificPlayer then
        local p = Players:FindFirstChild(Settings.Bunny.SpecificPlayer)
        if p and IsValidBunnyPlayer(p) then return p.Character:FindFirstChild("HumanoidRootPart") end
        return nil
    end

    local bestDist, bestHRP = math.huge, nil
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and IsValidBunnyPlayer(v) then
            local hrp = v.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local d = (hrp.Position - myHRP.Position).Magnitude
                if d < bestDist and d <= Settings.Bunny.ESPRange then
                    bestDist = d; bestHRP = hrp
                end
            end
        end
    end
    return bestHRP
end

local function GetNearestBunnyNPC()
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    local bestDist, bestHRP = math.huge, nil
    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end
    for _, v in ipairs(enemies:GetChildren()) do
        local hrp = v:FindFirstChild("HumanoidRootPart")
        local hum = v:FindFirstChild("Humanoid")
        if hrp and hum and hum.Health > 0 then
            local d = (hrp.Position - myHRP.Position).Magnitude
            if d < bestDist then
                bestDist = d; bestHRP = hrp
            end
        end
    end
    return bestHRP
end

local function GetBunnyTarget()
    if Settings.Bunny.TargetMode == "NPC" then
        return GetNearestBunnyNPC()
    else
        return GetNearestBunnyPlayer()
    end
end

-- ============================================================
--  WINDOW SETUP
-- ============================================================
local Window = WindUI:CreateWindow({
    Title       = "Bunny Hub",
    Author      = "by rhoscript",
    Folder      = "BunnyHub",
    Size        = UDim2.fromOffset(680, 620), 
    Theme       = "Dark",
    Resizable   = true,
    Transparent = true, 
})

Window:SetToggleKey(Enum.KeyCode.K)

-- ============================================================
--  TABS
-- ============================================================
local HomeTab     = Window:Tab({ Title = "Home",     Icon = "home"      })
local BunnyTab    = Window:Tab({ Title = "Combat",   Icon = "swords"    }) 
local AimlockTab  = Window:Tab({ Title = "Aimlock",  Icon = "crosshair" })
local ESPTab      = Window:Tab({ Title = "ESP",      Icon = "eye"       })
local PlayerTab   = Window:Tab({ Title = "Player",   Icon = "user"      })
local VisualsTab  = Window:Tab({ Title = "Visuals",  Icon = "palette"   })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings"  })

-- ============================================================
--  HOME TAB
-- ============================================================
local HomeWelcome = HomeTab:Section({ Title = "Welcome", Opened = true })
HomeWelcome:Paragraph({
    Title = "Bunny Hub Mobile Edition",
    Desc  = "Welcome to Bunny Hub. This menu features a fully transparent dark-mode UI, mobile optimizations, and powerful combat systems including Silent Aim, Smart Aimlock, and Fast Attack.",
    Color = "Blue",
})

-- ============================================================
--  BUNNY TAB (Custom Combat Features)
-- ============================================================
local BunTarget = BunnyTab:Section({ Title = "Targeting (For Silent/Fast Aim)", Opened = true })
BunTarget:Dropdown({
    Title = "Target Mode",
    Values = {"Players", "NPC"},
    Value = "Players",
    Callback = function(v) Settings.Bunny.TargetMode = v end
})

local BunCombat = BunnyTab:Section({ Title = "Combat Hacks", Opened = true })
BunCombat:Toggle({
    Title = "Silent Aim (Magic Bullets)",
    Desc  = "Projectiles automatically hit the target without snapping your camera.",
    Value = false,
    Callback = function(v) Settings.Bunny.SilentAim = v end
})
BunCombat:Toggle({
    Title = "Aimbot Gun",
    Desc  = "Auto fires guns at the nearest target.",
    Value = false,
    Callback = function(v) Settings.Bunny.AimbotGun = v end
})
BunCombat:Toggle({
    Title = "Aimbot Skill",
    Desc  = "Auto fires skills at the nearest target.",
    Value = false,
    Callback = function(v) Settings.Bunny.AimbotSkill = v end
})
BunCombat:Toggle({
    Title = "Fast Attack (M1)",
    Desc  = "Spams click attacks automatically.",
    Value = false,
    Callback = function(v) Settings.Bunny.FastAttack = v end
})
BunCombat:Slider({
    Title = "Fast Attack Delay",
    Step  = 0.05,
    Value = { Min = 0, Max = 1, Default = 0 },
    Callback = function(v) Settings.Bunny.FastAtkDelay = v end
})

local BunAuto = BunnyTab:Section({ Title = "Auto Features", Opened = true })
BunAuto:Toggle({ Title = "Auto Haki (Buso)", Value = false, Callback = function(v) Settings.Bunny.AutoHaki = v end })
BunAuto:Toggle({ Title = "Auto V3", Value = false, Callback = function(v) Settings.Bunny.AutoV3 = v end })
BunAuto:Toggle({ Title = "Auto V4", Value = false, Callback = function(v) Settings.Bunny.AutoV4 = v end })

local BunWorld = BunnyTab:Section({ Title = "World & Player", Opened = true })
BunWorld:Toggle({ Title = "Walk on Water", Value = false, Callback = function(v) Settings.Bunny.WalkWater = v end })
BunWorld:Toggle({ Title = "Safe Mode", Desc = "Teleports you to the sky when HP is low.", Value = false, Callback = function(v) Settings.Bunny.SafeMode = v end })
BunWorld:Slider({ Title = "Safe HP Threshold %", Step = 1, Value = {Min = 5, Max = 80, Default = 30}, Callback = function(v) Settings.Bunny.SafeHPThresh = v end })

BunWorld:Button({
    Title = "Get Click-TP Tool",
    Callback = function()
        local tool = Instance.new("Tool", LocalPlayer.Backpack)
        tool.Name = "Bunni TP"; tool.RequiresHandle = false
        tool.Activated:Connect(function()
            local m = LocalPlayer:GetMouse()
            if m.Hit and LocalPlayer.Character then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameNew(m.Hit.Position + Vector3New(0, 5, 0))
            end
        end)
        Notify("Tool Added", "Click TP in backpack!", 2)
    end
})
BunWorld:Button({
    Title = "Apply High Performance (FPS Boost)",
    Callback = function()
        settings().Rendering.QualityLevel = "Level01"
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for _, e in ipairs(Lighting:GetChildren()) do if e:IsA("PostEffect") then e:Destroy() end end
        for _, v in ipairs(game:GetDescendants()) do
            pcall(function()
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v.Enabled = false
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false
                end
            end)
        end
        Notify("High Performance", "FPS Boost Applied!", 2)
    end
})

-- ============================================================
--  AIMLOCK, ESP, PLAYER, VISUALS, SETTINGS
-- ============================================================
local AimSection = AimlockTab:Section({ Title = "Aimlock Control", Opened = true })
AimSection:Toggle({ Title = "Enable Aimlock", Flag = "AimlockEnabled", Value = false, Callback = function(v) Settings.Aimlock.Enabled = v end })
AimSection:Keybind({ Title = "Aimlock Key", Flag = "AimlockKeybind", Value = "RightClick", Callback = function(v) Settings.Aimlock.Keybind = v end })
AimSection:Toggle({ Title = "Wall Check", Flag = "AimlockWallCheck", Value = true, Callback = function(v) Settings.Aimlock.WallCheck = v end })
AimSection:Toggle({ Title = "Team Check", Flag = "AimlockTeamCheck", Value = true, Callback = function(v) Settings.Aimlock.TeamCheck = v end })

local AimTuning = AimlockTab:Section({ Title = "Aim Tuning", Opened = true })
AimTuning:Dropdown({ Title = "Aim Mode", Flag = "AimlockAimMode", Values = { "Smart", "Chaos", "Head", "Torso", "Limbs", "HRP" }, Value = "Smart", Callback = function(v) Settings.Aimlock.AimMode = v end })
AimTuning:Toggle({ Title = "Enable Prediction", Flag = "AimlockPredictionEnabled", Value = true, Callback = function(v) Settings.Aimlock.PredictionEnabled = v end })
AimTuning:Slider({ Title = "Prediction Strength", Flag = "AimlockPrediction", Step = 0.005, Value = { Min = 0, Max = 0.3, Default = 0.135 }, Callback = function(v) Settings.Aimlock.Prediction = v end })

local ESPCore = ESPTab:Section({ Title = "ESP Core", Opened = true })
ESPCore:Toggle({ Title = "Enable ESP", Flag = "ESPEnabled", Value = false, Callback = function(v) Settings.Visuals.ESPEnabled = v end })
ESPCore:Toggle({ Title = "Team Check", Flag = "ESPTeamCheck", Value = true, Callback = function(v) Settings.Visuals.TeamCheck = v end })
ESPCore:Toggle({ Title = "ESP Boxes", Value = true, Callback = function(v) Settings.Visuals.ESPBoxes = v end })
ESPCore:Toggle({ Title = "Show Names", Value = true, Callback = function(v) Settings.Visuals.ESPNames = v end })
ESPCore:Toggle({ Title = "Health Bar", Value = true, Callback = function(v) Settings.Visuals.HealthBar = v end })
ESPCore:Toggle({ Title = "Enable Chams", Value = false, Callback = function(v) Settings.Visuals.ChamsEnabled = v end })

local SpeedSection = PlayerTab:Section({ Title = "Walk Speed & Jump Power", Opened = true })
SpeedSection:Toggle({ Title = "Enable Walk Speed", Value = false, Callback = function(v) Settings.Player.WalkSpeedEnabled = v end })
SpeedSection:Slider({ Title = "Walk Speed", Step = 1, Value = { Min = 16, Max = 250, Default = 16 }, Callback = function(v) Settings.Player.WalkSpeed = v end })
SpeedSection:Toggle({ Title = "Enable Jump Power", Value = false, Callback = function(v) Settings.Player.JumpPowerEnabled = v end })
SpeedSection:Slider({ Title = "Jump Power", Step = 5, Value = { Min = 50, Max = 300, Default = 50 }, Callback = function(v) Settings.Player.JumpPower = v end })

local FOVSection = VisualsTab:Section({ Title = "FOV Circle", Opened = true })
FOVSection:Toggle({ Title = "Show FOV Circle", Value = true, Callback = function(v) Settings.FOV.Visible = v end })
FOVSection:Slider({ Title = "FOV Radius", Step = 5, Value = { Min = 30, Max = 600, Default = 150 }, Callback = function(v) Settings.FOV.Radius = v end })

local ConfigSection = SettingsTab:Section({ Title = "Config System", Opened = true })
local BunnyConfig = Window.ConfigManager:CreateConfig("bunnyhub_config")
BunnyConfig:Register(Window)
ConfigSection:Button({ Title = "Save Config", Callback = function() BunnyConfig:Save(); Notify("Config", "Saved!") end })
ConfigSection:Button({ Title = "Load Config", Callback = function() BunnyConfig:Load(); Notify("Config", "Loaded!") end })


-- ============================================================
--  DRAWING OBJECTS & ESP LOGIC
-- ============================================================
local FOVRing = Drawing.new("Circle")
FOVRing.Visible = false
FOVRing.Thickness = 1.5
FOVRing.Filled = false

local ChamsFolder = Instance.new("Folder")
ChamsFolder.Name = "BunnyChams"
ChamsFolder.Parent = CoreGui
local ESPObjects = {}
local ActivePlayers = {}

local function CreateESP(player)
    pcall(function()
        local esp = {
            Box = Drawing.new("Square"),
            Name = Drawing.new("Text"),
            BarBG = Drawing.new("Square"),
            BarFG = Drawing.new("Square"),
            Highlight = Instance.new("Highlight", ChamsFolder),
            _isVisible = false,
        }
        esp.Box.Thickness = 1.5; esp.Box.Filled = false
        esp.Name.Size = 14; esp.Name.Center = true; esp.Name.Outline = true; esp.Name.Color = Color3RGB(255,255,255)
        esp.BarBG.Filled = true; esp.BarBG.Color = Color3RGB(20,20,20)
        esp.BarFG.Filled = true
        esp.Highlight.Enabled = false
        ESPObjects[player] = esp
    end)
end

for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then CreateESP(p) end end
Players.PlayerAdded:Connect(function(p) CreateESP(p) end)
Players.PlayerRemoving:Connect(function(p)
    local e = ESPObjects[p]
    if e then pcall(function() e.Box:Remove(); e.Name:Remove(); e.BarBG:Remove(); e.BarFG:Remove(); e.Highlight:Destroy() end) end
    ESPObjects[p] = nil
end)

-- ============================================================
--  BUNNY HUB BACKGROUND LOOPS & HOOKS
-- ============================================================

-- Gun Tracker
spawn(function()
    while wait(0.5) do pcall(function()
        local function scan(c)
            for _, v in pairs(c:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("RemoteFunctionShoot") then
                    SelectWeaponGun = v.Name
                end
            end
        end
        scan(LocalPlayer.Backpack)
        if LocalPlayer.Character then scan(LocalPlayer.Character) end
    end) end
end)

-- Auto Haki
spawn(function()
    while task.wait(0.5) do pcall(function()
        if not Settings.Bunny.AutoHaki then return end
        local char = LocalPlayer.Character
        if char and not char:FindFirstChild("HasBuso") then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
        end
    end) end
end)

-- Auto V3 / V4 (Mobile Fixed)
spawn(function()
    while task.wait(0.5) do 
        pcall(function()
            if Settings.Bunny.AutoV3 then ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility") end
            if Settings.Bunny.AutoV4 then ReplicatedStorage.Remotes.CommE:FireServer("Awakening") end
        end) 
    end
end)

-- Walk On Water
spawn(function()
    while wait(0.5) do pcall(function()
        local plane = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WaterBase-Plane")
        if plane then
            if Settings.Bunny.WalkWater then
                plane.Size = Vector3New(plane.Size.X, 112, plane.Size.Z)
            else
                plane.Size = Vector3New(plane.Size.X, 80, plane.Size.Z)
            end
        end
    end) end
end)

-- Safe Mode
spawn(function()
    while task.wait(0.2) do pcall(function()
        if not Settings.Bunny.SafeMode then return end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hum and hrp then
            local thresh = (Settings.Bunny.SafeHPThresh / 100) * hum.MaxHealth
            if hum.Health <= thresh then
                hrp.CFrame = hrp.CFrame + Vector3New(0, 200, 0)
            end
        end
    end) end
end)

-- Fast Attack
spawn(function()
    local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
    local RegAtk = Net:WaitForChild("RE/RegisterAttack")
    local RegHit = Net:WaitForChild("RE/RegisterHit")
    local function Collect(folder)
        local list, base = {}, nil
        if not folder then return list, base end
        for _, e in ipairs(folder:GetChildren()) do
            local head = e:FindFirstChild("Head")
            if head and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e ~= LocalPlayer.Character then
                if LocalPlayer:DistanceFromCharacter(head.Position) < 100 then
                    table.insert(list, {e, head}); base = head
                end
            end
        end
        return list, base
    end
    while true do
        if not Settings.Bunny.FastAttack then task.wait(0.05); continue end
        if Settings.Bunny.FastAtkDelay > 0 then task.wait(Settings.Bunny.FastAtkDelay) end
        local char = LocalPlayer.Character; if not char then task.wait(0.05); continue end
        local eList, b1 = Collect(workspace:FindFirstChild("Enemies"))
        local cList, b2 = Collect(workspace:FindFirstChild("Characters"))
        for _, d in ipairs(cList) do table.insert(eList, d) end
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("LeftClickRemote") then
            for _, d in ipairs(eList) do
                local dir = (d[1].HumanoidRootPart.Position - char:GetPivot().Position).Unit
                pcall(function() tool.LeftClickRemote:FireServer(dir, 1) end)
            end
        elseif #eList > 0 then
            pcall(function() RegAtk:FireServer(0) end)
            pcall(function() RegHit:FireServer(b1 or b2, eList) end)
        end
        task.wait(0)
    end
end)

-- Silent Aim (Mobile & Damage Fixed)
local Mouse = LocalPlayer:GetMouse()
local _raw = getrawmetatable(game)
local _origNC = _raw.__namecall
local _origIndex = _raw.__index
setreadonly(_raw, false)

_raw.__index = newcclosure(function(t, k)
    if Settings.Bunny.SilentAim and not checkcaller() and t == Mouse then
        if k == "Hit" then
            local tHRP = GetBunnyTarget()
            if tHRP then return CFrameNew(tHRP.Position) end
        elseif k == "Target" then
            local tHRP = GetBunnyTarget()
            if tHRP then return tHRP end
        end
    end
    return _origIndex(t, k)
end)

_raw.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if Settings.Bunny.SilentAim and not checkcaller() and (method == "FireServer" or method == "InvokeServer") then
        if self.Name == "RemoteEvent" or self.Name == "RemoteFunctionShoot" or self.Name == "LeftClickRemote" then
            local tHRP = GetBunnyTarget()
            if tHRP then
                for i, v in ipairs(args) do
                    if typeof(v) == "Vector3" then 
                        args[i] = tHRP.Position
                    elseif typeof(v) == "CFrame" then 
                        args[i] = CFrameNew(v.Position, tHRP.Position) 
                    end
                end
            end
        end
    end
    return _origNC(self, unpack(args))
end)
setreadonly(_raw, true)

-- Aimbot Gun / Skill
RunService.Heartbeat:Connect(function()
    if Settings.Bunny.AimbotGun then
        local hrp = GetBunnyTarget(); if hrp and LocalPlayer.Character then
            local gun = LocalPlayer.Character:FindFirstChild(SelectWeaponGun)
            if gun and gun:FindFirstChild("RemoteFunctionShoot") then
                pcall(function() gun.RemoteFunctionShoot:InvokeServer(hrp.Position, hrp) end)
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Settings.Bunny.AimbotSkill then
        local hrp = GetBunnyTarget(); if hrp and LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and LocalPlayer.Character:FindFirstChild(tool.Name) then
                local t = LocalPlayer.Character[tool.Name]
                if t:FindFirstChild("MousePos") then
                    pcall(function() t.RemoteEvent:FireServer(hrp.Position) end)
                end
            end
        end
    end
end)

-- ============================================================
--  MAIN LOOP (FOV, ESP, Player Mods)
-- ============================================================
local function GetHealthColor(pct)
    if pct > 0.60 then return Color3RGB(100, 255, 50) end
    if pct > 0.20 then return Color3RGB(255, 130, 0) end
    return Color3RGB(255, 50, 50)
end

RunService.RenderStepped:Connect(function(dt)
    -- FOV Ring
    local fovPos = Settings.FOV.FollowCursor and UserInputService:GetMouseLocation() or Vector2New(Camera.ViewportSize.X * 0.5, Camera.ViewportSize.Y * 0.5)
    FOVRing.Position = fovPos
    FOVRing.Radius = Settings.FOV.Radius
    FOVRing.Visible = Settings.FOV.Visible
    FOVRing.Color = Settings.FOV.Color

    -- Player Mods
    local myChar = LocalPlayer.Character
    if myChar then
        local hum = myChar:FindFirstChildOfClass("Humanoid")
        if hum then
            if Settings.Player.WalkSpeedEnabled then hum.WalkSpeed = Settings.Player.WalkSpeed end
            if Settings.Player.JumpPowerEnabled then hum.JumpPower = Settings.Player.JumpPower end
        end
    end

    -- ESP rendering
    if Settings.Visuals.ESPEnabled or Settings.Visuals.ChamsEnabled then
        for p, esp in pairs(ESPObjects) do
            local char = p.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if root and hum and hum.Health > 0 and (p.Team ~= LocalPlayer.Team or not Settings.Visuals.TeamCheck) then
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                
                if Settings.Visuals.ChamsEnabled then
                    esp.Highlight.Adornee = char
                    esp.Highlight.Enabled = true
                    esp.Highlight.FillColor = Settings.Visuals.ChamsFillColor
                    esp.Highlight.OutlineColor = Settings.Visuals.ChamsOutlineColor
                else
                    esp.Highlight.Enabled = false
                end

                if Settings.Visuals.ESPEnabled and onScreen and pos.Z < Settings.Visuals.MaxESPDistance then
                    local head = char:FindFirstChild("Head")
                    if head then
                        local headPos = Camera:WorldToViewportPoint(head.Position + Vector3New(0,0.5,0))
                        local boxH = mathAbs(headPos.Y - (pos.Y + (headPos.Y - pos.Y)*3))
                        local boxW = boxH * 0.55
                        
                        esp.Box.Visible = Settings.Visuals.ESPBoxes
                        esp.Box.Size = Vector2New(boxW, boxH)
                        esp.Box.Position = Vector2New(pos.X - boxW/2, headPos.Y)
                        esp.Box.Color = Settings.Visuals.VisColor

                        esp.Name.Visible = Settings.Visuals.ESPNames
                        esp.Name.Text = p.DisplayName
                        esp.Name.Position = Vector2New(pos.X, headPos.Y - 16)

                        local hpPct = hum.Health / (hum.MaxHealth > 0 and hum.MaxHealth or 100)
                        esp.BarBG.Visible = Settings.Visuals.HealthBar
                        esp.BarBG.Size = Vector2New(3, boxH)
                        esp.BarBG.Position = Vector2New(pos.X - boxW/2 - 5, headPos.Y)
                        
                        esp.BarFG.Visible = Settings.Visuals.HealthBar
                        esp.BarFG.Size = Vector2New(3, boxH * hpPct)
                        esp.BarFG.Position = Vector2New(pos.X - boxW/2 - 5, headPos.Y + boxH - (boxH * hpPct))
                        esp.BarFG.Color = GetHealthColor(hpPct)
                    end
                else
                    esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false
                end
            else
                esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false; esp.Highlight.Enabled = false
            end
        end
    else
        for _, esp in pairs(ESPObjects) do
            esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false; esp.Highlight.Enabled = false
        end
    end
end)


-- ============================================================
--  CUSTOM NOTIFICATION (WITH LOGO & SLIDING FROM RIGHT)
-- ============================================================
local function BunnyGlowNotification()
    pcall(function()
        local sg = Instance.new("ScreenGui")
        sg.Name = "BunnyNotify"
        sg.ResetOnSpawn = false
        local parentToUse = CoreGui
        if not pcall(function() sg.Parent = CoreGui end) then
            parentToUse = LocalPlayer:WaitForChild("PlayerGui")
            sg.Parent = parentToUse
        end
        
        local frame = Instance.new("Frame", sg)
        frame.Size = UDim2.new(0, 270, 0, 50)
        -- Starts off-screen to the right
        frame.Position = UDim2.new(1, 300, 1, -80) 
        frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        frame.BackgroundTransparency = 0.4
        frame.BorderSizePixel = 0
        
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 8)
        
        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.fromRGB(0, 170, 255)
        stroke.Thickness = 2.5
        stroke.Transparency = 0.1
        
        -- Custom Image Logo
        local logo = Instance.new("ImageLabel", frame)
        logo.Size = UDim2.new(0, 30, 0, 30)
        logo.Position = UDim2.new(0, 12, 0.5, -15)
        logo.BackgroundTransparency = 1
        logo.Image = "rbxassetid://93890494180555"
        
        local textLabel = Instance.new("TextLabel", frame)
        textLabel.Size = UDim2.new(1, -55, 1, 0)
        textLabel.Position = UDim2.new(0, 52, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "Bunny Hub has fully loaded."
        textLabel.TextColor3 = Color3.fromRGB(240, 255, 255)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 13
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Animate In (Slide from right edge to 20px off the right edge)
        local ts = game:GetService("TweenService")
        local tIn = ts:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -290, 1, -80)})
        tIn:Play()
        
        -- Wait 4 seconds, then Animate Out and Destroy
        task.delay(4, function()
            local tOut = ts:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 1, -80)})
            tOut:Play()
            tOut.Completed:Wait()
            sg:Destroy()
        end)
    end)
end

BunnyGlowNotification()
