local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local guiParent = pcall(function() return CoreGui end) and CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- // CONFIGURATION STATE // --
local Cfg = {
	WinPos        = Vector3.new(-6809.3223, 531.2539, 1468.8073),
	AutoWinSpeed  = 45,  -- Safe default speed
	AutoWinHeight = 250, -- Safe default height
	Fly           = false,
	FlySpeed      = 300,
	Noclip        = false,
	WalkSpeed     = 16,
	JumpPower     = 50,
	InfiniteJump  = false,
	AutoWalk      = false,
	AutoWin       = false
}

-- // NOTIFICATION FUNCTION // --
local function notify(title, text, time)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = time or 3,
		})
	end)
end

-- // MOVEMENT LOGIC // --
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
	if hum then 
		hum.PlatformStand = false 
		hum:ChangeState(Enum.HumanoidStateType.Running)
	end
end

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	if Cfg.Fly then StartFly() end
end)

-- // DELETE OLD GUI // --
for _, v in pairs(guiParent:GetChildren()) do
	if v.Name == "EscapeHubUI" then v:Destroy() end
end

-- // UI CREATION // --
local twInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local twFast = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EscapeHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 420)
MainFrame.Position = UDim2.new(0, 40, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 55)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

local TitlePatch = Instance.new("Frame")
TitlePatch.Size = UDim2.new(1, 0, 0.5, 0)
TitlePatch.Position = UDim2.new(0, 0, 0.5, 0)
TitlePatch.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
TitlePatch.BorderSizePixel = 0
TitlePatch.Parent = TitleBar

local TitleBarStroke = Instance.new("Frame")
TitleBarStroke.Size = UDim2.new(1, 0, 0, 1)
TitleBarStroke.Position = UDim2.new(0, 0, 1, 0)
TitleBarStroke.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TitleBarStroke.BorderSizePixel = 0
TitleBarStroke.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -50, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ESCAPE KEYBOARD HUB"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 24, 0, 24)
MinBtn.Position = UDim2.new(1, -32, 0.5, -12)
MinBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
MinBtn.TextSize = 16
MinBtn.Font = Enum.Font.GothamBold
MinBtn.AutoButtonColor = false
MinBtn.Parent = TitleBar
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -37)
ScrollFrame.Position = UDim2.new(0, 0, 0, 37)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 2
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 95)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 8)
ContentLayout.Parent = ScrollFrame

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingLeft = UDim.new(0, 12)
ContentPadding.PaddingRight = UDim.new(0, 12)
ContentPadding.PaddingTop = UDim.new(0, 12)
ContentPadding.PaddingBottom = UDim.new(0, 12)
ContentPadding.Parent = ScrollFrame

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 24)
end)

-- // UI BUILDERS // --
local function makeSectionLabel(text)
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 0, 18)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(130, 130, 150)
	lbl.TextSize = 11
	lbl.Font = Enum.Font.GothamBold
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = ScrollFrame
end

local function makeDivider()
	local div = Instance.new("Frame")
	div.Size = UDim2.new(1, 0, 0, 1)
	div.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	div.BorderSizePixel = 0
	div.Parent = ScrollFrame
end

local function makeToggle(labelText, onColor, callback)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 34)
	row.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	row.Parent = ScrollFrame
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -50, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
	lbl.TextSize = 12
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local switchBG = Instance.new("Frame")
	switchBG.Size = UDim2.new(0, 36, 0, 18)
	switchBG.Position = UDim2.new(1, -46, 0.5, -9)
	switchBG.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
	switchBG.Parent = row
	Instance.new("UICorner", switchBG).CornerRadius = UDim.new(1, 0)

	local switchDot = Instance.new("Frame")
	switchDot.Size = UDim2.new(0, 14, 0, 14)
	switchDot.Position = UDim2.new(0, 2, 0.5, -7)
	switchDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	switchDot.Parent = switchBG
	Instance.new("UICorner", switchDot).CornerRadius = UDim.new(1, 0)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.Parent = row

	local active = false
	btn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			TweenService:Create(switchBG, twInfo, {BackgroundColor3 = onColor}):Play()
			TweenService:Create(switchDot, twInfo, {Position = UDim2.new(1, -16, 0.5, -7)}):Play()
		else
			TweenService:Create(switchBG, twInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
			TweenService:Create(switchDot, twInfo, {Position = UDim2.new(0, 2, 0.5, -7)}):Play()
		end
		callback(active)
	end)
