local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
-- Using CoreGui if using an executor, otherwise falls back to PlayerGui (for studio testing)
local guiParent = pcall(function() return CoreGui end) and CoreGui or player:WaitForChild("PlayerGui")

local DIG_DELAY = 0.5
local DIG_ARG = "hello"
local HATCH_DELAY = 0.5
local BUY_DELAY = 1.0

local digRunning, hatchRunning, autoBuyRunning, autoWinRunning = false, false, false, false
local digThread, hatchThread, autoBuyThread, autoWinThread = nil, nil, nil, nil

local selectedWorld = "World1"
local selectedEgg = "Egg1"
local selectedWinWorld = "World1"

local worlds = {"World1", "World2", "World3"}
local winWorlds = {"World1","World2","World3","World4","World5","World6","World7","World8","World9","World10","World11"}
local eggs = {"Egg1", "Egg2", "Egg3"}

local worldRef = {1}
local eggRef = {1}
local winWorldRef = {1}
local selectedPickaxeRef = {1}

local PICKAXES_ORDERED = {
	"Wood","Stone","Iron","Gold","Diamond","Rainbow","Crystal","Future","Ice","Lava","Nuke","Pumpkicaxe","Thunder","Toy","Unicorn","Void","Anime","Glitch","Neon","Pinata","Angel","Cake","Admin","Plushie","Emoji","Neurospike","Rocket","Nebula","Astro","Alien","Mystical","Singularity","Axehorns","Pulsar","Flora",
}
local pickaxeNames = {}
for _, v in ipairs(PICKAXES_ORDERED) do table.insert(pickaxeNames, v) end

-- // Core Functions // --
local function fireDig()
	pcall(function() ReplicatedStorage.Remotes.DigEvent:FireServer(DIG_ARG) end)
end

local function fireHatch()
	pcall(function()
		local egg = workspace[selectedWorld].Prompts.Eggs[selectedEgg]
		ReplicatedStorage.PetRemotes.HatchServer:InvokeServer(egg)
	end)
end

local function fireBuyPickaxe(name)
	pcall(function() ReplicatedStorage.Remotes.BuyPickaxeEvent:FireServer(name) end)
end

local function doWin()
	pcall(function()
		local character = player.Character or player.CharacterAdded:Wait()
		local root = character:WaitForChild("HumanoidRootPart")
		local winPart = workspace[selectedWinWorld]:WaitForChild("WinPart")
		if root then
			root.AssemblyLinearVelocity = Vector3.zero
			root.CFrame = winPart.CFrame + Vector3.new(0, 5, 0)
		end
	end)
end

-- // Delete Old GUI if it exists // --
for _, v in pairs(guiParent:GetChildren()) do
	if v.Name == "DigToEarthHub" then v:Destroy() end
end

-- // UI Creation // --
local twInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local twFast = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DigToEarthHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 240, 0, 360)
MainFrame.Position = UDim2.new(0, 40, 0.5, -180)
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

-- Patch bottom corners of title bar
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
TitleLabel.Text = "DIG TO EARTH"
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

-- Auto-scale scrolling frame
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

local function makeDivider()
	local div = Instance.new("Frame")
	div.Size = UDim2.new(1, 0, 0, 1)
	div.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	div.BorderSizePixel = 0
	div.Parent = ScrollFrame
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

	-- Modern Switch Design
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

