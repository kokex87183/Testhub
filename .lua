-- ============================================================
--  BUNNY HUB | Custom UI Mobile Edition
--  Advanced Aimlock, ESP, & Combat Features
-- ============================================================

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui          = game:GetService("CoreGui")
local Lighting         = game:GetService("Lighting")
local StarterGui       = game:GetService("StarterGui")
local TweenService     = game:GetService("TweenService")
local HttpService      = game:GetService("HttpService")
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
        FollowCursor   = false, -- Changed to false for mobile stability
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
        ToggleKey = Enum.KeyCode.K,
    },
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
--  CUSTOM UI BUILDER
-- ============================================================
local BunnyUI = Instance.new("ScreenGui")
BunnyUI.Name = "BunnyHubUI"
BunnyUI.ResetOnSpawn = false
BunnyUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() BunnyUI.Parent = CoreGui end)
if not BunnyUI.Parent then BunnyUI.Parent = LocalPlayer.PlayerGui end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3RGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
MainFrame.Parent = BunnyUI

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 8)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3RGB(0, 170, 255)
MainStroke.Thickness = 1.2
MainStroke.Transparency = 0.2

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3RGB(12, 12, 16)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Bunny Hub | rhoscript"
TitleLabel.TextColor3 = Color3RGB(240, 255, 255)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3RGB(200, 200, 200)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = TopBar

-- Draggable Logic
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
TopBar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Animation Toggle
local isUIOpen = false
local function ToggleUI()
    isUIOpen = not isUIOpen
    if isUIOpen then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 500, 0, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 500, 0, 350)}):Play()
    else
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 500, 0, 0)})
        tween:Play()
        tween.Completed:Connect(function() MainFrame.Visible = false end)
    end
end

CloseBtn.MouseButton1Click:Connect(ToggleUI)
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Settings.UI.ToggleKey then ToggleUI() end
end)

-- Tab System
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 30)
TabBar.Position = UDim2.new(0, 0, 0, 35)
TabBar.BackgroundColor3 = Color3RGB(15, 15, 20)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabList = Instance.new("UIListLayout", TabBar)
TabList.FillDirection = Enum.FillDirection.Horizontal
TabList.SortOrder = Enum.SortOrder.LayoutOrder

local TabIndicator = Instance.new("Frame")
TabIndicator.Size = UDim2.new(0, 62, 0, 2)
TabIndicator.Position = UDim2.new(0, 0, 1, -2)
TabIndicator.BackgroundColor3 = Color3RGB(0, 170, 255)
TabIndicator.BorderSizePixel = 0
TabIndicator.Parent = TabBar

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -65)
ContentFrame.Position = UDim2.new(0, 0, 0, 65)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local Tabs = {}
local function CreateTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 62, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = name
    btn.TextColor3 = Color3RGB(180, 180, 180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = TabBar
    
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ScrollBarThickness = 4
    page.ScrollBarImageColor3 = Color3RGB(0, 170, 255)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Parent = ContentFrame
    
    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    
    local padding = Instance.new("UIPadding", page)
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    
    table.insert(Tabs, {Btn = btn, Page = page})
    
    btn.MouseButton1Click:Connect(function()
        for _, t in ipairs(Tabs) do t.Page.Visible = false; t.Btn.TextColor3 = Color3RGB(180, 180, 180) end
        page.Visible = true; btn.TextColor3 = Color3RGB(255, 255, 255)
        TweenService:Create(TabIndicator, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = UDim2.new(0, btn.AbsolutePosition.X - TabBar.AbsolutePosition.X, 1, -2)}):Play()
    end)
    
    return page
end

