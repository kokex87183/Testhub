local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local guiParent = pcall(function() return CoreGui end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- // EXACT WIN COORDINATES // --
local WinTargets = {
	["World 1"] = {
		["1 Win"] = Vector3.new(-13.25, 11.31, 285.25),
		["3 Wins"] = Vector3.new(-16.12, 10.65, 507.26),
		["10 Wins"] = Vector3.new(-15.92, 77.92, 774.04),
		["20 Wins"] = Vector3.new(-14.89, 78.94, 1108.95),
		["50 Wins"] = Vector3.new(-20.89, 78.4, 1412.88),
		["100 Wins"] = Vector3.new(-539.85, 55.15, 1448.3),
		["150 Wins"] = Vector3.new(-1008.4, 55.29, 1451.05),
		["300 Wins"] = Vector3.new(-1123.63, 298.61, 1452.2),
		["500 Wins"] = Vector3.new(-2973.39, 299.56, 1449.55),
		["1000 Wins"] = Vector3.new(-3939.01, 299.56, 1447.85),
		["2500 Wins"] = Vector3.new(-4368.75, 474.62, 1513.47),
		["10000 Wins"] = Vector3.new(-5341.17, 472.4, 1459.22),
		["25000 Wins"] = Vector3.new(-5398.84, 469.43, 1459.22)
	},
	["World 2"] = {
		["250k Wins"] = Vector3.new(-415.55, 500.99, 189.32),
		["400k Wins"] = Vector3.new(-416.32, 500.83, 433.69),
		["600k Wins"] = Vector3.new(-417.61, 608.64, 607.74),
		["1M Wins"] = Vector3.new(-418.31, 608.6, 841.45),
		["1.5M Wins"] = Vector3.new(-415.33, 608.22, 1261.47),
		["2.5M Wins"] = Vector3.new(-417.13, 625.91, 2413.93),
		["4M Wins"] = Vector3.new(-413.79, 624.07, 2650.47),
		["6M Wins"] = Vector3.new(-414.19, 626.78, 3159.31),
		["10M Wins"] = Vector3.new(-59.9, 624.76, 3881.49),
		["15M Wins"] = Vector3.new(595.68, 624.85, 3863.84),
		["16M Wins"] = Vector3.new(544.92, 622.38, 3863.84)
	}
}

-- Ordered lists to ensure it tweens sequentially
local W1Keys = {"1 Win", "3 Wins", "10 Wins", "20 Wins", "50 Wins", "100 Wins", "150 Wins", "300 Wins", "500 Wins", "1000 Wins", "2500 Wins", "10000 Wins", "25000 Wins"}
local W2Keys = {"250k Wins", "400k Wins", "600k Wins", "1M Wins", "1.5M Wins", "2.5M Wins", "4M Wins", "6M Wins", "10M Wins", "15M Wins", "16M Wins"}

-- // CONFIGURATION STATE // --
local Cfg = {
	SelectedWorld = "World 1",
	AutoWinSpeed  = 75,
	AvoidMobs     = true,
	SafeHeight    = 50, -- How high above the mobs to fly
	Fly           = false,
	FlySpeed      = 300,
	Noclip        = false,
	WalkSpeed     = 16,
	JumpPower     = 50,
	InfiniteJump  = false,
	AutoWin       = false,
	ESP_Enabled   = false,
	ESP_Names     = false,
	ESP_Distance  = false,
	ESP_Color     = Color3.fromRGB(255, 50, 50)
}

-- // THEME COLORS // --
local Theme = {
	MainBG = Color3.fromRGB(15, 15, 20),
	SideBG = Color3.fromRGB(22, 22, 28),
	TopBG  = Color3.fromRGB(20, 20, 25),
	Accent = Color3.fromRGB(0, 230, 255),
	Text   = Color3.fromRGB(240, 240, 255),
	SubText= Color3.fromRGB(150, 150, 170),
	ElementBG = Color3.fromRGB(28, 28, 35)
}

-- // NOTIFICATION // --
local function notify(title, text, time)
	pcall(function() game:GetService("StarterGui"):SetCore("SendNotification", { Title = title, Text = text, Duration = time or 3 }) end)
end

-- // SEQUENTIAL & ELEVATED TWEEN LOGIC // --
local activeTween = nil

local function doSingleTween(targetPos, speed)
	local char = LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false end
	
	local dist = (root.Position - targetPos).Magnitude
	-- Prevent division by zero if we are already there
	if dist < 1 then return Cfg.AutoWin end 
	
	local duration = dist / speed
	
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	activeTween = TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(targetPos)})
	
	local completed = false
	local connection
	connection = activeTween.Completed:Connect(function() completed = true end)
	
	activeTween:Play()
	
	while not completed and Cfg.AutoWin and root.Parent do
		task.wait(0.05)
	end
	
	if connection then connection:Disconnect() end
	if activeTween then activeTween:Cancel() activeTween = nil end
	
	return Cfg.AutoWin