end

local function makeSlider(labelText, min, max, defaultVal, callback)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 48)
	row.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	row.Parent = ScrollFrame
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -50, 0, 20)
	lbl.Position = UDim2.new(0, 10, 0, 4)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
	lbl.TextSize = 12
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local valLbl = Instance.new("TextLabel")
	valLbl.Size = UDim2.new(0, 40, 0, 20)
	valLbl.Position = UDim2.new(1, -50, 0, 4)
	valLbl.BackgroundTransparency = 1
	valLbl.Text = tostring(defaultVal)
	valLbl.TextColor3 = Color3.fromRGB(180, 180, 190)
	valLbl.TextSize = 12
	valLbl.Font = Enum.Font.GothamBold
	valLbl.TextXAlignment = Enum.TextXAlignment.Right
	valLbl.Parent = row

	local trackBg = Instance.new("TextButton")
	trackBg.Size = UDim2.new(1, -20, 0, 6)
	trackBg.Position = UDim2.new(0, 10, 1, -16)
	trackBg.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
	trackBg.Text = ""
	trackBg.AutoButtonColor = false
	trackBg.Parent = row
	Instance.new("UICorner", trackBg).CornerRadius = UDim.new(1, 0)

	local trackFill = Instance.new("Frame")
	local startPct = (defaultVal - min) / (max - min)
	trackFill.Size = UDim2.new(startPct, 0, 1, 0)
	trackFill.BackgroundColor3 = Color3.fromRGB(110, 110, 150)
	trackFill.Parent = trackBg
	Instance.new("UICorner", trackFill).CornerRadius = UDim.new(1, 0)

	local dragging = false
	local function update(input)
		local pos = math.clamp((input.Position.X - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X, 0, 1)
		trackFill.Size = UDim2.new(pos, 0, 1, 0)
		local val = math.floor(min + ((max - min) * pos))
		valLbl.Text = tostring(val)
		callback(val)
	end

	trackBg.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			update(input)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			update(input)
		end
	end)
end

local function makeButton(labelText, color, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 32)
	btn.BackgroundColor3 = color
	btn.Text = labelText
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = false
	btn.Parent = ScrollFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	btn.MouseButton1Click:Connect(function()
		local r, g, b = color.R*255, color.G*255, color.B*255
		TweenService:Create(btn, twFast, {BackgroundColor3 = Color3.fromRGB(math.clamp(r+20,0,255), math.clamp(g+20,0,255), math.clamp(b+20,0,255))}):Play()
		task.wait(0.15)
		TweenService:Create(btn, twFast, {BackgroundColor3 = color}):Play()
		callback()
	end)
end

-- // TWEEN HELPER FUNCTION // --
local function performSmoothTween(root, targetPos)
	if not Cfg.AutoWin then return false end
	local distance = (root.Position - targetPos).Magnitude
	local duration = distance / Cfg.AutoWinSpeed
	
	local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local tween = TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(targetPos)})
	
	tween:Play()
	
	-- We wait for completion but keep checking if user turned it off so we can cancel it mid-air
	local completed = false
	local conn
	conn = tween.Completed:Connect(function() completed = true end)
	
	while not completed and Cfg.AutoWin and root.Parent do
		task.wait(0.1)
	end
	
	if conn then conn:Disconnect() end
	if not Cfg.AutoWin or not root.Parent then
		tween:Cancel()
		return false
	end
	
	return true
end

-- // BUILDING TABS & FEATURES // --

-- AUTO FARM
makeSectionLabel("AUTO FARM")
makeToggle("Auto Walk", Color3.fromRGB(120, 190, 100), function(v)
	Cfg.AutoWalk = v
	if v then
		task.spawn(function()
			while Cfg.AutoWalk do
				local char = LocalPlayer.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if hum then
					hum:Move(Vector3.new(0, 0, 1), true)
					task.wait(0.1)
					hum:Move(Vector3.new(0, 0, -1), true)
				end
				task.wait(0.1)
			end
		end)
	end
end)

