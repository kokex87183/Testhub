local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local L = Players.LocalPlayer
local guiParent = pcall(function() return CoreGui end) and CoreGui or L:WaitForChild("PlayerGui")

-- // Game Logic Setup // --
local Z = nil
pcall(function()
	Z = require(L.PlayerScripts.Controllers.ZombieClient).Zombies
end)

if type(Z) ~= "table" and getgc then
	for _, v in pairs(getgc(true)) do
		if type(v) == "table" and rawget(v, "Zombies") and rawget(v, "ZombieModels") then
			Z = v.Zombies
			break
		end
	end
end

local D = ReplicatedStorage:WaitForChild("ZombieRemotes"):WaitForChild("ZombieDamage")

local autoKillRunning = false
local autoKillThread = nil

local floatRunning = false
local floatThread = nil
local originalHipHeight = 2 -- Default fallback

local function getOriginalHipHeight()
	local M = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
	if M and M.HipHeight ~= 25 then
		originalHipHeight = M.HipHeight
	end
end

-- // Delete Old GUI // --
for _, v in pairs(guiParent:GetChildren()) do
	if v.Name == "ZombieHubUI" then v:Destroy() end
end

-- // UI Creation // --
local twInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZombieHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 240, 0, 200)
MainFrame.Position = UDim2.new(0, 40, 0.5, -100)
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

-- Top Bar
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
TitleLabel.Text = "ZOMBIE HUB"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
TitleLabel.TextSize = 14
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

-- Scrolling Content
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
ContentLayout.Padding = UDim.new(0, 6)
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

-- // UI Component Builders // --
local function makeSectionLabel(text)
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 0, 20)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(130, 130, 150)
	lbl.TextSize = 11
	lbl.Font = Enum.Font.GothamBold
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = ScrollFrame
end

local function makeToggle(labelText, onColor, startFn, stopFn)
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
			startFn()
		else
			TweenService:Create(switchBG, twInfo, {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
			TweenService:Create(switchDot, twInfo, {Position = UDim2.new(0, 2, 0.5, -7)}):Play()
			stopFn()
		end
	end)
end

-- // Building the GUI Features // --
makeSectionLabel("COMBAT")
makeToggle("Auto Kill Zombies", Color3.fromRGB(210, 65, 65),
	function()
		autoKillRunning = true
		autoKillThread = task.spawn(function()
			while autoKillRunning do
				if Z then
					for id, data in pairs(Z) do
						if data and not data.IsDying and data.Health > 0 then
							pcall(function() D:FireServer(id, math.huge) end)
						end
					end
				end
				task.wait(0.2)
			end
		end)
	end,
	function()
		autoKillRunning = false
		if autoKillThread then task.cancel(autoKillThread) autoKillThread = nil end
	end
)

makeToggle("Float Mode (HipHeight)", Color3.fromRGB(65, 140, 220),
	function()
		getOriginalHipHeight()
		floatRunning = true
		floatThread = task.spawn(function()
			while floatRunning do
				local M = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
				if M then M.HipHeight = 25 end
				task.wait(0.2)
			end
		end)
	end,
	function()
		floatRunning = false
		if floatThread then task.cancel(floatThread) floatThread = nil end
		
		-- Reset normal walking height when turned off
		local M = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
		if M then M.HipHeight = originalHipHeight end
	end
)

-- // Window Interactions // --
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	MinBtn.Text = minimized and "+" or "-"
	TweenService:Create(MainFrame, twInfo, {
		Size = minimized and UDim2.new(0, 240, 0, 36) or UDim2.new(0, 240, 0, 200)
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