local function makeDropRow(labelText, options, ref, onChange)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 34)
	row.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	row.Parent = ScrollFrame
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.4, 0, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(180, 180, 190)
	lbl.TextSize = 12
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local dropBtn = Instance.new("TextButton")
	dropBtn.Size = UDim2.new(0, 105, 0, 24)
	dropBtn.Position = UDim2.new(1, -112, 0.5, -12)
	dropBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
	dropBtn.Text = options[ref[1]]
	dropBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
	dropBtn.TextSize = 11
	dropBtn.Font = Enum.Font.GothamBold
	dropBtn.AutoButtonColor = false
	dropBtn.Parent = row
	Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 4)
	
	-- Cycling indicators "< ... >"
	local leftInd = Instance.new("TextLabel")
	leftInd.Size = UDim2.new(0, 15, 1, 0)
	leftInd.BackgroundTransparency = 1
	leftInd.Text = "<"
	leftInd.TextColor3 = Color3.fromRGB(120, 120, 130)
	leftInd.Font = Enum.Font.GothamBold
	leftInd.Parent = dropBtn
	
	local rightInd = Instance.new("TextLabel")
	rightInd.Size = UDim2.new(0, 15, 1, 0)
	rightInd.Position = UDim2.new(1, -15, 0, 0)
	rightInd.BackgroundTransparency = 1
	rightInd.Text = ">"
	rightInd.TextColor3 = Color3.fromRGB(120, 120, 130)
	rightInd.Font = Enum.Font.GothamBold
	rightInd.Parent = dropBtn

	dropBtn.MouseButton1Click:Connect(function()
		ref[1] = (ref[1] % #options) + 1
		dropBtn.Text = options[ref[1]]
		onChange(options[ref[1]])
		
		TweenService:Create(dropBtn, twFast, {BackgroundColor3 = Color3.fromRGB(55, 55, 65)}):Play()
		task.wait(0.1)
		TweenService:Create(dropBtn, twFast, {BackgroundColor3 = Color3.fromRGB(40, 40, 48)}):Play()
	end)
end

local function makeBuyButton()
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 32)
	btn.BackgroundColor3 = Color3.fromRGB(45, 140, 75)
	btn.Text = "BUY SELECTED PICKAXE"
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = false
	btn.Parent = ScrollFrame
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	btn.MouseButton1Click:Connect(function()
		local name = PICKAXES_ORDERED[selectedPickaxeRef[1]]
		fireBuyPickaxe(name)
		TweenService:Create(btn, twFast, {BackgroundColor3 = Color3.fromRGB(60, 180, 100)}):Play()
		task.wait(0.15)
		TweenService:Create(btn, twFast, {BackgroundColor3 = Color3.fromRGB(45, 140, 75)}):Play()
	end)
end

-- // Building the UI structure // --
makeSectionLabel("MAIN")
makeToggle("Auto Dig", Color3.fromRGB(210, 65, 65),
	function()
		digThread = task.spawn(function()
			digRunning = true
			while digRunning do fireDig() task.wait(DIG_DELAY) end
		end)
	end,
	function()
		digRunning = false
		if digThread then task.cancel(digThread) digThread = nil end
	end
)

makeDivider()
makeSectionLabel("HATCH EGG")
makeDropRow("World", worlds, worldRef, function(val) selectedWorld = val end)
makeDropRow("Egg", eggs, eggRef, function(val) selectedEgg = val end)
makeToggle("Auto Hatch", Color3.fromRGB(210, 140, 65),
	function()
		hatchThread = task.spawn(function()
			hatchRunning = true
			while hatchRunning do fireHatch() task.wait(HATCH_DELAY) end
		end)
	end,
	function()
		hatchRunning = false
		if hatchThread then task.cancel(hatchThread) hatchThread = nil end
	end
)

makeDivider()
makeSectionLabel("PICKAXE")
makeDropRow("Pickaxe", pickaxeNames, selectedPickaxeRef, function(val)
	for i, v in ipairs(PICKAXES_ORDERED) do
		if v == val then selectedPickaxeRef[1] = i break end
	end
end)
makeBuyButton()
makeToggle("Auto Buy Best", Color3.fromRGB(65, 195, 100),
	function()
		autoBuyThread = task.spawn(function()
			autoBuyRunning = true
			while autoBuyRunning do
				for i = #PICKAXES_ORDERED, 1, -1 do
					if not autoBuyRunning then break end
					fireBuyPickaxe(PICKAXES_ORDERED[i])
					task.wait(0.3)
				end
				task.wait(BUY_DELAY)
			end
		end)
	end,
	function()
		autoBuyRunning = false
		if autoBuyThread then task.cancel(autoBuyThread) autoBuyThread = nil end
	end
)

makeDivider()
makeSectionLabel("WIN")
makeDropRow("Win World", winWorlds, winWorldRef, function(val) selectedWinWorld = val end)
makeToggle("Auto Win", Color3.fromRGB(65, 140, 220),
	function()
		autoWinThread = task.spawn(function()
			autoWinRunning = true
			while autoWinRunning do doWin() task.wait(0.5) end
		end)
	end,
	function()
		autoWinRunning = false
		if autoWinThread then task.cancel(autoWinThread) autoWinThread = nil end
	end
)

makeDivider()
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Credit: dearygt | UI: AI Remaster"
creditLabel.TextColor3 = Color3.fromRGB(100, 100, 115)
creditLabel.TextSize = 10
creditLabel.Font = Enum.Font.Gotham
creditLabel.Parent = ScrollFrame

-- // Window Interactions // --
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	MinBtn.Text = minimized and "+" or "-"
	TweenService:Create(MainFrame, twInfo, {
		Size = minimized and UDim2.new(0, 240, 0, 36) or UDim2.new(0, 240, 0, 360)
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