-- UI Element Factories
local function CreateSection(parent, title)
    local sec = Instance.new("Frame")
    sec.Size = UDim2.new(1, 0, 0, 25)
    sec.BackgroundColor3 = Color3RGB(25, 25, 32)
    sec.BorderSizePixel = 0
    sec.Parent = parent
    
    local corner = Instance.new("UICorner", sec)
    corner.CornerRadius = UDim.new(0, 4)
    
    local lbl = Instance.new("TextLabel", sec)
    lbl.Size = UDim2.new(1, -10, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title
    lbl.TextColor3 = Color3RGB(0, 170, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
end

local function CreateToggle(parent, title, default, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3RGB(22, 22, 28)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.Parent = parent
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 4)
    
    local lbl = Instance.new("TextLabel", btn)
    lbl.Size = UDim2.new(1, -50, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title
    lbl.TextColor3 = Color3RGB(210, 210, 210)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local switch = Instance.new("Frame", btn)
    switch.Size = UDim2.new(0, 30, 0, 14)
    switch.Position = UDim2.new(1, -40, 0.5, -7)
    switch.BackgroundColor3 = Color3RGB(40, 40, 50)
    switch.BorderSizePixel = 0
    
    local switchCorner = Instance.new("UICorner", switch)
    switchCorner.CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame", switch)
    circle.Size = UDim2.new(0, 12, 0, 12)
    circle.Position = UDim2.new(0, 1, 0.5, -6)
    circle.BackgroundColor3 = Color3RGB(200, 200, 200)
    circle.BorderSizePixel = 0
    
    local circleCorner = Instance.new("UICorner", circle)
    circleCorner.CornerRadius = UDim.new(1, 0)
    
    local toggled = default or false
    local function UpdateToggle(anim)
        if toggled then
            circle.BackgroundColor3 = Color3RGB(0, 170, 255)
            if anim then TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 17, 0.5, -6)}):Play()
            else circle.Position = UDim2.new(0, 17, 0.5, -6) end
        else
            circle.BackgroundColor3 = Color3RGB(200, 200, 200)
            if anim then TweenService:Create(circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 1, 0.5, -6)}):Play()
            else circle.Position = UDim2.new(0, 1, 0.5, -6) end
        end
        callback(toggled)
    end
    UpdateToggle(false)
    
    btn.MouseButton1Click:Connect(function() toggled = not toggled; UpdateToggle(true) end)
end

local function CreateSlider(parent, title, min, max, default, step, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3RGB(22, 22, 28)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 4)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -10, 0, 20)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title .. ": " .. tostring(default)
    lbl.TextColor3 = Color3RGB(210, 210, 210)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local barBG = Instance.new("Frame", frame)
    barBG.Size = UDim2.new(1, -20, 0, 6)
    barBG.Position = UDim2.new(0, 10, 1, -13)
    barBG.BackgroundColor3 = Color3RGB(35, 35, 45)
    barBG.BorderSizePixel = 0
    
    local barCorner = Instance.new("UICorner", barBG)
    barCorner.CornerRadius = UDim.new(1, 0)
    
    local barFill = Instance.new("Frame", barBG)
    barFill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    barFill.BackgroundColor3 = Color3RGB(0, 170, 255)
    barFill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner", barFill)
    fillCorner.CornerRadius = UDim.new(1, 0)
    
    local sliding = false
    local function UpdateSlider(inp)
        local pos = mathClamp((inp.Position.X - barBG.AbsolutePosition.X) / barBG.AbsoluteSize.X, 0, 1)
        local val = min + (max - min) * pos
        val = mathFloor(val / step) * step
        val = mathClamp(val, min, max)
        barFill.Size = UDim2.new(pos, 0, 1, 0)
        lbl.Text = title .. ": " .. string.format("%.2f", val)
        callback(val)
    end
    
    barBG.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then sliding = true; UpdateSlider(input) end end)
    barBG.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then sliding = false end end)
    UserInputService.InputChanged:Connect(function(input) if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then UpdateSlider(input) end end)
end

local function CreateButton(parent, title, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3RGB(25, 25, 32)
    btn.BorderSizePixel = 0
    btn.Text = title
    btn.TextColor3 = Color3RGB(210, 210, 210)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = parent
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 4)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3RGB(0, 170, 255), TextColor3 = Color3RGB(255,255,255)}):Play()
        task.delay(0.2, function() TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3RGB(25, 25, 32), TextColor3 = Color3RGB(210, 210, 210)}):Play() end)
        callback()
    end)
