local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local guiParent = pcall(function() return CoreGui end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- // CONFIGURATION STATE // --
local Cfg = {
	HitboxRadius  = 60,
	HitboxEnabled = false,
	FastAttack    = false,
	AutoClick     = false
}

-- // MODERN THEME COLORS // --
local Theme = {
	MainBG = Color3.fromRGB(25, 25, 28),
	SideBG = Color3.fromRGB(18, 18, 20),
	TopBG  = Color3.fromRGB(15, 15, 17),
	Accent = Color3.fromRGB(85, 170, 255), -- Sleek Blue
	Text   = Color3.fromRGB(240, 240, 240),
	SubText= Color3.fromRGB(140, 140, 150),
	ElementBG = Color3.fromRGB(35, 35, 40)
}

-- // BLOX FRUIT LOGIC // --

-- 1. Hitbox Expander
RunService.RenderStepped:Connect(function()
	if not Cfg.HitboxEnabled then return end
	pcall(function()
		for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
			local root = enemy:FindFirstChild("HumanoidRootPart")
			local hum = enemy:FindFirstChild("Humanoid")
			if root and hum and hum.Health > 0 then
				root.Size = Vector3.new(Cfg.HitboxRadius, Cfg.HitboxRadius, Cfg.HitboxRadius)
				root.Transparency = 0.85
				root.CanCollide = false
			end
		end
	end)
end)

-- 2. Fast Attack (Combat Framework Hook)
task.spawn(function()
	local debug_getup = getupvalues or debug.getupvalues
	if not debug_getup then return end
	
	local combatModule = LocalPlayer.PlayerScripts:FindFirstChild("CombatFramework")
	if not combatModule then return end
	
	local combatFw = require(combatModule)
	local controllerTable
	
	pcall(function()
		local upvalues = debug_getup(combatFw)
		controllerTable = upvalues[2]
	end)

	while task.wait() do
		if Cfg.FastAttack then
			pcall(function()
				if controllerTable and controllerTable.activeController and controllerTable.activeController.equipped then
					local active = controllerTable.activeController
					active.timeToNextAttack = 0
					active.timeToNextBlock = 0
					active.increment = 3 
					active.hitboxMagnitude = Cfg.HitboxRadius 
				end
			end)
		end
	end
end)

-- 3. Auto Clicker (For Fruits/Swords)
task.spawn(function()
	while task.wait(0.05) do
		if Cfg.AutoClick and LocalPlayer.Character then
			local equippedTool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if equippedTool then
				VirtualUser:CaptureController()
				VirtualUser:ClickButton1(Vector2.new(0, 0))
			end
		end
	end
end)

-- // UI SETUP // --
for _, v in pairs(guiParent:GetChildren()) do if v.Name == "BloxFruitUI" then v:Destroy() end end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 320)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
MainFrame.BackgroundColor3 = Theme.MainBG
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Theme.TopBG
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BLOX FRUITS HUB"
Title.TextColor3 = Theme.Accent
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0.5, -12.5)
CloseBtn.BackgroundColor3 = Theme.MainBG
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.Parent = TopBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, -35)
Sidebar.Position = UDim2.new(0, 0, 0, 35)
Sidebar.BackgroundColor3 = Theme.SideBG
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -130, 1, -35)
ContentArea.Position = UDim2.new(0, 130, 0, 35)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SidebarLayout.Parent = Sidebar
Instance.new("UIPadding", Sidebar).PaddingTop = UDim.new(0, 10)

-- // TAB SYSTEM // --
local activeTab = nil
local function CreateTab(name)
	local TabBtn = Instance.new("TextButton")
	TabBtn.Size = UDim2.new(1, -20, 0, 30)
	TabBtn.BackgroundTransparency = 1
	TabBtn.Text = name
	TabBtn.TextColor3 = Theme.SubText
	TabBtn.Font = Enum.Font.Gotham
	TabBtn.TextSize = 13
	TabBtn.Parent = Sidebar

	local Marker = Instance.new("Frame")
	Marker.Size = UDim2.new(0, 3, 0.6, 0)
	Marker.Position = UDim2.new(0, -10, 0.2, 0)
	Marker.BackgroundColor3 = Theme.Accent
	Marker.BackgroundTransparency = 1
	Marker.Parent = TabBtn
	Instance.new("UICorner", Marker).CornerRadius = UDim.new(1, 0)

	local Scroll = Instance.new("ScrollingFrame")
	Scroll.Size = UDim2.new(1, 0, 1, 0)
	Scroll.BackgroundTransparency = 1
	Scroll.ScrollBarThickness = 3
	Scroll.ScrollBarImageColor3 = Theme.Accent
	Scroll.Visible = false
	Scroll.Parent = ContentArea

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0, 8)
	Layout.Parent = Scroll
	local Pad = Instance.new("UIPadding")
	Pad.PaddingTop = UDim.new(0, 15)
	Pad.PaddingLeft = UDim.new(0, 15)
	Pad.PaddingRight = UDim.new(0, 15)
	Pad.Parent = Scroll

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20) end)

	TabBtn.MouseButton1Click:Connect(function()
		if activeTab then
			TweenService:Create(activeTab.Btn, TweenInfo.new(0.2), {TextColor3 = Theme.SubText}):Play()
			TweenService:Create(activeTab.Marker, TweenInfo.new(0.2), {BackgroundTransparency = 1, Position = UDim2.new(0, -10, 0.2, 0)}):Play()
			activeTab.Frame.Visible = false
		end
		activeTab = {Btn = TabBtn, Marker = Marker, Frame = Scroll}
		TweenService:Create(TabBtn, TweenInfo.new(0.2), {TextColor3 = Theme.Text}):Play()
		TweenService:Create(Marker, TweenInfo.new(0.2), {BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0.2, 0)}):Play()
		Scroll.Visible = true
	end)

	if not activeTab then
		activeTab = {Btn = TabBtn, Marker = Marker, Frame = Scroll}
		TabBtn.TextColor3 = Theme.Text
		Marker.BackgroundTransparency = 0
		Marker.Position = UDim2.new(0, 0, 0.2, 0)
		Scroll.Visible = true
	end
	return Scroll
