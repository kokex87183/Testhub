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
	AutoWinSpeed  = 150,  
	AutoWinMode   = "Gate Sweeper (Fast)",  -- "Smart Walk (Legit)", "Gate Sweeper (Fast)", "Instant TP"
	Fly           = false,
	FlySpeed      = 300,
	Noclip        = false,
	WalkSpeed     = 16,
	JumpPower     = 50,
	InfiniteJump  = false,
	AutoWalk      = false,
	AutoWin       = false
}

-- // THEME COLORS // --
local Theme = {
	MainBG = Color3.fromRGB(15, 15, 20),
	SideBG = Color3.fromRGB(22, 22, 28),
	TopBG  = Color3.fromRGB(20, 20, 25),
	Accent = Color3.fromRGB(0, 230, 255), -- Neon Cyan
	Text   = Color3.fromRGB(240, 240, 255),
	SubText= Color3.fromRGB(150, 150, 170),
	ElementBG = Color3.fromRGB(28, 28, 35)
}

-- // NOTIFICATION // --
local function notify(title, text, time)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", { Title = title, Text = text, Duration = time or 3 })
	end)
end

-- // CORE MOVEMENT LOGIC // --
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

-- // NEW WALK-TO-WIN SPECIFIC BYPASSES // --
local function executeSafeMovement(char, targetPos)
	if not Cfg.AutoWin then return false end
	local root = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not root or not hum then return false end
	
	if Cfg.AutoWinMode == "Instant TP" then
		-- Only works if the game doesn't have track checkpoints
		root.CFrame = CFrame.new(targetPos)
		task.wait(0.2)
		return true

	elseif Cfg.AutoWinMode == "Smart Walk (Legit)" then
		-- Physically walks using waypoints (bypasses Roblox's MoveTo distance limits)
		local startPos = root.Position
		local flatTarget = Vector3.new(targetPos.X, startPos.Y, targetPos.Z) 
		local dist = (flatTarget - startPos).Magnitude
		local dir = (flatTarget - startPos).Unit
		
		local step = 50
		local walked = 0
		
		while walked < dist and Cfg.AutoWin do
			walked = math.min(walked + step, dist)
			local nextPoint = startPos + (dir * walked)
			hum:MoveTo(nextPoint)
			
			local timeout = tick()
			while (root.Position - nextPoint).Magnitude > 5 and Cfg.AutoWin do
				if tick() - timeout > 4 then break end -- Re-issue command if stuck
				task.wait(0.1)
			end
		end
		
		if Cfg.AutoWin then
			hum:MoveTo(targetPos)
			task.wait(1.5)
		end
		return true

	elseif Cfg.AutoWinMode == "Gate Sweeper (Fast)" then
		-- Teleports forward in chunks. This registers EVERY invisible checkpoint
		-- between you and the finish line without having to actually walk it.
		local startPos = root.Position
		local dist = (targetPos - startPos).Magnitude
		local dir = (targetPos - startPos).Unit
		
		local stepSize = Cfg.AutoWinSpeed / 5 -- Calculate chunk size
		local walked = 0
		
		while walked < dist and Cfg.AutoWin do
			walked = math.min(walked + stepSize, dist)
			local nextPos = startPos + (dir * walked)
			
			root.CFrame = CFrame.new(nextPos)
			
			-- We MUST wait a tiny bit so the server's physics engine can process 
			-- the TouchEvent for the checkpoint we just jumped into.
			task.wait(0.05) 
		end
		
		root.CFrame = CFrame.new(targetPos)
		task.wait(0.2)
		return true
	end
end

-- // DELETE OLD GUI // --
for _, v in pairs(guiParent:GetChildren()) do
	if v.Name == "OctaHubUI" then v:Destroy() end
end

-- // UI SETUP // --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OctaHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
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
local function CreateToggle(parent, text, callback)
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
	BoxStroke.Color = Theme.SubText
	BoxStroke.Thickness = 1
	BoxStroke.Parent = Box

	local Check = Instance.new("Frame")
	Check.Size = UDim2.new(0, 0, 0, 0)
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

	local active = false
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

	Track.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true update(input) end
	end)
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then update(input) end
	end)
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
	Btn.Size = UDim2.new(0, 150, 0, 24)
	Btn.Position = UDim2.new(1, -165, 0.5, -12)
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

	local idx = 1
	Btn.MouseButton1Click:Connect(function()
		idx = (idx % #options) + 1
		Btn.Text = options[idx]
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.SideBG}):Play()
		task.wait(0.1)
		TweenService:Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.MainBG}):Play()
		callback(options[idx])
	end)
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
local TabMove = CreateTab("Movement")
local TabChar = CreateTab("Player")
local TabMisc = CreateTab("Misc")

-- Auto Farm Tab
CreateDropdown(TabFarm, "Bypass Method", {"Gate Sweeper (Fast)", "Smart Walk (Legit)", "Instant TP"}, function(v) Cfg.AutoWinMode = v end)
CreateSlider(TabFarm, "Gate Sweeper Speed", 10, 500, 150, function(v) Cfg.AutoWinSpeed = v end)
CreateToggle(TabFarm, "Enable Auto Win", function(v)
	Cfg.AutoWin = v
	if v then
		task.spawn(function()
			while Cfg.AutoWin do
				local char = LocalPlayer.Character
				if char then
					local root = char:FindFirstChild("HumanoidRootPart")
					if root and Cfg.WinPos then
						local dist = (root.Position - Cfg.WinPos).Magnitude
						if dist > 10 then
							if Cfg.AutoWinMode ~= "Smart Walk (Legit)" then Cfg.Noclip = true end
							
							notify("Octa Hub", "Running: " .. Cfg.AutoWinMode, 2)
							executeSafeMovement(char, Cfg.WinPos)
							
							Cfg.Noclip = false
							
							if Cfg.AutoWin then
								task.wait(1)
								local h = char:FindFirstChildOfClass("Humanoid")
								if h then h.Health = 0 end
								task.wait(5)
							end
						end
					end
				end
				task.wait(1)
			end
		end)
	end
end)

-- Movement Tab
CreateToggle(TabMove, "Enable Fly (WASD)", function(v) Cfg.Fly = v if v then StartFly() else StopFly() end end)
CreateSlider(TabMove, "Fly Speed", 10, 2000, 300, function(v) Cfg.FlySpeed = v end)
CreateToggle(TabMove, "Enable Noclip", function(v) Cfg.Noclip = v end)

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
CreateToggle(TabChar, "Infinite Jump", function(v) Cfg.InfiniteJump = v end)

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
		Size = minimized and UDim2.new(0, 500, 0, 35) or UDim2.new(0, 500, 0, 320)
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

notify("Octa Hub", "Checkpoint Bypass Active!", 4)