end

local function CreateDropdown(parent, title, options, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundColor3 = Color3RGB(22, 22, 28)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = parent
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 4)
    
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -30, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title .. ": " .. default
    lbl.TextColor3 = Color3RGB(210, 210, 210)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 12
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local arrow = Instance.new("TextLabel", frame)
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -20, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▼"
    arrow.TextColor3 = Color3RGB(150,150,150)
    arrow.Font = Enum.Font.Gotham
    arrow.TextSize = 10
    
    local listFrame = Instance.new("Frame", frame)
    listFrame.Size = UDim2.new(1, 0, 0, #options * 25)
    listFrame.Position = UDim2.new(0, 0, 1, 0)
    listFrame.BackgroundColor3 = Color3RGB(28, 28, 35)
    listFrame.BorderSizePixel = 0
    
    local listCorner = Instance.new("UICorner", listFrame)
    listCorner.CornerRadius = UDim.new(0, 4)
    
    local listLayout = Instance.new("UIListLayout", listFrame)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local isOpen = false
    for i, opt in ipairs(options) do
        local optBtn = Instance.new("TextButton", listFrame)
        optBtn.Size = UDim2.new(1, 0, 0, 25)
        optBtn.BackgroundTransparency = 1
        optBtn.Text = opt
        optBtn.TextColor3 = Color3RGB(200, 200, 200)
        optBtn.Font = Enum.Font.Gotham
        optBtn.TextSize = 11
        optBtn.MouseButton1Click:Connect(function()
            lbl.Text = title .. ": " .. opt
            callback(opt)
            isOpen = false
            TweenService:Create(frame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 30)}):Play()
        end)
    end
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isOpen = not isOpen
            if isOpen then TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 0, 30 + (#options * 25))}):Play()
            else TweenService:Create(frame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 30)}):Play() end
        end
    end)
end

-- ============================================================
--  BUILDING THE TABS 
-- ============================================================
local HomePg = CreateTab("Home")
local CombatPg = CreateTab("Combat")
local AimPg = CreateTab("Aimlock")
local ESPPg = CreateTab("ESP")
local PlayerPg = CreateTab("Player")
local VisPg = CreateTab("Visuals")
local SetPg = CreateTab("Settings")

-- HOME
CreateSection(HomePg, "Welcome")
local welc = Instance.new("TextLabel", HomePg)
welc.Size = UDim2.new(1, 0, 0, 60)
welc.BackgroundTransparency = 1
welc.Text = "Welcome to Bunny Hub Mobile Edition. This custom menu features smooth animations, mobile optimizations, and powerful combat systems."
welc.TextColor3 = Color3RGB(180, 180, 190)
welc.Font = Enum.Font.Gotham
welc.TextSize = 12
welc.TextWrapped = true
welc.TextXAlignment = Enum.TextXAlignment.Left

-- COMBAT
CreateSection(CombatPg, "Targeting")
CreateDropdown(CombatPg, "Target Mode", {"Players", "NPC"}, "Players", function(v) Settings.Bunny.TargetMode = v end)

CreateSection(CombatPg, "Combat Hacks")
CreateToggle(CombatPg, "Silent Aim (Magic Bullets)", false, function(v) Settings.Bunny.SilentAim = v end)
CreateToggle(CombatPg, "Aimbot Gun", false, function(v) Settings.Bunny.AimbotGun = v end)
CreateToggle(CombatPg, "Aimbot Skill", false, function(v) Settings.Bunny.AimbotSkill = v end)
CreateToggle(CombatPg, "Fast Attack (M1)", false, function(v) Settings.Bunny.FastAttack = v end)
CreateSlider(CombatPg, "Fast Attack Delay", 0, 1, 0, 0.05, function(v) Settings.Bunny.FastAtkDelay = v end)

CreateSection(CombatPg, "Auto Features")
CreateToggle(CombatPg, "Auto Haki (Buso)", false, function(v) Settings.Bunny.AutoHaki = v end)
CreateToggle(CombatPg, "Auto V3", false, function(v) Settings.Bunny.AutoV3 = v end)
CreateToggle(CombatPg, "Auto V4", false, function(v) Settings.Bunny.AutoV4 = v end)