end

local function executeSafeTarget(targetPos, speed)
	if not Cfg.AvoidMobs then
		-- Straight line
		return doSingleTween(targetPos, speed)
	else
		local char = LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if not root then return false end
		
		local safeY = targetPos.Y + Cfg.SafeHeight
		
		-- Step 1: Fly straight up to safe height
		local upPos = Vector3.new(root.Position.X, safeY, root.Position.Z)
		if not doSingleTween(upPos, speed) then return false end
		
		-- Step 2: Fly horizontally across the sky (above the mobs)
		local hoverPos = Vector3.new(targetPos.X, safeY, targetPos.Z)
		if not doSingleTween(hoverPos, speed) then return false end
		
		-- Step 3: Drop straight down onto the Win Block
		if not doSingleTween(targetPos, speed) then return false end
		
		return true
	end
end

-- // CORE FLY LOGIC // --
local FlyBV, FlyBG, FlyConn

local function StartFly()
	local char = LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not root or not hum then return end

	if FlyBV then FlyBV:Destroy() end
	if FlyBG then FlyBG:Destroy() end
	if FlyConn then FlyConn:Disconnect() end

	hum.PlatformStand = true
	FlyBG = Instance.new("BodyGyro")
	FlyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	FlyBG.P = 5e4
	FlyBG.CFrame = root.CFrame
	FlyBG.Parent = root

	FlyBV = Instance.new("BodyVelocity")
	FlyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	FlyBV.Velocity = Vector3.zero
	FlyBV.Parent = root

	FlyConn = RunService.RenderStepped:Connect(function()
		if not Cfg.Fly then return end
		local cam = Camera.CFrame
		local spd = Cfg.FlySpeed
		local vel = Vector3.zero

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.LookVector * spd end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.LookVector * spd end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.RightVector * spd end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.RightVector * spd end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.yAxis * spd end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then vel = vel - Vector3.yAxis * spd end

		FlyBV.Velocity = vel
		FlyBG.CFrame = cam
	end)
end

local function StopFly()
	Cfg.Fly = false
	if FlyConn then FlyConn:Disconnect(); FlyConn = nil end
	if FlyBV then FlyBV:Destroy(); FlyBV = nil end
	if FlyBG then FlyBG:Destroy(); FlyBG = nil end
	local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.PlatformStand = false hum:ChangeState(Enum.HumanoidStateType.Running) end
end

-- // ESP LOGIC // --
local espHighlights = {}
local espGuis = {}

