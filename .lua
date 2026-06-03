local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DIG_DELAY = 0.5
local DIG_ARG = "hello"
local HATCH_DELAY = 0.5
local BUY_DELAY = 1.0

local digRunning = false
local digThread = nil
local hatchRunning = false
local hatchThread = nil
local autoBuyRunning = false
local autoBuyThread = nil
local autoWinRunning = false
local autoWinThread = nil

local selectedWorld = "World1"
local selectedEgg = "Egg1"
local selectedWinWorld = "World1"

local worlds = {"World1", "World2", "World3"}
local winWorlds = {"World1","World2","World3","World4","World5","World6","World7","World8","World9","World10","World11"}
local eggs = {"Egg1", "Egg2", "Egg3"}

local worldRef = {1}
local eggRef = {1}
local winWorldRef = {1}

local PICKAXES_ORDERED = {
	"Wood","Stone","Iron","Gold","Diamond","Rainbow","Crystal","Future","Ice","Lava","Nuke","Pumpkicaxe","Thunder","Toy","Unicorn","Void","Anime","Glitch","Neon","Pinata","Angel","Cake","Admin","Plushie","Emoji","Neurospike","Rocket","Nebula","Astro","Alien","Mystical","Singularity","Axehorns","Pulsar","Flora",
}

local selectedPickaxeRef = {1}
local pickaxeNames = {}
for _, v in ipairs(PICKAXES_ORDERED) do
	table.insert(pickaxeNames, v)
end

local function fireDig()
	pcall(function()
		ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer(DIG_ARG)
	end)
end

local function fireHatch()
	pcall(function()
		local egg = workspace:WaitForChild(selectedWorld):WaitForChild("Prompts"):WaitForChild("Eggs"):WaitForChild(selectedEgg)
		ReplicatedStorage:WaitForChild("PetRemotes"):WaitForChild("HatchServer"):InvokeServer(egg)
	end)
end

local function fireBuyPickaxe(name)
	pcall(function()
		ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyPickaxeEvent"):FireServer(name)
	end)
end

local function doWin()
	pcall(function()
		local character = player.Character or player.CharacterAdded:Wait()
		local root = character:WaitForChild("HumanoidRootPart")
		local winPart = workspace:WaitForChild(selectedWinWorld):WaitForChild("WinPart")
		if root and root.Parent then
			root.AssemblyLinearVelocity = Vector3.zero
			root.CFrame = winPart.CFrame + Vector3.new(0, 5, 0)
		end
	end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "dig to earth"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 210, 0, 300)
MainFrame.Position = UDim2.new(0, 20, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
MainFrame.BackgroundTransparency = 0
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 32)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
TitleBar.BackgroundTransparency = 0
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 2
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local TitlePatch = Instance.new("Frame")
TitlePatch.Size = UDim2.new(1, 0, 0.5, 0)
TitlePatch.Position = UDim2.new(0, 0, 0.5, 0)
TitlePatch.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
TitlePatch.BackgroundTransparency = 0
TitlePatch.BorderSizePixel = 0
TitlePatch.ZIndex = 2
TitlePatch.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -36, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "dig to earth"
TitleLabel.TextColor3 = Color3.fromRGB(210, 210, 220)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 3
TitleLabel.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 18, 0, 18)
MinBtn.Position = UDim2.new(1, -24, 0.5, -9)
MinBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
MinBtn.BackgroundTransparency = 0
MinBtn.BorderSizePixel = 0
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
MinBtn.TextSize = 13
MinBtn.Font = Enum.Font.GothamBold
MinBtn.AutoButtonColor = false
MinBtn.ZIndex = 4
MinBtn.Parent = TitleBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 4)
MinCorner.Parent = MinBtn

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -32)
ScrollFrame.Position = UDim2.new(0, 0, 0, 32)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
ScrollFrame.BackgroundTransparency = 0
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 100)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 430)
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.ElasticBehavior = Enum.ElasticBehavior.Never
ScrollFrame.Parent = MainFrame

local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 0, 430)
ContentFrame.Position = UDim2.new(0, 0, 0, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = ScrollFrame

local twInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function makeSectionLabel(text, yOffset)
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -16, 0, 18)
	lbl.Position = UDim2.new(0, 8, 0, yOffset)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(120, 120, 138)
	lbl.TextSize = 10
	lbl.Font = Enum.Font.GothamBold
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = ContentFrame
end

local function makeDivider(yOffset)
	local div = Instance.new("Frame")
	div.Size = UDim2.new(1, -16, 0, 1)
	div.Position = UDim2.new(0, 8, 0, yOffset)
	div.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
	div.BackgroundTransparency = 0
	div.BorderSizePixel = 0
	div.Parent = ContentFrame
end

local function makeToggleRow(labelText, yOffset)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 34)
	row.Position = UDim2.new(0, 0, 0, yOffset)
	row.BackgroundTransparency = 1
	row.Parent = ContentFrame

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -42, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
	lbl.TextSize = 12
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 20, 0, 20)
	btn.Position = UDim2.new(1, -30, 0.5, -10)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 72)
	btn.BackgroundTransparency = 0
	btn.BorderSizePixel = 0
	btn.Text = ""
	btn.AutoButtonColor = false
	btn.Parent = row

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(1, 0)
	c.Parent = btn

	return btn
end