CreateSection(CombatPg, "World & Player")
CreateToggle(CombatPg, "Walk on Water", false, function(v) Settings.Bunny.WalkWater = v end)
CreateToggle(CombatPg, "Safe Mode", false, function(v) Settings.Bunny.SafeMode = v end)
CreateSlider(CombatPg, "Safe HP Threshold", 5, 80, 30, 1, function(v) Settings.Bunny.SafeHPThresh = v end)
CreateButton(CombatPg, "Get Click-TP Tool", function()
    local tool = Instance.new("Tool", LocalPlayer.Backpack)
    tool.Name = "Bunni TP"; tool.RequiresHandle = false
    tool.Activated:Connect(function()
        local m = LocalPlayer:GetMouse()
        if m.Hit and LocalPlayer.Character then LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameNew(m.Hit.Position + Vector3New(0, 5, 0)) end
    end)
    Notify("Tool Added", "Click TP in backpack!", 2)
end)
CreateButton(CombatPg, "Apply FPS Boost", function()
    settings().Rendering.QualityLevel = "Level01"; Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9
    for _, e in ipairs(Lighting:GetChildren()) do if e:IsA("PostEffect") then e:Destroy() end end
    for _, v in ipairs(game:GetDescendants()) do pcall(function()
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = false
        elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
        elseif v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic; v.Reflectance = 0; v.CastShadow = false end
    end) end
    Notify("High Performance", "FPS Boost Applied!", 2)
end)

-- AIMLOCK
CreateSection(AimPg, "Aimlock Control")
CreateToggle(AimPg, "Enable Aimlock", false, function(v) Settings.Aimlock.Enabled = v end)
CreateToggle(AimPg, "Wall Check", true, function(v) Settings.Aimlock.WallCheck = v end)
CreateToggle(AimPg, "Team Check", true, function(v) Settings.Aimlock.TeamCheck = v end)

CreateSection(AimPg, "Aim Tuning")
CreateDropdown(AimPg, "Aim Mode", {"Smart", "Chaos", "Head", "Torso", "Limbs", "HRP"}, "Smart", function(v) Settings.Aimlock.AimMode = v end)
CreateToggle(AimPg, "Enable Prediction", true, function(v) Settings.Aimlock.PredictionEnabled = v end)
CreateSlider(AimPg, "Prediction Strength", 0, 0.3, 0.135, 0.005, function(v) Settings.Aimlock.Prediction = v end)

-- ESP
CreateSection(ESPPg, "ESP Core")
CreateToggle(ESPPg, "Enable ESP", false, function(v) Settings.Visuals.ESPEnabled = v end)
CreateToggle(ESPPg, "Team Check", true, function(v) Settings.Visuals.TeamCheck = v end)
CreateToggle(ESPPg, "ESP Boxes", true, function(v) Settings.Visuals.ESPBoxes = v end)
CreateToggle(ESPPg, "Show Names", true, function(v) Settings.Visuals.ESPNames = v end)
CreateToggle(ESPPg, "Health Bar", true, function(v) Settings.Visuals.HealthBar = v end)
CreateToggle(ESPPg, "Enable Chams", false, function(v) Settings.Visuals.ChamsEnabled = v end)

-- PLAYER
CreateSection(PlayerPg, "Walk Speed & Jump Power")
CreateToggle(PlayerPg, "Enable Walk Speed", false, function(v) Settings.Player.WalkSpeedEnabled = v end)
CreateSlider(PlayerPg, "Walk Speed", 16, 250, 16, 1, function(v) Settings.Player.WalkSpeed = v end)
CreateToggle(PlayerPg, "Enable Jump Power", false, function(v) Settings.Player.JumpPowerEnabled = v end)
CreateSlider(PlayerPg, "Jump Power", 50, 300, 50, 5, function(v) Settings.Player.JumpPower = v end)