local function updateESP()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			local char = plr.Character
			if char then
				if Cfg.ESP_Enabled then
					if not espHighlights[plr] then
						local hl = Instance.new("Highlight")
						hl.Name = "OctaESP"
						hl.FillTransparency = 1
						hl.OutlineTransparency = 0
						hl.OutlineColor = Cfg.ESP_Color
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						hl.Parent = char
						espHighlights[plr] = hl
					else espHighlights[plr].OutlineColor = Cfg.ESP_Color espHighlights[plr].Parent = char end
				else
					if espHighlights[plr] then espHighlights[plr]:Destroy() espHighlights[plr] = nil end
				end

				local head = char:FindFirstChild("Head")
				local root = char:FindFirstChild("HumanoidRootPart")
				local lpRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if Cfg.ESP_Names or Cfg.ESP_Distance then
					if head then
						if not espGuis[plr] then
							local bg = Instance.new("BillboardGui")
							bg.Name = "OctaNameTag"
							bg.Adornee = head
							bg.Size = UDim2.new(0, 200, 0, 20)
							bg.StudsOffset = Vector3.new(0, 2.5, 0)
							bg.AlwaysOnTop = true
							local txt = Instance.new("TextLabel")
							txt.Size = UDim2.new(1, 0, 1, 0)
							txt.BackgroundTransparency = 1
							txt.TextColor3 = Color3.fromRGB(255, 255, 255)
							txt.TextStrokeTransparency = 0.3
							txt.Font = Enum.Font.Montserrat
							txt.TextSize = 12
							txt.Parent = bg
							bg.Parent = head
							espGuis[plr] = {bg, txt}
						end

						local displayStr = ""
						if Cfg.ESP_Names then displayStr = plr.Name end
						if Cfg.ESP_Distance and lpRoot and root then
							local dist = math.floor((lpRoot.Position - root.Position).Magnitude)
							displayStr = displayStr .. (displayStr ~= "" and " | " or "") .. dist .. "m"
						end
						
						espGuis[plr][2].Text = displayStr
						espGuis[plr][1].Parent = head
					end
				else
					if espGuis[plr] then espGuis[plr][1]:Destroy() espGuis[plr] = nil end
				end
			else
				if espHighlights[plr] then espHighlights[plr]:Destroy() espHighlights[plr] = nil end
				if espGuis[plr] then espGuis[plr][1]:Destroy() espGuis[plr] = nil end
			end
		end
	end
end

task.spawn(function() while task.wait(0.1) do updateESP() end end)
Players.PlayerRemoving:Connect(function(plr)
	if espHighlights[plr] then espHighlights[plr]:Destroy() espHighlights[plr] = nil end
	if espGuis[plr] then espGuis[plr][1]:Destroy() espGuis[plr] = nil end
end)

-- // DELETE OLD GUI // --
for _, v in pairs(guiParent:GetChildren()) do if v.Name == "OctaHubUI" then v:Destroy() end end

-- // UI SETUP // --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OctaHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Theme.MainBG
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(40, 40, 50)

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Theme.TopBG
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

local TopPatch = Instance.new("Frame")
TopPatch.Size = UDim2.new(1, 0, 0.5, 0)
TopPatch.Position = UDim2.new(0, 0, 0.5, 0)
TopPatch.BackgroundColor3 = Theme.TopBG
TopPatch.BorderSizePixel = 0
TopPatch.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "OCTA HUB"
Title.TextColor3 = Theme.Accent
Title.Font = Enum.Font.Montserrat
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 25, 0, 25)
MinBtn.Position = UDim2.new(1, -35, 0.5, -12)
MinBtn.BackgroundColor3 = Theme.ElementBG
MinBtn.Text = "—"
MinBtn.TextColor3 = Theme.Text
MinBtn.Font = Enum.Font.Montserrat
MinBtn.TextSize = 14
MinBtn.Parent = TopBar
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 4)

-- Sidebar
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
local Tabs = {}
local activeTab = nil