makeToggle("Auto Win (Smooth)", Color3.fromRGB(210, 140, 65), function(v)
	Cfg.AutoWin = v
	if v then
		task.spawn(function()
			while Cfg.AutoWin do
				local char = LocalPlayer.Character
				local root = char and char:FindFirstChild("HumanoidRootPart")
				if root and Cfg.WinPos then
					local dist = (root.Position - Cfg.WinPos).Magnitude
					if dist > 5 then
						-- 1. Setup states
						if not Cfg.Fly then Cfg.Fly = true StartFly() end
						local oldNoclip = Cfg.Noclip
						Cfg.Noclip = true

						-- 2. Phase 1: Rise safely
						notify("Auto Win", "Rising up safely...", 2)
						local risePos = root.Position + Vector3.new(0, Cfg.AutoWinHeight, 0)
						if not performSmoothTween(root, risePos) then Cfg.Noclip = oldNoclip return end
						task.wait(0.2)

						-- 3. Phase 2: Travel horizontally
						notify("Auto Win", "Traveling to destination...", 2)
						local targetPos = Vector3.new(Cfg.WinPos.X, risePos.Y, Cfg.WinPos.Z)
						if not performSmoothTween(root, targetPos) then Cfg.Noclip = oldNoclip return end
						task.wait(0.2)

						-- 4. Phase 3: Descend safely
						notify("Auto Win", "Descending safely...", 2)
						if not performSmoothTween(root, Cfg.WinPos) then Cfg.Noclip = oldNoclip return end

						-- 5. Complete
						Cfg.Noclip = oldNoclip
						StopFly() 

						notify("Auto Win", "Arrived! Resetting in 3s...", 3)
						task.wait(3)

						local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
						if hum then hum.Health = 0 end

						notify("Auto Win", "Resetting... Next loop in 5s.", 5)
						task.wait(5)
					end
				end
				task.wait(0.1)
			end
		end)
	end
end)

makeSlider("Auto Win Speed", 10, 200, 45, function(v) Cfg.AutoWinSpeed = v end)
makeSlider("Auto Win Height", 50, 1000, 250, function(v) Cfg.AutoWinHeight = v end)

makeDivider()

-- MOVEMENT
makeSectionLabel("MOVEMENT")
makeToggle("Fly (WASD + Space/Ctrl)", Color3.fromRGB(80, 160, 220), function(v)
	Cfg.Fly = v
	if v then StartFly() else StopFly() end
end)
makeSlider("Fly Speed", 10, 2000, 300, function(v) Cfg.FlySpeed = v end)
makeToggle("Noclip", Color3.fromRGB(180, 100, 200), function(v) Cfg.Noclip = v end)

makeDivider()

-- PLAYER
makeSectionLabel("PLAYER")
makeSlider("Walk Speed", 16, 1000, 16, function(v)
	Cfg.WalkSpeed = v
	local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = v end
end)
makeSlider("Jump Power", 50, 1000, 50, function(v)
	Cfg.JumpPower = v
	local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.UseJumpPower = true
		hum.JumpPower = v
	end
end)
makeToggle("Infinite Jump", Color3.fromRGB(220, 80, 120), function(v) Cfg.InfiniteJump = v end)

makeDivider()

-- MISC
makeSectionLabel("MISC")
makeButton("Enable Anti-AFK", Color3.fromRGB(50, 140, 80), function()
	local vu = game:GetService("VirtualUser")
	LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0, 0), Camera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0, 0), Camera.CFrame)
	end)
	notify("Anti-AFK", "Successfully activated.", 3)
end)

makeButton("Unload Hub", Color3.fromRGB(200, 50, 50), function()
	Cfg.AutoWalk = false
	Cfg.AutoWin = false
	Cfg.InfiniteJump = false
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
	MinBtn.Text = minimized and "+" or "-"
	TweenService:Create(MainFrame, twInfo, {
		Size = minimized and UDim2.new(0, 260, 0, 36) or UDim2.new(0, 260, 0, 420)
	}):Play()
end)

local dragging, dragInput, dragStart, startPos
TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)
TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

notify("Escape Hub", "Loaded Successfully!", 5)