end

-- // UI BUILDERS // --
local function CreateToggle(parent, text, defaultVal, callback)
	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1, 0, 0, 40)
	Row.BackgroundColor3 = Theme.ElementBG
	Row.Parent = parent
	Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 6)

	local Lbl = Instance.new("TextLabel")
	Lbl.Size = UDim2.new(1, -60, 1, 0)
	Lbl.Position = UDim2.new(0, 15, 0, 0)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Theme.Text
	Lbl.Font = Enum.Font.Gotham
	Lbl.TextSize = 13
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = Row

	local SwitchBG = Instance.new("Frame")
	SwitchBG.Size = UDim2.new(0, 36, 0, 20)
	SwitchBG.Position = UDim2.new(1, -45, 0.5, -10)
	SwitchBG.BackgroundColor3 = defaultVal and Theme.Accent or Theme.MainBG
	SwitchBG.Parent = Row
	Instance.new("UICorner", SwitchBG).CornerRadius = UDim.new(1, 0)
	
	local Knob = Instance.new("Frame")
	Knob.Size = UDim2.new(0, 14, 0, 14)
	Knob.Position = defaultVal and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
	Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Knob.Parent = SwitchBG
	Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(1, 0, 1, 0)
	Btn.BackgroundTransparency = 1
	Btn.Text = ""
	Btn.Parent = Row

	local active = defaultVal
	Btn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			TweenService:Create(SwitchBG, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent}):Play()
			TweenService:Create(Knob, TweenInfo.new(0.2), {Position = UDim2.new(1, -17, 0.5, -7)}):Play()
		else
			TweenService:Create(SwitchBG, TweenInfo.new(0.2), {BackgroundColor3 = Theme.MainBG}):Play()
			TweenService:Create(Knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -7)}):Play()
		end
		callback(active)
	end)
end

local function CreateSlider(parent, text, min, max, def, callback)
	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1, 0, 0, 50)
	Row.BackgroundColor3 = Theme.ElementBG
	Row.Parent = parent
	Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 6)

	local Lbl = Instance.new("TextLabel")
	Lbl.Size = UDim2.new(1, -50, 0, 20)
	Lbl.Position = UDim2.new(0, 15, 0, 8)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Theme.Text
	Lbl.Font = Enum.Font.Gotham
	Lbl.TextSize = 13
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = Row

	local ValLbl = Instance.new("TextLabel")
	ValLbl.Size = UDim2.new(0, 40, 0, 20)
	ValLbl.Position = UDim2.new(1, -50, 0, 8)
	ValLbl.BackgroundTransparency = 1
	ValLbl.Text = tostring(def)
	ValLbl.TextColor3 = Theme.Accent
	ValLbl.Font = Enum.Font.Gotham
	ValLbl.TextSize = 13
	ValLbl.TextXAlignment = Enum.TextXAlignment.Right
	ValLbl.Parent = Row

	local Track = Instance.new("TextButton")
	Track.Size = UDim2.new(1, -30, 0, 4)
	Track.Position = UDim2.new(0, 15, 1, -14)
	Track.BackgroundColor3 = Theme.MainBG
	Track.Text = ""
	Track.AutoButtonColor = false
	Track.Parent = Row
	Instance.new("UICorner", Track).CornerRadius = UDim.new(1, 0)

	local Fill = Instance.new("Frame")
	local pct = (def - min) / (max - min)
	Fill.Size = UDim2.new(pct, 0, 1, 0)
	Fill.BackgroundColor3 = Theme.Accent
	Fill.Parent = Track
	Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

	local dragging = false
	local function update(input)
		local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
		Fill.Size = UDim2.new(pos, 0, 1, 0)
		local val = math.floor(min + ((max - min) * pos))
		ValLbl.Text = tostring(val)
		callback(val)
	end

	Track.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true update(input) end end)
	UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
	UserInputService.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end end)
end

-- // POPULATING TABS // --
local TabCombat = CreateTab("Combat")

CreateToggle(TabCombat, "Expand Mob Hitboxes (For Fruits)", false, function(v) 
	Cfg.HitboxEnabled = v 
end)

CreateSlider(TabCombat, "Hitbox Size Radius", 10, 150, 60, function(v) 
	Cfg.HitboxRadius = v 
end)

CreateToggle(TabCombat, "Fast Attack (No Cooldown)", false, function(v) 
	Cfg.FastAttack = v 
end)

CreateToggle(TabCombat, "Auto M1 Clicker (Hold Weapon)", false, function(v) 
	Cfg.AutoClick = v 
end)

-- // WINDOW CONTROLS // --
CloseBtn.MouseButton1Click:Connect(function()
	Cfg.HitboxEnabled = false
	Cfg.FastAttack = false
	Cfg.AutoClick = false
	ScreenGui:Destroy()
end)

local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true dragStart = input.Position startPos = MainFrame.Position
		input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
	end
end)
TopBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