local function CreateTab(name)
	local TabBtn = Instance.new("TextButton")
	TabBtn.Size = UDim2.new(1, -20, 0, 30)
	TabBtn.BackgroundTransparency = 1
	TabBtn.Text = name
	TabBtn.TextColor3 = Theme.SubText
	TabBtn.Font = Enum.Font.Montserrat
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
	Scroll.ScrollBarThickness = 2
	Scroll.ScrollBarImageColor3 = Theme.Accent
	Scroll.Visible = false
	Scroll.Parent = ContentArea

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0, 8)
	Layout.Parent = Scroll
	local Pad = Instance.new("UIPadding")
	Pad.PaddingTop = UDim.new(0, 10)
	Pad.PaddingLeft = UDim.new(0, 15)
	Pad.PaddingRight = UDim.new(0, 15)
	Pad.Parent = Scroll

	Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
	end)

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

-- // COMPONENT BUILDERS // --
local function CreateToggle(parent, text, defaultVal, callback)
	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1, 0, 0, 36)
	Row.BackgroundColor3 = Theme.ElementBG
	Row.Parent = parent
	Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 6)

	local Lbl = Instance.new("TextLabel")
	Lbl.Size = UDim2.new(1, -60, 1, 0)
	Lbl.Position = UDim2.new(0, 15, 0, 0)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Theme.Text
	Lbl.Font = Enum.Font.Montserrat
	Lbl.TextSize = 12
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = Row

	local Box = Instance.new("Frame")
	Box.Size = UDim2.new(0, 20, 0, 20)
	Box.Position = UDim2.new(1, -35, 0.5, -10)
	Box.BackgroundColor3 = Theme.MainBG
	Box.Parent = Row
	Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)
	local BoxStroke = Instance.new("UIStroke")
	BoxStroke.Color = defaultVal and Theme.Accent or Theme.SubText
	BoxStroke.Thickness = 1
	BoxStroke.Parent = Box

	local Check = Instance.new("Frame")
	Check.Size = defaultVal and UDim2.new(1, -8, 1, -8) or UDim2.new(0, 0, 0, 0)
	Check.Position = UDim2.new(0.5, 0, 0.5, 0)
	Check.BackgroundColor3 = Theme.Accent
	Check.AnchorPoint = Vector2.new(0.5, 0.5)
	Check.Parent = Box
	Instance.new("UICorner", Check).CornerRadius = UDim.new(0, 3)

	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(1, 0, 1, 0)
	Btn.BackgroundTransparency = 1
	Btn.Text = ""
	Btn.Parent = Row

	local active = defaultVal
	Btn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			TweenService:Create(BoxStroke, TweenInfo.new(0.2), {Color = Theme.Accent}):Play()
			TweenService:Create(Check, TweenInfo.new(0.2), {Size = UDim2.new(1, -8, 1, -8)}):Play()
		else
			TweenService:Create(BoxStroke, TweenInfo.new(0.2), {Color = Theme.SubText}):Play()
			TweenService:Create(Check, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
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
	Lbl.Position = UDim2.new(0, 15, 0, 6)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Theme.Text
	Lbl.Font = Enum.Font.Montserrat
	Lbl.TextSize = 12
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = Row

	local ValLbl = Instance.new("TextLabel")
	ValLbl.Size = UDim2.new(0, 40, 0, 20)
	ValLbl.Position = UDim2.new(1, -50, 0, 6)
	ValLbl.BackgroundTransparency = 1
	ValLbl.Text = tostring(def)
	ValLbl.TextColor3 = Theme.Accent
	ValLbl.Font = Enum.Font.Montserrat
	ValLbl.TextSize = 12
	ValLbl.TextXAlignment = Enum.TextXAlignment.Right
	ValLbl.Parent = Row

	local Track = Instance.new("TextButton")
	Track.Size = UDim2.new(1, -30, 0, 6)
	Track.Position = UDim2.new(0, 15, 1, -16)
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

	Track.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true update(input) end end)
	UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
	UserInputService.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end end)
end