local function makeDropRow(labelText, options, ref, yOffset, onChange)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 30)
	row.Position = UDim2.new(0, 0, 0, yOffset)
	row.BackgroundTransparency = 1
	row.Parent = ContentFrame

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.45, 0, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(165, 165, 180)
	lbl.TextSize = 11
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local dropBtn = Instance.new("TextButton")
	dropBtn.Size = UDim2.new(0, 88, 0, 22)
	dropBtn.Position = UDim2.new(1, -96, 0.5, -11)
	dropBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 42)
	dropBtn.BackgroundTransparency = 0
	dropBtn.BorderSizePixel = 0
	dropBtn.Text = options[ref[1]] .. "  >"
	dropBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
	dropBtn.TextSize = 10
	dropBtn.Font = Enum.Font.GothamBold
	dropBtn.AutoButtonColor = false
	dropBtn.Parent = row

	local dc = Instance.new("UICorner")
	dc.CornerRadius = UDim.new(0, 5)
	dc.Parent = dropBtn

	local ds = Instance.new("UIStroke")
	ds.Color = Color3.fromRGB(52, 52, 65)
	ds.Thickness = 1
	ds.Parent = dropBtn

	dropBtn.MouseButton1Click:Connect(function()
		ref[1] = (ref[1] % #options) + 1
		dropBtn.Text = options[ref[1]] .. "  >"
		onChange(options[ref[1]])
	end)

	return dropBtn
end

local function makeBuyButton(yOffset)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 30)
	row.Position = UDim2.new(0, 0, 0, yOffset)
	row.BackgroundTransparency = 1
	row.Parent = ContentFrame

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(0.45, 0, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = "Buy Pickaxe"
	lbl.TextColor3 = Color3.fromRGB(165, 165, 180)
	lbl.TextSize = 11
	lbl.Font = Enum.Font.Gotham
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local buyBtn = Instance.new("TextButton")
	buyBtn.Size = UDim2.new(0, 50, 0, 22)
	buyBtn.Position = UDim2.new(1, -58, 0.5, -11)
	buyBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 60)
	buyBtn.BackgroundTransparency = 0
	buyBtn.BorderSizePixel = 0
	buyBtn.Text = "BUY"
	buyBtn.TextColor3 = Color3.fromRGB(220, 255, 220)
	buyBtn.TextSize = 11
	buyBtn.Font = Enum.Font.GothamBold
	buyBtn.AutoButtonColor = false
	buyBtn.Parent = row

	local bc = Instance.new("UICorner")
	bc.CornerRadius = UDim.new(0, 5)
	bc.Parent = buyBtn

	buyBtn.MouseButton1Click:Connect(function()
		local name = PICKAXES_ORDERED[selectedPickaxeRef[1]]
		fireBuyPickaxe(name)
		TweenService:Create(buyBtn, twInfo, {BackgroundColor3 = Color3.fromRGB(30, 180, 60)}):Play()
		task.delay(0.4, function()
			TweenService:Create(buyBtn, twInfo, {BackgroundColor3 = Color3.fromRGB(50, 120, 60)}):Play()
		end)
	end)
end

local function setupToggle(btn, onColor, startFn, stopFn)
	local active = false
	btn.MouseButton1Click:Connect(function()
		active = not active
		if active then
			TweenService:Create(btn, twInfo, {BackgroundColor3 = onColor}):Play()
			startFn()
		else
			TweenService:Create(btn, twInfo, {BackgroundColor3 = Color3.fromRGB(60, 60, 72)}):Play()
			stopFn()
		end
	end)
end

makeSectionLabel("MAIN", 6)
makeDivider(24)
local digBtn = makeToggleRow("Auto Dig", 28)

makeDivider(64)
makeSectionLabel("HATCH EGG", 68)
makeDivider(86)
makeDropRow("World", worlds, worldRef, 90, function(val) selectedWorld = val end)
makeDropRow("Egg", eggs, eggRef, 120, function(val) selectedEgg = val end)
local hatchBtn = makeToggleRow("Auto Hatch", 152)

makeDivider(188)
makeSectionLabel("PICKAXE", 192)
makeDivider(210)
makeDropRow("Pickaxe", pickaxeNames, selectedPickaxeRef, 214, function(val)
	for i, v in ipairs(PICKAXES_ORDERED) do
		if v == val then selectedPickaxeRef[1] = i break end
	end
end)
makeBuyButton(245)
local autoBuyBtn = makeToggleRow("Auto Buy Best", 276)

makeDivider(312)
makeSectionLabel("WIN", 316)
makeDivider(334)
makeDropRow("Win World", winWorlds, winWorldRef, 338, function(val) selectedWinWorld = val end)
local autoWinBtn = makeToggleRow("Auto Win", 370)

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, -16, 0, 20)
creditLabel.Position = UDim2.new(0, 8, 0, 406)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Credit: dearygt"
creditLabel.TextColor3 = Color3.fromRGB(80, 80, 95)
creditLabel.TextSize = 10
creditLabel.Font = Enum.Font.Gotham
creditLabel.TextXAlignment = Enum.TextXAlignment.Left
creditLabel.Parent = ContentFrame

setupToggle(digBtn, Color3.fromRGB(195, 50, 50),
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

setupToggle(hatchBtn, Color3.fromRGB(195, 50, 50),
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

setupToggle(autoBuyBtn, Color3.fromRGB(50, 160, 80),
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

setupToggle(autoWinBtn, Color3.fromRGB(50, 120, 200),
	function()
		autoWinThread = task.spawn(function()
			autoWinRunning = true
			while autoWinRunning do
				doWin()
				task.wait(0.5)
			end
		end)
	end,
	function()
		autoWinRunning = false
		if autoWinThread then task.cancel(autoWinThread) autoWinThread = nil end
	end
)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
		Size = minimized and UDim2.new(0, 210, 0, 32) or UDim2.new(0, 210, 0, 300)
	}):Play()
	MinBtn.Text = minimized and "+" or "-"
end)

local dragging, dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)