-- VISUALS
CreateSection(VisPg, "FOV Circle")
CreateToggle(VisPg, "Show FOV Circle", true, function(v) Settings.FOV.Visible = v end)
CreateSlider(VisPg, "FOV Radius", 30, 600, 150, 5, function(v) Settings.FOV.Radius = v end)
CreateToggle(VisPg, "FOV Follows Finger/Mouse", false, function(v) Settings.FOV.FollowCursor = v end) -- Default off for mobile!

-- SETTINGS
CreateSection(SetPg, "Config System (Requires Executor Support)")
CreateButton(SetPg, "Save Config", function()
    pcall(function()
        if writefile then
            writefile("BunnyHub/Config.json", HttpService:JSONEncode(Settings))
            Notify("Config", "Saved Successfully!", 2)
        else Notify("Error", "Executor does not support writefile.", 3) end
    end)
end)
CreateButton(SetPg, "Load Config", function()
    pcall(function()
        if readfile then
            local data = HttpService:JSONDecode(readfile("BunnyHub/Config.json"))
            for k, v in pairs(data) do Settings[k] = v end
            Notify("Config", "Loaded Successfully! (Restart script to fully apply)", 3)
        else Notify("Error", "Executor does not support readfile.", 3) end
    end)
end)
CreateButton(SetPg, "Reset Config", function()
    pcall(function()
        if delfile then delfile("BunnyHub/Config.json") end
        Notify("Config", "Config reset! Re-execute script to apply defaults.", 3)
    end)
end)

-- Open First Tab automatically
Tabs[1].Btn.MouseButton1Click:Fire()

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