local function CreateDropdown(parent, text, options, callback)
	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1, 0, 0, 36)
	Row.BackgroundColor3 = Theme.ElementBG
	Row.Parent = parent
	Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 6)

	local Lbl = Instance.new("TextLabel")
	Lbl.Size = UDim2.new(0.4, 0, 1, 0)
	Lbl.Position = UDim2.new(0, 15, 0, 0)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Theme.Text
	Lbl.Font = Enum.Font.Montserrat
	Lbl.TextSize = 12
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = Row

	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(0, 160, 0, 24)
	Btn.Position = UDim2.new(1, -175, 0.5, -12)
	Btn.BackgroundColor3 = Theme.MainBG
	Btn.Text = options[1]
	Btn.TextColor3 = Theme.Accent
	Btn.Font = Enum.Font.Montserrat
	Btn.TextSize = 10
	Btn.AutoButtonColor = false
	Btn.Parent = Row
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
	local btnStroke = Instance.new("UIStroke")
	btnStroke.Color = Theme.SubText
	btnStroke.Thickness = 1
	btnStroke.Parent = Btn

	local obj = {}
	local currentOptions = options
	local idx = 1

	Btn.MouseButton1Click:Connect(function()
		idx = (idx % #currentOptions) + 1
		Btn.Text = currentOptions[idx]
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.SideBG}):Play()
		task.wait(0.1)
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.MainBG}):Play()
		callback(currentOptions[idx])
	end)
	
	function obj:Refresh(newOptions)
		currentOptions = newOptions
		idx = 1
		Btn.Text = currentOptions[1]
		callback(currentOptions[1])
	end
	
	return obj
end

local function CreateButton(parent, text, callback)
	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(1, 0, 0, 36)
	Btn.BackgroundColor3 = Theme.Accent
	Btn.Text = text
	Btn.TextColor3 = Color3.fromRGB(20, 20, 25)
	Btn.Font = Enum.Font.Montserrat
	Btn.TextSize = 13
	Btn.AutoButtonColor = false
	Btn.Parent = parent
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

	Btn.MouseButton1Click:Connect(function()
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundTransparency = 0.3}):Play()
		task.wait(0.1)
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundTransparency = 0}):Play()
		callback()
	end)
end

-- // POPULATING TABS // --
local TabFarm = CreateTab("Auto Win")
local TabVisuals = CreateTab("Visuals (ESP)")
local TabMove = CreateTab("Movement")
local TabChar = CreateTab("Player")
local TabMisc = CreateTab("Misc")

-- Auto Farm Tab
CreateDropdown(TabFarm, "Select World", {"World 1", "World 2"}, function(v) 
	Cfg.SelectedWorld = v 
end)

CreateSlider(TabFarm, "Tween Speed", 30, 200, 75, function(v) Cfg.AutoWinSpeed = v end)

CreateToggle(TabFarm, "Avoid Mobs (Elevated Path)", true, function(v) Cfg.AvoidMobs = v end)
CreateSlider(TabFarm, "Safe Path Height", 10, 200, 50, function(v) Cfg.SafeHeight = v end)

CreateToggle(TabFarm, "Enable Seqential Auto Win", false, function(v)
	Cfg.AutoWin = v
	if v then
		task.spawn(function()
			while Cfg.AutoWin do
				local char = LocalPlayer.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					
					Cfg.Noclip = true -- Prevent bumping into walls during tween
					
					local currentKeys = (Cfg.SelectedWorld == "World 1") and W1Keys or W2Keys
					local currentTargets = WinTargets[Cfg.SelectedWorld]
					
					-- Loop through every win block in order
					for _, targetKey in ipairs(currentKeys) do
						if not Cfg.AutoWin then break end
						
						local targetPos = currentTargets[targetKey]
						if Cfg.AvoidMobs then
							notify("Octa Hub", "Hovering to: " .. targetKey, 1.5)
						else
							notify("Octa Hub", "Gliding to: " .. targetKey, 1.5)
						end
						
						-- Execute the Elevated/Hover Safe Movement
						local success = executeSafeTarget(targetPos, Cfg.AutoWinSpeed)
						if not success then break end 
						
						-- Wait a split second to ensure the block registers the touch
						task.wait(0.1)
					end
					
					Cfg.Noclip = false
					
					if Cfg.AutoWin then
						notify("Octa Hub", "Course Completed! Resetting...", 3)
						task.wait(1)
						local h = char:FindFirstChildOfClass("Humanoid")
						if h then h.Health = 0 end
						task.wait(5) -- Wait for character to respawn
					end
				end
				task.wait(1)
			end
		end)
	end
end)

-- Visuals / ESP Tab
CreateToggle(TabVisuals, "Enable Player Highlight", false, function(v) Cfg.ESP_Enabled = v end)
CreateToggle(TabVisuals, "Show Player Names", false, function(v) Cfg.ESP_Names = v end)
CreateToggle(TabVisuals, "Show Distance", false, function(v) Cfg.ESP_Distance = v end)
CreateDropdown(TabVisuals, "Highlight Color", {"Red", "Cyan", "Green", "White", "Pink", "Yellow"}, function(v)
	if v == "Red" then Cfg.ESP_Color = Color3.fromRGB(255, 50, 50)
	elseif v == "Cyan" then Cfg.ESP_Color = Color3.fromRGB(0, 230, 255)
	elseif v == "Green" then Cfg.ESP_Color = Color3.fromRGB(50, 255, 50)
	elseif v == "White" then Cfg.ESP_Color = Color3.fromRGB(255, 255, 255)
	elseif v == "Pink" then Cfg.ESP_Color = Color3.fromRGB(255, 100, 200)
	elseif v == "Yellow" then Cfg.ESP_Color = Color3.fromRGB(255, 255, 50) end
end)

-- Movement Tab
CreateToggle(TabMove, "Enable Fly (WASD)", false, function(v) Cfg.Fly = v if v then StartFly() else StopFly() end end)
CreateSlider(TabMove, "Fly Speed", 10, 2000, 300, function(v) Cfg.FlySpeed = v end)
CreateToggle(TabMove, "Enable Noclip", false, function(v) Cfg.Noclip = v end)

-- Player Tab
CreateSlider(TabChar, "Walk Speed", 16, 500, 16, function(v)
	Cfg.WalkSpeed = v
	local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.WalkSpeed = v end
end)
CreateSlider(TabChar, "Jump Power", 50, 500, 50, function(v)
	Cfg.JumpPower = v
	local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if h then h.UseJumpPower = true h.JumpPower = v end
end)
CreateToggle(TabChar, "Infinite Jump", false, function(v) Cfg.InfiniteJump = v end)

-- Misc Tab
CreateButton(TabMisc, "Enable Anti-AFK", function()
	local vu = game:GetService("VirtualUser")
	LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0, 0), Camera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0, 0), Camera.CFrame)
	end)
	notify("Octa Hub", "Anti-AFK Activated", 3)
end)
CreateButton(TabMisc, "Unload Hub", function()
	Cfg.AutoWin = false
	Cfg.InfiniteJump = false
	Cfg.ESP_Enabled = false
	Cfg.ESP_Names = false
	Cfg.ESP_Distance = false
	if activeTween then activeTween:Cancel() end
	StopFly()
	ScreenGui:Destroy()
end)

-- // GLOBAL EVENT LOGIC // --
RunService.Stepped:Connect(function()
	local char = LocalPlayer.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if Cfg.Noclip then
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide = false end
		end
	end

	if hum and Cfg.WalkSpeed ~= 16 then
		hum.WalkSpeed = Cfg.WalkSpeed
	end
end)

UserInputService.JumpRequest:Connect(function()
	if Cfg.InfiniteJump then
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum:ChangeState("Jumping") end
	end
end)

-- // WINDOW DRAGGING & MINIMIZE LOGIC // --
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	MinBtn.Text = minimized and "+" or "—"
	TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
		Size = minimized and UDim2.new(0, 520, 0, 35) or UDim2.new(0, 520, 0, 360)
	}):Play()
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

notify("Octa Hub", "Elevated Safe-Path Loaded!", 4)