local function CreateESP(player)
    pcall(function()
        local esp = {
            Box = Drawing.new("Square"),
            Name = Drawing.new("Text"),
            BarBG = Drawing.new("Square"),
            BarFG = Drawing.new("Square"),
            Highlight = Instance.new("Highlight", ChamsFolder),
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

spawn(function()
    while wait(0.5) do pcall(function()
        local function scan(c) for _, v in pairs(c:GetChildren()) do if v:IsA("Tool") and v:FindFirstChild("RemoteFunctionShoot") then SelectWeaponGun = v.Name end end end
        scan(LocalPlayer.Backpack); if LocalPlayer.Character then scan(LocalPlayer.Character) end
    end) end
end)

spawn(function()
    while task.wait(0.5) do pcall(function()
        if not Settings.Bunny.AutoHaki then return end
        local char = LocalPlayer.Character
        if char and not char:FindFirstChild("HasBuso") then ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso") end
    end) end
end)

spawn(function()
    while task.wait(0.5) do pcall(function()
        if Settings.Bunny.AutoV3 then ReplicatedStorage.Remotes.CommE:FireServer("ActivateAbility") end
        if Settings.Bunny.AutoV4 then ReplicatedStorage.Remotes.CommE:FireServer("Awakening") end
    end) end
end)

spawn(function()
    while wait(0.5) do pcall(function()
        local plane = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("WaterBase-Plane")
        if plane then
            if Settings.Bunny.WalkWater then plane.Size = Vector3New(plane.Size.X, 112, plane.Size.Z)
            else plane.Size = Vector3New(plane.Size.X, 80, plane.Size.Z) end
        end
    end) end
end)

spawn(function()
    while task.wait(0.2) do pcall(function()
        if not Settings.Bunny.SafeMode then return end
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hum and hrp then
            local thresh = (Settings.Bunny.SafeHPThresh / 100) * hum.MaxHealth
            if hum.Health <= thresh then hrp.CFrame = hrp.CFrame + Vector3New(0, 200, 0) end
        end
    end) end
end)

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
                if LocalPlayer:DistanceFromCharacter(head.Position) < 100 then table.insert(list, {e, head}); base = head end
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
            for _, d in ipairs(eList) do local dir = (d[1].HumanoidRootPart.Position - char:GetPivot().Position).Unit; pcall(function() tool.LeftClickRemote:FireServer(dir, 1) end) end
        elseif #eList > 0 then
            pcall(function() RegAtk:FireServer(0) end); pcall(function() RegHit:FireServer(b1 or b2, eList) end)
        end
        task.wait(0)
    end
end)

local Mouse = LocalPlayer:GetMouse()
local _raw = getrawmetatable(game)
local _origNC = _raw.__namecall
local _origIndex = _raw.__index
setreadonly(_raw, false)

_raw.__index = newcclosure(function(t, k)
    if Settings.Bunny.SilentAim and not checkcaller() and t == Mouse then
        if k == "Hit" then local tHRP = GetBunnyTarget(); if tHRP then return CFrameNew(tHRP.Position) end
        elseif k == "Target" then local tHRP = GetBunnyTarget(); if tHRP then return tHRP end end
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
                    if typeof(v) == "Vector3" then args[i] = tHRP.Position
                    elseif typeof(v) == "CFrame" then args[i] = CFrameNew(v.Position, tHRP.Position) end
                end
            end
        end
    end
    return _origNC(self, unpack(args))
end)
setreadonly(_raw, true)

RunService.Heartbeat:Connect(function()
    if Settings.Bunny.AimbotGun then
        local hrp = GetBunnyTarget(); if hrp and LocalPlayer.Character then
            local gun = LocalPlayer.Character:FindFirstChild(SelectWeaponGun)
            if gun and gun:FindFirstChild("RemoteFunctionShoot") then pcall(function() gun.RemoteFunctionShoot:InvokeServer(hrp.Position, hrp) end) end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Settings.Bunny.AimbotSkill then
        local hrp = GetBunnyTarget(); if hrp and LocalPlayer.Character then
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and LocalPlayer.Character:FindFirstChild(tool.Name) then
                local t = LocalPlayer.Character[tool.Name]
                if t:FindFirstChild("MousePos") then pcall(function() t.RemoteEvent:FireServer(hrp.Position) end) end
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
    local fovPos = Settings.FOV.FollowCursor and UserInputService:GetMouseLocation() or Vector2New(Camera.ViewportSize.X * 0.5, Camera.ViewportSize.Y * 0.5)
    FOVRing.Position = fovPos; FOVRing.Radius = Settings.FOV.Radius; FOVRing.Visible = Settings.FOV.Visible; FOVRing.Color = Settings.FOV.Color

    local myChar = LocalPlayer.Character
    if myChar then
        local hum = myChar:FindFirstChildOfClass("Humanoid")
        if hum then
            if Settings.Player.WalkSpeedEnabled then hum.WalkSpeed = Settings.Player.WalkSpeed end
            if Settings.Player.JumpPowerEnabled then hum.JumpPower = Settings.Player.JumpPower end
        end
    end

    if Settings.Visuals.ESPEnabled or Settings.Visuals.ChamsEnabled then
        for p, esp in pairs(ESPObjects) do
            local char = p.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if root and hum and hum.Health > 0 and (p.Team ~= LocalPlayer.Team or not Settings.Visuals.TeamCheck) then
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                local dist = (Camera.CFrame.Position - root.Position).Magnitude
                
                if Settings.Visuals.ChamsEnabled then esp.Highlight.Adornee = char; esp.Highlight.Enabled = true; esp.Highlight.FillColor = Settings.Visuals.ChamsFillColor; esp.Highlight.OutlineColor = Settings.Visuals.ChamsOutlineColor
                else esp.Highlight.Enabled = false end

                if Settings.Visuals.ESPEnabled and onScreen and dist <= Settings.Visuals.MaxESPDistance then
                    local topPos = Camera:WorldToViewportPoint(root.Position + Vector3New(0, 3, 0))
                    local bottomPos = Camera:WorldToViewportPoint(root.Position - Vector3New(0, 2.5, 0))
                    local boxH = mathMax(2, mathAbs(topPos.Y - bottomPos.Y)); local boxW = boxH * 0.55

                    local isVisible = true
                    if Settings.Visuals.UseVisColors then
                        local rayParams = RaycastParams.new(); rayParams.FilterDescendantsInstances = {LocalPlayer.Character}; rayParams.FilterType = Enum.RaycastFilterType.Exclude
                        local rayResult = workspace:Raycast(Camera.CFrame.Position, (root.Position - Camera.CFrame.Position).Unit * dist, rayParams)
                        if rayResult and rayResult.Instance and not rayResult.Instance:IsDescendantOf(char) then isVisible = false end
                    end

                    local espColor = (Settings.Visuals.UseVisColors and not isVisible) and Settings.Visuals.HiddenColor or Settings.Visuals.VisColor

                    esp.Box.Visible = Settings.Visuals.ESPBoxes; esp.Box.Size = Vector2New(boxW, boxH); esp.Box.Position = Vector2New(topPos.X - boxW/2, topPos.Y); esp.Box.Color = espColor
                    esp.Name.Visible = Settings.Visuals.ESPNames; esp.Name.Text = Settings.Visuals.ESPNameStyle == "Display Name" and p.DisplayName or p.Name; esp.Name.Position = Vector2New(topPos.X, topPos.Y - 16); esp.Name.Color = Settings.Visuals.UseCustomNameColor and Settings.Visuals.ESPNameColor or espColor

                    local hpPct = hum.Health / (hum.MaxHealth > 0 and hum.MaxHealth or 100)
                    esp.BarBG.Visible = Settings.Visuals.HealthBar; esp.BarBG.Size = Vector2New(3, boxH); esp.BarBG.Position = Vector2New(topPos.X - boxW/2 - 5, topPos.Y)
                    esp.BarFG.Visible = Settings.Visuals.HealthBar; esp.BarFG.Size = Vector2New(3, boxH * hpPct); esp.BarFG.Position = Vector2New(topPos.X - boxW/2 - 5, topPos.Y + boxH - (boxH * hpPct)); esp.BarFG.Color = GetHealthColor(hpPct)
                else
                    esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false
                end
            else
                esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false; esp.Highlight.Enabled = false
            end
        end
    else
        for _, esp in pairs(ESPObjects) do esp.Box.Visible = false; esp.Name.Visible = false; esp.BarBG.Visible = false; esp.BarFG.Visible = false; esp.Highlight.Enabled = false end
    end
end)

-- ============================================================
--  CUSTOM NOTIFICATION (WITH LOGO & SLIDING FROM RIGHT)
-- ============================================================
local function BunnyGlowNotification()
    pcall(function()
        local sg = Instance.new("ScreenGui"); sg.Name = "BunnyNotify"; sg.ResetOnSpawn = false
        if not pcall(function() sg.Parent = CoreGui end) then sg.Parent = LocalPlayer:WaitForChild("PlayerGui") end
        
        local frame = Instance.new("Frame", sg); frame.Size = UDim2.new(0, 270, 0, 50); frame.Position = UDim2.new(1, 300, 1, -80); frame.BackgroundColor3 = Color3RGB(15, 15, 20); frame.BackgroundTransparency = 0.4; frame.BorderSizePixel = 0
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", frame); stroke.Color = Color3RGB(0, 170, 255); stroke.Thickness = 1.2; stroke.Transparency = 0.1
        
        local logo = Instance.new("ImageLabel", frame); logo.Size = UDim2.new(0, 30, 0, 30); logo.Position = UDim2.new(0, 12, 0.5, -15); logo.BackgroundTransparency = 1; logo.Image = "rbxassetid://93880685309116"
        local textLabel = Instance.new("TextLabel", frame); textLabel.Size = UDim2.new(1, -55, 1, 0); textLabel.Position = UDim2.new(0, 52, 0, 0); textLabel.BackgroundTransparency = 1; textLabel.Text = "Bunny Hub has fully loaded."; textLabel.TextColor3 = Color3RGB(240, 255, 255); textLabel.Font = Enum.Font.GothamBold; textLabel.TextSize = 13; textLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -290, 1, -80)}):Play()
        task.delay(4, function()
            local tOut = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 1, -80)}); tOut:Play(); tOut.Completed:Wait(); sg:Destroy()
        end)
    end)
end

-- Start UI Open & Show Notification
ToggleUI()
BunnyGlowNotification()
