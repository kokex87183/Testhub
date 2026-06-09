local _UserInputService = game:GetService('UserInputService')
local _TweenService = game:GetService('TweenService')

local u3 = loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/UI/Notification.lua'))()

function LoadScript()
    getgenv().setting = {
        ESPPlayer = true,
        DevilESP = true,
        LockPlayers = false,
    }
    Fov = 45

    local _THUNDERZ = game.CoreGui:FindFirstChild('THUNDERZ')

    if _THUNDERZ then
        _THUNDERZ:Destroy()
    end
    if _G.Color == nil then
        _G.Color = Color3.fromRGB(0, 225, 225)
    end

    local _ThunderScreen2 = game.CoreGui:FindFirstChild('ThunderScreen')

    if _ThunderScreen2 then
        _ThunderScreen2:Destroy()
    end

    local _ScreenGui2 = Instance.new('ScreenGui')
    local _TextButton3 = Instance.new('TextButton')
    local _UICorner10 = Instance.new('UICorner')
    local _ImageLabel2 = Instance.new('ImageLabel')

    _ScreenGui2.Name = 'ThunderMain'
    _ScreenGui2.Parent = game.CoreGui
    _ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _TextButton3.Name = 'ThunderToggleUI'
    _TextButton3.Parent = _ScreenGui2
    _TextButton3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    _TextButton3.BorderSizePixel = 0
    _TextButton3.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    _TextButton3.Size = UDim2.new(0, 50, 0, 50)
    _TextButton3.Font = Enum.Font.SourceSans
    _TextButton3.Text = ''
    _TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
    _TextButton3.TextSize = 14
    _TextButton3.Draggable = true

    _TextButton3.MouseButton1Click:Connect(function()
        game.CoreGui:FindFirstChild('THUNDERZ').Enabled = not game.CoreGui:FindFirstChild('THUNDERZ').Enabled
    end)

    _UICorner10.Name = 'ThunderCornerUI'
    _UICorner10.Parent = _TextButton3
    _ImageLabel2.Name = 'MODILEMAGE'
    _ImageLabel2.Parent = _TextButton3
    _ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.BorderSizePixel = 0
    _ImageLabel2.Position = UDim2.new(0, 0, 0, 0)
    _ImageLabel2.Size = UDim2.new(0, 50, 0, 50)
    _ImageLabel2.Image = 'http://www.roblox.com/asset/?id=9906600154'
    Playersaimbot = nil

    local u75 = game.Players.LocalPlayer:GetMouse()

    game.GetService(game, 'GuiService')

    local u76 = game.GetService(game, 'Players')
    local _ = u76.LocalPlayer
    local _CurrentCamera = game.GetService(game, 'Workspace').CurrentCamera

    Drawing.new('Circle')

    local _Frame10 = Instance.new('Frame')
    local _UICorner11 = Instance.new('UICorner')
    local _ImageLabel3 = Instance.new('ImageLabel')
    local _UICorner12 = Instance.new('UICorner')
    local _TextLabel4 = Instance.new('TextLabel')
    local _TextLabel5 = Instance.new('TextLabel')
    local _TextLabel6 = Instance.new('TextLabel')
    local _TextLabel7 = Instance.new('TextLabel')
    local _TextLabel8 = Instance.new('TextLabel')

    Instance.new('TextLabel')
    Instance.new('TextLabel')

    local _Frame11 = Instance.new('Frame')
    local _UICorner13 = Instance.new('UICorner')
    local _Frame12 = Instance.new('Frame')
    local _UICorner14 = Instance.new('UICorner')
    local _UserInputService2 = game:GetService('UserInputService')
    local _TweenService2 = game:GetService('TweenService')

    local function u107(p93, p94)
        local u95 = nil
        local u96 = nil
        local u97 = nil
        local u98 = nil

        local function u103(p99)
            local v100 = p99.Position - u95
            local v101 = _TweenService2
            local v102 = {
                Position = UDim2.new(u96.X.Scale, u96.X.Offset + v100.X, u96.Y.Scale, u96.Y.Offset + v100.Y),
            }

            v101:Create(p94, TweenInfo.new(0.15), v102):Play()
        end

        p93.InputBegan:Connect(function(p104)
            if p104.UserInputType == Enum.UserInputType.MouseButton1 or p104.UserInputType == Enum.UserInputType.Touch then
                u97 = true
                u95 = p104.Position
                u96 = p94.Position

                p104.Changed:Connect(function()
                    if p104.UserInputState == Enum.UserInputState.End then
                        u97 = false
                    end
                end)
            end
        end)
        p93.InputChanged:Connect(function(p105)
            if p105.UserInputType == Enum.UserInputType.MouseMovement or p105.UserInputType == Enum.UserInputType.Touch then
                u98 = p105
            end
        end)
        _UserInputService2.InputChanged:Connect(function(p106)
            if p106 == u98 and u97 then
                u103(p106)
            end
        end)
    end

    local _ThunderZ = ({
        Window = function(_, p108, p109, p110)
            local u111 = false
            local v112 = p110 or Enum.KeyCode.RightControl
            local u113 = string.gsub(tostring(v112), 'Enum.KeyCode.', '')
            local _ScreenGui3 = Instance.new('ScreenGui')

            _ScreenGui3.Name = 'THUNDERZ'
            _ScreenGui3.Parent = game.CoreGui
            _ScreenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            local _Frame13 = Instance.new('Frame')

            _Frame13.Name = 'Main'
            _Frame13.Parent = _ScreenGui3
            _Frame13.ClipsDescendants = true
            _Frame13.AnchorPoint = Vector2.new(0.5, 0.5)
            _Frame13.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            _Frame13.Position = UDim2.new(0.5, 0, 0.5, 0)
            _Frame13.Size = UDim2.new(0, 0, 0, 0)

            local v116 = _Frame13

            _Frame13.TweenSize(v116, UDim2.new(0, 286, 0, 320), 'Out', 'Quad', 0.4, true)

            local _UICorner15 = Instance.new('UICorner')

            _UICorner15.Name = 'MCNR'
            _UICorner15.Parent = _Frame13

            local _Frame14 = Instance.new('Frame')

            _Frame14.Name = 'Top'
            _Frame14.Parent = _Frame13
            _Frame14.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            _Frame14.Size = UDim2.new(0, 286, 0, 27)

            local _UICorner16 = Instance.new('UICorner')

            _UICorner16.Name = 'TCNR'
            _UICorner16.Parent = _Frame14

            local _ImageLabel4 = Instance.new('ImageLabel')

            _ImageLabel4.Name = 'Logo'
            _ImageLabel4.Parent = _Frame14
            _ImageLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ImageLabel4.BackgroundTransparency = 1
            _ImageLabel4.Position = UDim2.new(0, 10, 0, 1)
            _ImageLabel4.Size = UDim2.new(0, 30, 0, 25)
            _ImageLabel4.Image = 'rbxassetid://' .. tostring(p109 or 0)

            local _TextLabel9 = Instance.new('TextLabel')

            _TextLabel9.Name = 'Name'
            _TextLabel9.Parent = _Frame14
            _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel9.BackgroundTransparency = 1
            _TextLabel9.Position = UDim2.new(0.1709756112, 0, 0, 0)
            _TextLabel9.Size = UDim2.new(0, 61, 0, 27)
            _TextLabel9.Font = Enum.Font.GothamSemibold
            _TextLabel9.Text = p108
            _TextLabel9.TextColor3 = Color3.fromRGB(225, 225, 225)
            _TextLabel9.TextSize = 17

            local _TextLabel10 = Instance.new('TextLabel')

            _TextLabel10.Name = 'Hub'
            _TextLabel10.Parent = _Frame14
            _TextLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel10.BackgroundTransparency = 1
            _TextLabel10.Position = UDim2.new(0, 130, 0, 0)
            _TextLabel10.Size = UDim2.new(0, 81, 0, 27)
            _TextLabel10.Font = Enum.Font.GothamSemibold
            _TextLabel10.Text = '[ Aimbot ]'
            _TextLabel10.TextColor3 = _G.Color
            _TextLabel10.TextSize = 17
            _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left

            local _Frame15 = Instance.new('Frame')

            _Frame15.Name = 'Page'
            _Frame15.Parent = _Frame13
            _Frame15.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            _Frame15.Position = UDim2.new(0.01, 0, 0.077000003, 0)
            _Frame15.Size = UDim2.new(0, 280, 0, 289)
            _Frame10.Name = 'Profile'
            _Frame10.Parent = _Frame15
            _Frame10.BackgroundColor3 = Color3.fromRGB(0, 225, 225)
            _Frame10.Position = UDim2.new(0.0570342205, 0, 0.1, 0)
            _Frame10.Size = UDim2.new(0, 60, 0, 60)
            _UICorner11.CornerRadius = UDim.new(0, 100)
            _UICorner11.Name = 'ProfileCorner'
            _UICorner11.Parent = _Frame10
            _ImageLabel3.Name = 'ImageProfile'
            _ImageLabel3.Parent = _Frame10
            _ImageLabel3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            _ImageLabel3.BackgroundTransparency = 0
            _ImageLabel3.Position = UDim2.new(0, 1, 0, 1)
            _ImageLabel3.Size = UDim2.new(0, 58, 0, 58)
            _ImageLabel3.Image = ''
            _UICorner12.CornerRadius = UDim.new(0, 100)
            _UICorner12.Name = 'ImageProfileCorner'
            _UICorner12.Parent = _ImageLabel3
            _TextLabel5.Name = 'HealthPlayers'
            _TextLabel5.Parent = _Frame10
            _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel5.BackgroundTransparency = 1
            _TextLabel5.Position = UDim2.new(1.24220526, 0, 0.377586216, 0)
            _TextLabel5.Size = UDim2.new(0, 173, 0, 22)
            _TextLabel5.Font = Enum.Font.DenkOne
            _TextLabel5.Text = 'Health | [ None ]'
            _TextLabel5.TextColor3 = Color3.fromRGB(0, 225, 225)
            _TextLabel5.TextSize = 19
            _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel5.TextYAlignment = Enum.TextYAlignment.Bottom
            _TextLabel7.Name = 'loackplayerslabel'
            _TextLabel7.Parent = _Frame10
            _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel7.BackgroundTransparency = 1
            _TextLabel7.Position = UDim2.new(0.1, 0, 1.1, 0)
            _TextLabel7.Size = UDim2.new(0, 173, 0, 22)
            _TextLabel7.Font = Enum.Font.Arcade
            _TextLabel7.Text = 'Lock Players | OFF'
            _TextLabel7.TextColor3 = Color3.fromRGB(0, 225, 225)
            _TextLabel7.TextSize = 19
            _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel7.TextYAlignment = Enum.TextYAlignment.Bottom
            _TextLabel4.Name = 'LevelPlayer'
            _TextLabel4.Parent = _Frame10
            _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel4.BackgroundTransparency = 1
            _TextLabel4.Position = UDim2.new(1.24220526, 0, -0.34, 0)
            _TextLabel4.Size = UDim2.new(0, 173, 0, 22)
            _TextLabel4.Font = Enum.Font.DenkOne
            _TextLabel4.Text = 'Level   | [ None ]'
            _TextLabel4.TextColor3 = Color3.fromRGB(0, 225, 225)
            _TextLabel4.TextSize = 19
            _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel4.TextYAlignment = Enum.TextYAlignment.Bottom
            _TextLabel6.Name = 'NamePlayers'
            _TextLabel6.Parent = _Frame10
            _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel6.BackgroundTransparency = 1
            _TextLabel6.Position = UDim2.new(1.24220526, 0, 0.0109195411, 0)
            _TextLabel6.Size = UDim2.new(0, 173, 0, 22)
            _TextLabel6.Font = Enum.Font.DenkOne
            _TextLabel6.Text = 'Name  | [ None ]'
            _TextLabel6.TextColor3 = Color3.fromRGB(0, 225, 225)
            _TextLabel6.TextSize = 19
            _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
            _TextLabel6.TextYAlignment = Enum.TextYAlignment.Bottom
            _Frame11.Name = 'Healthbar'
            _Frame11.Parent = _Frame10
            _Frame11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame11.Position = UDim2.new(1.23333335, 0, 0.850000024, 0)
            _Frame11.Size = UDim2.new(0, 155, 0, 8)
            _UICorner13.Name = 'HealthbarCorner'
            _UICorner13.Parent = _Frame11
            _Frame12.Name = 'Healthgreen'
            _Frame12.Parent = _Frame11
            _Frame12.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
            _Frame12.Size = UDim2.new(0, 185, 0, 8)
            _UICorner14.Name = 'HealthgreenCorner'
            _UICorner14.Parent = _Frame12
            _TextLabel8.Name = 'GuiName'
            _TextLabel8.Parent = _Frame13
            _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _TextLabel8.BackgroundTransparency = 1
            _TextLabel8.Position = UDim2.new(0, 0, 0.1, 0)
            _TextLabel8.Size = UDim2.new(0, 173, 0, 22)
            _TextLabel8.Font = Enum.Font.Fondamento
            _TextLabel8.Text = ''
            _TextLabel8.TextColor3 = Color3.fromRGB(0, 225, 225)
            _TextLabel8.TextSize = 19

            local _UICorner17 = Instance.new('UICorner')

            _UICorner17.Name = 'PCNR'
            _UICorner17.Parent = _Frame15

            local _Frame16 = Instance.new('Frame')

            _Frame16.Name = 'MainPage'
            _Frame16.Parent = _Frame15
            _Frame16.ClipsDescendants = true
            _Frame16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame16.BackgroundTransparency = 1
            _Frame16.Size = UDim2.new(0, 410, 0, 316)

            local _Folder = Instance.new('Folder')

            _Folder.Name = 'PageList'
            _Folder.Parent = _Frame16

            local _UIPageLayout = Instance.new('UIPageLayout')

            _UIPageLayout.Parent = _Folder
            _UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
            _UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
            _UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
            _UIPageLayout.FillDirection = Enum.FillDirection.Vertical
            _UIPageLayout.Padding = UDim.new(0, 15)
            _UIPageLayout.TweenTime = 0.4
            _UIPageLayout.GamepadInputEnabled = false
            _UIPageLayout.ScrollWheelInputEnabled = false
            _UIPageLayout.TouchInputEnabled = false

            u107(_Frame14, _Frame13)
            _UserInputService2.InputBegan:Connect(function(p128)
                if p128.KeyCode == Enum.KeyCode[u113] then
                    if u111 ~= false then
                        u111 = false

                        _Frame13:TweenSize(UDim2.new(0, 286, 0, 320), 'Out', 'Quad', 0.5, true)
                    else
                        u111 = true

                        _Frame13:TweenSize(UDim2.new(0, 0, 0, 0), 'In', 'Quad', 0.4, true)
                    end
                end
            end)

            return {
                AddToggle = function(_, p129, p130, p131)
                    local v132 = p130 or false
                    local u133 = v132
                    local _Frame17 = Instance.new('Frame')
                    local _UICorner18 = Instance.new('UICorner')
                    local _TextButton4 = Instance.new('TextButton')
                    local _UICorner19 = Instance.new('UICorner')
                    local _TextLabel11 = Instance.new('TextLabel')
                    local _Frame18 = Instance.new('Frame')
                    local _UICorner20 = Instance.new('UICorner')
                    local _Frame19 = Instance.new('Frame')
                    local _UICorner21 = Instance.new('UICorner')

                    _Frame17.Name = 'Toggle'
                    _Frame17.Parent = _Frame15
                    _Frame17.BackgroundColor3 = _G.Color
                    _Frame17.Size = UDim2.new(0, 275, 0, 31)
                    _Frame17.Position = UDim2.new(0, 1, 0, 135)
                    _UICorner18.CornerRadius = UDim.new(0, 5)
                    _UICorner18.Parent = _Frame17
                    _TextButton4.Name = 'Button'
                    _TextButton4.Parent = _Frame17
                    _TextButton4.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _TextButton4.Position = UDim2.new(0, 1, 0, 1)
                    _TextButton4.Size = UDim2.new(0, 273, 0, 29)
                    _TextButton4.AutoButtonColor = false
                    _TextButton4.Font = Enum.Font.SourceSans
                    _TextButton4.Text = ''
                    _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton4.TextSize = 11
                    _UICorner19.CornerRadius = UDim.new(0, 5)
                    _UICorner19.Parent = _TextButton4
                    _TextLabel11.Name = 'Label'
                    _TextLabel11.Parent = _Frame17
                    _TextLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel11.BackgroundTransparency = 1
                    _TextLabel11.Position = UDim2.new(0, 1, 0, 1)
                    _TextLabel11.Size = UDim2.new(0, 220, 0, 29)
                    _TextLabel11.Font = Enum.Font.GothamSemibold
                    _TextLabel11.Text = p129
                    _TextLabel11.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel11.TextSize = 15
                    _Frame18.Name = 'ToggleImage'
                    _Frame18.Parent = _Frame17
                    _Frame18.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                    _Frame18.Position = UDim2.new(0, 220, 0, 5)
                    _Frame18.Size = UDim2.new(0, 45, 0, 20)
                    _UICorner20.CornerRadius = UDim.new(0, 10)
                    _UICorner20.Parent = _Frame18
                    _Frame19.Name = 'Circle'
                    _Frame19.Parent = _Frame18
                    _Frame19.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
                    _Frame19.Position = UDim2.new(0, 2, 0, 2)
                    _Frame19.Size = UDim2.new(0, 16, 0, 16)
                    _UICorner21.CornerRadius = UDim.new(0, 10)
                    _UICorner21.Parent = _Frame19

                    _TextButton4.MouseButton1Click:Connect(function()
                        if u133 ~= false then
                            u133 = false

                            _Frame19:TweenPosition(UDim2.new(0, 2, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame19, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(227, 60, 110),
                            }):Play()
                        else
                            u133 = true

                            _Frame19:TweenPosition(UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame19, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = _G.Color,
                            }):Play()
                        end

                        pcall(p131, u133)
                    end)

                    if v132 == true then
                        u133 = true

                        local v143 = _Frame19

                        _Frame19.TweenPosition(v143, UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.4, true)
                        _TweenService2:Create(_Frame19, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Color,
                        }):Play()
                        pcall(p131, u133)
                    end
                end,
                Button = function(_, p144, p145)
                    local _Frame20 = Instance.new('Frame')
                    local _UICorner22 = Instance.new('UICorner')
                    local _TextButton5 = Instance.new('TextButton')
                    local _UICorner23 = Instance.new('UICorner')
                    local _Frame21 = Instance.new('Frame')
                    local _UICorner24 = Instance.new('UICorner')

                    _Frame20.Name = 'Button'
                    _Frame20.Parent = _Frame15
                    _Frame20.BackgroundColor3 = _G.Color
                    _Frame20.Size = UDim2.new(0, 275, 0, 31)
                    _Frame20.Position = UDim2.new(0, 1, 0, 174)
                    _UICorner22.CornerRadius = UDim.new(0, 5)
                    _UICorner22.Parent = _Frame20
                    _TextButton5.Name = 'TextBtn'
                    _TextButton5.Parent = _Frame20
                    _TextButton5.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _TextButton5.Position = UDim2.new(0, 1, 0, 1)
                    _TextButton5.Size = UDim2.new(0, 273, 0, 29)
                    _TextButton5.AutoButtonColor = false
                    _TextButton5.Font = Enum.Font.GothamSemibold
                    _TextButton5.Text = p144
                    _TextButton5.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextButton5.TextSize = 15
                    _UICorner23.CornerRadius = UDim.new(0, 5)
                    _UICorner23.Parent = _TextButton5
                    _Frame21.Name = 'Black'
                    _Frame21.Parent = _Frame20
                    _Frame21.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame21.BackgroundTransparency = 1
                    _Frame21.BorderSizePixel = 0
                    _Frame21.Position = UDim2.new(0, 1, 0, 1)
                    _Frame21.Size = UDim2.new(0, 273, 0, 29)
                    _UICorner24.CornerRadius = UDim.new(0, 5)
                    _UICorner24.Parent = _Frame21

                    _TextButton5.MouseEnter:Connect(function()
                        _TweenService2:Create(_Frame21, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}):Play()
                    end)
                    _TextButton5.MouseLeave:Connect(function()
                        _TweenService2:Create(_Frame21, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end)
                    _TextButton5.MouseButton1Click:Connect(function()
                        _TextButton5.TextSize = 0

                        _TweenService2:Create(_TextButton5, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextSize = 15}):Play()
                        p145()
                    end)
                end,
                AddButton = function(_, p152, p153)
                    local _Frame22 = Instance.new('Frame')
                    local _UICorner25 = Instance.new('UICorner')
                    local _TextButton6 = Instance.new('TextButton')
                    local _UICorner26 = Instance.new('UICorner')
                    local _Frame23 = Instance.new('Frame')
                    local _UICorner27 = Instance.new('UICorner')

                    _Frame22.Name = 'Button'
                    _Frame22.Parent = _Frame15
                    _Frame22.BackgroundColor3 = _G.Color
                    _Frame22.Size = UDim2.new(0, 275, 0, 31)
                    _Frame22.Position = UDim2.new(0, 1, 0, 254)
                    _UICorner25.CornerRadius = UDim.new(0, 5)
                    _UICorner25.Parent = _Frame22
                    _TextButton6.Name = 'TextBtn'
                    _TextButton6.Parent = _Frame22
                    _TextButton6.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _TextButton6.Position = UDim2.new(0, 1, 0, 1)
                    _TextButton6.Size = UDim2.new(0, 273, 0, 29)
                    _TextButton6.AutoButtonColor = false
                    _TextButton6.Font = Enum.Font.GothamSemibold
                    _TextButton6.Text = p152
                    _TextButton6.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextButton6.TextSize = 15
                    _UICorner26.CornerRadius = UDim.new(0, 5)
                    _UICorner26.Parent = _TextButton6
                    _Frame23.Name = 'Black'
                    _Frame23.Parent = _Frame22
                    _Frame23.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame23.BackgroundTransparency = 1
                    _Frame23.BorderSizePixel = 0
                    _Frame23.Position = UDim2.new(0, 1, 0, 1)
                    _Frame23.Size = UDim2.new(0, 273, 0, 29)
                    _UICorner27.CornerRadius = UDim.new(0, 5)
                    _UICorner27.Parent = _Frame23

                    _TextButton6.MouseEnter:Connect(function()
                        _TweenService2:Create(_Frame23, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}):Play()
                    end)
                    _TextButton6.MouseLeave:Connect(function()
                        _TweenService2:Create(_Frame23, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end)
                    _TextButton6.MouseButton1Click:Connect(function()
                        _TextButton6.TextSize = 0

                        _TweenService2:Create(_TextButton6, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextSize = 15}):Play()
                        p153()
                    end)
                end,
                Toggle = function(_, p160, p161, p162)
                    local v163 = p161 or false
                    local u164 = v163
                    local _Frame24 = Instance.new('Frame')
                    local _UICorner28 = Instance.new('UICorner')
                    local _TextButton7 = Instance.new('TextButton')
                    local _UICorner29 = Instance.new('UICorner')
                    local _TextLabel12 = Instance.new('TextLabel')
                    local _Frame25 = Instance.new('Frame')
                    local _UICorner30 = Instance.new('UICorner')
                    local _Frame26 = Instance.new('Frame')
                    local _UICorner31 = Instance.new('UICorner')

                    _Frame24.Name = 'Toggle'
                    _Frame24.Parent = _Frame15
                    _Frame24.BackgroundColor3 = _G.Color
                    _Frame24.Size = UDim2.new(0, 275, 0, 31)
                    _Frame24.Position = UDim2.new(0, 1, 0, 215)
                    _UICorner28.CornerRadius = UDim.new(0, 5)
                    _UICorner28.Parent = _Frame24
                    _TextButton7.Name = 'Button'
                    _TextButton7.Parent = _Frame24
                    _TextButton7.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _TextButton7.Position = UDim2.new(0, 1, 0, 1)
                    _TextButton7.Size = UDim2.new(0, 273, 0, 29)
                    _TextButton7.AutoButtonColor = false
                    _TextButton7.Font = Enum.Font.SourceSans
                    _TextButton7.Text = ''
                    _TextButton7.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton7.TextSize = 11
                    _UICorner29.CornerRadius = UDim.new(0, 5)
                    _UICorner29.Parent = _TextButton7
                    _TextLabel12.Name = 'Label'
                    _TextLabel12.Parent = _Frame24
                    _TextLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel12.BackgroundTransparency = 1
                    _TextLabel12.Position = UDim2.new(0, 1, 0, 1)
                    _TextLabel12.Size = UDim2.new(0, 220, 0, 29)
                    _TextLabel12.Font = Enum.Font.GothamSemibold
                    _TextLabel12.Text = p160
                    _TextLabel12.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel12.TextSize = 15
                    _Frame25.Name = 'ToggleImage'
                    _Frame25.Parent = _Frame24
                    _Frame25.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                    _Frame25.Position = UDim2.new(0, 220, 0, 5)
                    _Frame25.Size = UDim2.new(0, 45, 0, 20)
                    _UICorner30.CornerRadius = UDim.new(0, 10)
                    _UICorner30.Parent = _Frame25
                    _Frame26.Name = 'Circle'
                    _Frame26.Parent = _Frame25
                    _Frame26.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
                    _Frame26.Position = UDim2.new(0, 2, 0, 2)
                    _Frame26.Size = UDim2.new(0, 16, 0, 16)
                    _UICorner31.CornerRadius = UDim.new(0, 10)
                    _UICorner31.Parent = _Frame26

                    _TextButton7.MouseButton1Click:Connect(function()
                        if u164 ~= false then
                            u164 = false

                            _Frame26:TweenPosition(UDim2.new(0, 2, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame26, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(227, 60, 110),
                            }):Play()
                        else
                            u164 = true

                            _Frame26:TweenPosition(UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame26, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = _G.Color,
                            }):Play()
                        end

                        pcall(p162, u164)
                    end)

                    if v163 == true then
                        u164 = true

                        local v174 = _Frame26

                        _Frame26.TweenPosition(v174, UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.4, true)
                        _TweenService2:Create(_Frame26, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Color,
                        }):Play()
                        pcall(p162, u164)
                    end
                end,
                Toggles = function(_, p175, p176, p177)
                    local v178 = p176 or false
                    local u179 = v178
                    local _Frame27 = Instance.new('Frame')
                    local _UICorner32 = Instance.new('UICorner')
                    local _TextButton8 = Instance.new('TextButton')
                    local _UICorner33 = Instance.new('UICorner')
                    local _TextLabel13 = Instance.new('TextLabel')
                    local _Frame28 = Instance.new('Frame')
                    local _UICorner34 = Instance.new('UICorner')
                    local _Frame29 = Instance.new('Frame')
                    local _UICorner35 = Instance.new('UICorner')

                    _Frame27.Name = 'Toggle'
                    _Frame27.Parent = _Frame15
                    _Frame27.BackgroundColor3 = _G.Color
                    _Frame27.Size = UDim2.new(0, 275, 0, 31)
                    _Frame27.Position = UDim2.new(0, 1, 0, 315)
                    _UICorner32.CornerRadius = UDim.new(0, 5)
                    _UICorner32.Parent = _Frame27
                    _TextButton8.Name = 'Button'
                    _TextButton8.Parent = _Frame27
                    _TextButton8.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _TextButton8.Position = UDim2.new(0, 1, 0, 1)
                    _TextButton8.Size = UDim2.new(0, 273, 0, 29)
                    _TextButton8.AutoButtonColor = false
                    _TextButton8.Font = Enum.Font.SourceSans
                    _TextButton8.Text = ''
                    _TextButton8.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton8.TextSize = 11
                    _UICorner33.CornerRadius = UDim.new(0, 5)
                    _UICorner33.Parent = _TextButton8
                    _TextLabel13.Name = 'Label'
                    _TextLabel13.Parent = _Frame27
                    _TextLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel13.BackgroundTransparency = 1
                    _TextLabel13.Position = UDim2.new(0, 1, 0, 1)
                    _TextLabel13.Size = UDim2.new(0, 220, 0, 29)
                    _TextLabel13.Font = Enum.Font.GothamSemibold
                    _TextLabel13.Text = p175
                    _TextLabel13.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel13.TextSize = 15
                    _Frame28.Name = 'ToggleImage'
                    _Frame28.Parent = _Frame27
                    _Frame28.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                    _Frame28.Position = UDim2.new(0, 220, 0, 5)
                    _Frame28.Size = UDim2.new(0, 45, 0, 20)
                    _UICorner34.CornerRadius = UDim.new(0, 10)
                    _UICorner34.Parent = _Frame28
                    _Frame29.Name = 'Circle'
                    _Frame29.Parent = _Frame28
                    _Frame29.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
                    _Frame29.Position = UDim2.new(0, 2, 0, 2)
                    _Frame29.Size = UDim2.new(0, 16, 0, 16)
                    _UICorner35.CornerRadius = UDim.new(0, 10)
                    _UICorner35.Parent = _Frame29

                    _TextButton8.MouseButton1Click:Connect(function()
                        if u179 ~= false then
                            u179 = false

                            _Frame29:TweenPosition(UDim2.new(0, 2, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame29, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = Color3.fromRGB(227, 60, 110),
                            }):Play()
                        else
                            u179 = true

                            _Frame29:TweenPosition(UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.2, true)
                            _TweenService2:Create(_Frame29, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundColor3 = _G.Color,
                            }):Play()
                        end

                        pcall(p177, u179)
                    end)

                    if v178 == true then
                        u179 = true

                        local v189 = _Frame29

                        _Frame29.TweenPosition(v189, UDim2.new(0, 27, 0, 2), 'Out', 'Sine', 0.4, true)
                        _TweenService2:Create(_Frame29, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Color,
                        }):Play()
                        pcall(p177, u179)
                    end
                end,
                AddSlider = function(_, p190, p191, p192, p193, p194)
                    local _Frame30 = Instance.new('Frame')
                    local _UICorner36 = Instance.new('UICorner')
                    local _Frame31 = Instance.new('Frame')
                    local _UICorner37 = Instance.new('UICorner')
                    local _TextLabel14 = Instance.new('TextLabel')
                    local _Frame32 = Instance.new('Frame')
                    local _TextButton9 = Instance.new('TextButton')
                    local _Frame33 = Instance.new('Frame')
                    local _Frame34 = Instance.new('Frame')
                    local _UICorner38 = Instance.new('UICorner')
                    local _UICorner39 = Instance.new('UICorner')
                    local _Frame35 = Instance.new('Frame')
                    local _UICorner40 = Instance.new('UICorner')
                    local _Frame36 = Instance.new('Frame')
                    local _UICorner41 = Instance.new('UICorner')
                    local _TextBox2 = Instance.new('TextBox')
                    local _UICorner42 = Instance.new('UICorner')

                    _Frame30.Name = 'Slider'
                    _Frame30.Parent = _Frame15
                    _Frame30.BackgroundColor3 = _G.Color
                    _Frame30.BackgroundTransparency = 0
                    _Frame30.Size = UDim2.new(0, 274, 0, 51)
                    _Frame30.Position = UDim2.new(0, 1, 0, 175)
                    _UICorner36.CornerRadius = UDim.new(0, 5)
                    _UICorner36.Name = 'slidercorner'
                    _UICorner36.Parent = _Frame30
                    _Frame31.Name = 'sliderr'
                    _Frame31.Parent = _Frame30
                    _Frame31.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    _Frame31.Position = UDim2.new(0, 1, 0, 1)
                    _Frame31.Size = UDim2.new(0, 272, 0, 49)
                    _UICorner37.CornerRadius = UDim.new(0, 5)
                    _UICorner37.Name = 'sliderrcorner'
                    _UICorner37.Parent = _Frame31
                    _TextLabel14.Name = 'SliderLabel'
                    _TextLabel14.Parent = _Frame31
                    _TextLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextLabel14.BackgroundTransparency = 1
                    _TextLabel14.Position = UDim2.new(0, 15, 0, 0)
                    _TextLabel14.Size = UDim2.new(0, 180, 0, 26)
                    _TextLabel14.Font = Enum.Font.GothamSemibold
                    _TextLabel14.Text = p190
                    _TextLabel14.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextLabel14.TextSize = 16
                    _TextLabel14.TextTransparency = 0
                    _TextLabel14.TextXAlignment = Enum.TextXAlignment.Left
                    _Frame32.Name = 'HAHA'
                    _Frame32.Parent = _Frame31
                    _Frame32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame32.BackgroundTransparency = 1
                    _Frame32.Size = UDim2.new(0, 255, 0, 29)
                    _TextButton9.Name = 'AHEHE'
                    _TextButton9.Parent = _Frame31
                    _TextButton9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _TextButton9.BackgroundTransparency = 1
                    _TextButton9.Position = UDim2.new(0, 10, 0, 35)
                    _TextButton9.Size = UDim2.new(0, 255, 0, 5)
                    _TextButton9.Font = Enum.Font.SourceSans
                    _TextButton9.Text = ''
                    _TextButton9.TextColor3 = Color3.fromRGB(0, 0, 0)
                    _TextButton9.TextSize = 14
                    _Frame33.Name = 'bar'
                    _Frame33.Parent = _TextButton9
                    _Frame33.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _Frame33.Size = UDim2.new(0, 255, 0, 5)
                    _Frame34.Name = 'bar1'
                    _Frame34.Parent = _Frame33
                    _Frame34.BackgroundColor3 = _G.Color
                    _Frame34.BackgroundTransparency = 0
                    _Frame34.Size = UDim2.new(p193 / p192, 0, 0, 5)
                    _UICorner38.CornerRadius = UDim.new(0, 5)
                    _UICorner38.Name = 'bar1corner'
                    _UICorner38.Parent = _Frame34
                    _UICorner39.CornerRadius = UDim.new(0, 5)
                    _UICorner39.Name = 'barcorner'
                    _UICorner39.Parent = _Frame33
                    _Frame35.Name = 'circlebar'
                    _Frame35.Parent = _Frame34
                    _Frame35.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                    _Frame35.Position = UDim2.new(1, -2, 0, -3)
                    _Frame35.Size = UDim2.new(0, 15, 0, 10)
                    _UICorner40.CornerRadius = UDim.new(0, 100)
                    _UICorner40.Parent = _Frame35
                    _Frame36.Name = 'slidervalue'
                    _Frame36.Parent = _Frame31
                    _Frame36.BackgroundColor3 = _G.Color
                    _Frame36.BackgroundTransparency = 0
                    _Frame36.Position = UDim2.new(0, 200, 0, 5)
                    _Frame36.Size = UDim2.new(0, 65, 0, 18)
                    _UICorner41.CornerRadius = UDim.new(0, 5)
                    _UICorner41.Name = 'valuecorner'
                    _UICorner41.Parent = _Frame36
                    _TextBox2.Parent = _Frame36
                    _TextBox2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    _TextBox2.Position = UDim2.new(0, 1, 0, 1)
                    _TextBox2.Size = UDim2.new(0, 63, 0, 16)
                    _TextBox2.Font = Enum.Font.GothamSemibold
                    _TextBox2.TextColor3 = Color3.fromRGB(225, 225, 225)
                    _TextBox2.TextSize = 9
                    _TextBox2.Text = p193
                    _TextBox2.TextTransparency = 0
                    _UICorner42.CornerRadius = UDim.new(0, 5)
                    _UICorner42.Parent = _TextBox2

                    local u212 = game.Players.LocalPlayer:GetMouse()
                    local _UserInputService3 = game:GetService('UserInputService')

                    if Value == nil then
                        Value = p193

                        pcall(function()
                            p194(Value)
                        end)
                    end

                    _TextButton9.MouseButton1Down:Connect(function()
                        Value = math.floor((tonumber(p192) - tonumber(p191)) / 255 * _Frame34.AbsoluteSize.X + tonumber(p191)) or 0

                        pcall(function()
                            p194(Value)
                        end)

                        _Frame34.Size = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X, 0, 255), 0, 5)
                        _Frame35.Position = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X - 2, 0, 245), 0, -3)
                        moveconnection = u212.Move:Connect(function()
                            _TextBox2.Text = Value
                            Value = math.floor((tonumber(p192) - tonumber(p191)) / 255 * _Frame34.AbsoluteSize.X + tonumber(p191))

                            pcall(function()
                                p194(Value)
                            end)

                            _Frame34.Size = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X, 0, 255), 0, 5)
                            _Frame35.Position = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X - 2, 0, 245), 0, -3)
                        end)
                        releaseconnection = _UserInputService3.InputEnded:Connect(function(p214)
                            if p214.UserInputType == Enum.UserInputType.MouseButton1 then
                                Value = math.floor((tonumber(p192) - tonumber(p191)) / 255 * _Frame34.AbsoluteSize.X + tonumber(p191))

                                pcall(function()
                                    p194(Value)
                                end)

                                _Frame34.Size = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X, 0, 255), 0, 5)
                                _Frame35.Position = UDim2.new(0, math.clamp(u212.X - _Frame34.AbsolutePosition.X - 2, 0, 245), 0, -3)

                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end)

                    releaseconnection = _UserInputService3.InputEnded:Connect(function(p215)
                        if p215.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((tonumber(p192) - tonumber(p191)) / 255 * _Frame34.AbsoluteSize.X + tonumber(p191))
                            _TextBox2.Text = Value
                        end
                    end)

                    _TextBox2.FocusLost:Connect(function()
                        if p192 < tonumber(_TextBox2.Text) then
                            _TextBox2.Text = p192
                        end

                        _Frame34.Size = UDim2.new((_TextBox2.Text or 0) / p192, 0, 0, 5)
                        _Frame35.Position = UDim2.new(1, -2, 0, -3)

                        local v216 = _TextBox2
                        local v217 = tostring
                        local _Text2 = _TextBox2.Text

                        if _Text2 then
                            _Text2 = math.floor(_TextBox2.Text / p192 * (p192 - p191) + p191)
                        end

                        v216.Text = v217(_Text2)

                        pcall(p194, _TextBox2.Text)
                    end)
                end,
            }
        end,
    }):Window('ThunderZ', '9906600154', Enum.KeyCode.RightControl)

    _ThunderZ:AddToggle('Show Fov', true, function(p220)
        _G.ShowFov = p220
    end)
    _ThunderZ:Button('Reset Player', function()
        Playersaimbot = nil
        PlayersPosition = nil
        _ImageLabel3.Image = ''
        _TextLabel4.Text = 'Level | [ None ]'
        _TextLabel6.Text = 'Name | [ None ]'
        _TextLabel5.Text = 'Health | [ None ]'
    end)
    _ThunderZ:AddButton('Instant Teleport To Castle on Sea', function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5056.90967, 314.541382, -3156.48413, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)
    _ThunderZ:Toggle('Lock Player', _G.LockPlayer, function(p221)
        _G.LockPlayer = p221
    end)

    local _Circle = Drawing.new('Circle')

    _Circle.Thickness = 2
    _Circle.NumSides = 100
    _Circle.Filled = false
    _Circle.Transparency = 1
    _Circle.Color = Color3.fromRGB(0, 225, 225)

    game:GetService('RunService').Stepped:Connect(function()
        _Circle.Radius = Fov * 6 / 2
        _Circle.Thickness = 2
        _Circle.NumSides = 100
        _Circle.Position = game:GetService('UserInputService'):GetMouseLocation()

        if _G.ShowFov then
            _Circle.Visible = true
        else
            _Circle.Visible = false
        end
    end)
    spawn(function()
        pcall(function()
            while wait() do
                local v223, v224, v225 = pairs(u76:GetPlayers())

                while true do
                    local v226

                    v225, v226 = v223(v224, v225)

                    if v225 == nil then
                        break
                    end
                    if (game.Workspace.Characters:FindFirstChild(v226.Name) or game.Workspace.Characters:FindFirstChild(v226.DisplayName)) and v226.Character:FindFirstChild('HumanoidRootPart') then
                        local v227 = _CurrentCamera:WorldToViewportPoint(v226.Character.HumanoidRootPart.Position)
                        local _magnitude = (Vector2.new(v227.X, v227.Y) - Vector2.new(u75.X, u75.Y)).magnitude

                        if _magnitude < (Fov * 6 - 8) / 2 and _magnitude < math.huge and ((v226.Character.HumanoidRootPart.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 and (v226.Name ~= game.Players.LocalPlayer.Name and _G.LockPlayer == false)) then
                            Playersaimbot = v226.Name
                            PlayersPosition = v226.Character.HumanoidRootPart.Position
                        end
                    end
                end
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if not game:GetService('Players').LocalPlayer.Character:FindFirstChild('HasBuso') then
                    game:GetService('ReplicatedStorage').Remotes.CommF_:InvokeServer('Buso')
                end
            end
        end)
    end)

    function isnil(p229)
        return p229 == nil
    end

    local function u231(p230)
        return math.floor(tonumber(p230) + 0.5)
    end

    Number = math.random(1, 1000000)

    spawn(function()
        while wait() do
            pcall(function()
                local v232, v233, v234 = pairs(game:GetService('Workspace'):GetChildren())

                while true do
                    local u235

                    v234, u235 = v232(v233, v234)

                    if v234 == nil then
                        break
                    end

                    pcall(function()
                        if getgenv().setting.DevilESP then
                            if string.find(u235.Name, 'Fruit') then
                                if u235.Handle:FindFirstChild('NameEsp' .. Number) then
                                    if u235.Name ~= 'Spin Fruit' then
                                        if u235.Name ~= 'Bomb Fruit' then
                                            if u235.Name ~= 'Spike Fruit' then
                                                if u235.Name ~= 'Chop Fruit' then
                                                    if u235.Name ~= 'Spring Fruit' then
                                                        if u235.Name ~= 'Kilo Fruit' then
                                                            if u235.Name ~= 'Bird: Falcon Fruit' then
                                                                if u235.Name ~= 'Smoke Fruit' then
                                                                    if u235.Name ~= 'Flame Fruit' then
                                                                        if u235.Name ~= 'Ice Fruit' then
                                                                            if u235.Name ~= 'Dark Fruit' then
                                                                                if u235.Name ~= 'Sand Fruit' then
                                                                                    if u235.Name ~= 'Revive Fruit' then
                                                                                        if u235.Name ~= 'Diamond Fruit' then
                                                                                            if u235.Name ~= 'Light Fruit' then
                                                                                                if u235.Name ~= 'Love Fruit' then
                                                                                                    if u235.Name ~= 'Rubber Fruit' then
                                                                                                        if u235.Name ~= 'Barrier Fruit' then
                                                                                                            if u235.Name ~= 'Magma Fruit' then
                                                                                                                if u235.Name ~= 'Door Fruit' then
                                                                                                                    if u235.Name ~= 'Quake Fruit' then
                                                                                                                        if u235.Name ~= 'Human: Buddha Fruit' then
                                                                                                                            if u235.Name ~= 'String Fruit' then
                                                                                                                                if u235.Name ~= 'Bird: Phoenix Fruit' then
                                                                                                                                    if u235.Name ~= 'Rumble Fruit' then
                                                                                                                                        if u235.Name ~= 'Paw Fruit' then
                                                                                                                                            if u235.Name ~= 'Gravity Fruit' then
                                                                                                                                                if u235.Name ~= 'Dough Fruit' then
                                                                                                                                                    if u235.Name ~= 'Venom Fruit' then
                                                                                                                                                        if u235.Name ~= 'Shadow Fruit' then
                                                                                                                                                            if u235.Name ~= 'Control Fruit' then
                                                                                                                                                                if u235.Name ~= 'Soul Fruit' then
                                                                                                                                                                    if u235.Name ~= 'Dragon Fruit' then
                                                                                                                                                                        if u235.Name ~= 'Leopard Fruit' then
                                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(0, 225, 225)
                                                                                                                                                                        else
                                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(208, 152, 0)
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(226, 155, 64)
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(128, 187, 219)
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(167, 94, 155)
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(75, 0, 130)
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(191, 162, 144)
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(230, 230, 250)
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(55, 197, 216)
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(55, 197, 216)
                                                                                                                                end
                                                                                                                            else
                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                            end
                                                                                                                        else
                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 234, 0)
                                                                                                                        end
                                                                                                                    else
                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(128, 187, 219)
                                                                                                                    end
                                                                                                                else
                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(0, 100, 0)
                                                                                                                end
                                                                                                            else
                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(207, 16, 32)
                                                                                                            end
                                                                                                        else
                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(50, 205, 50)
                                                                                                        end
                                                                                                    else
                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 20, 147)
                                                                                                    end
                                                                                                else
                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(247, 179, 205)
                                                                                                end
                                                                                            else
                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 255, 102)
                                                                                            end
                                                                                        else
                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(185, 242, 255)
                                                                                        end
                                                                                    else
                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(20, 190, 33)
                                                                                    end
                                                                                else
                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(205, 170, 109)
                                                                                end
                                                                            else
                                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(48, 25, 52)
                                                                            end
                                                                        else
                                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(200, 233, 233)
                                                                        end
                                                                    else
                                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 119, 0)
                                                                    end
                                                                else
                                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                end
                                                            else
                                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(105, 64, 40)
                                                            end
                                                        else
                                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(90, 90, 90)
                                                        end
                                                    else
                                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(163, 162, 165)
                                                    end
                                                else
                                                    u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                    u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(163, 162, 165)
                                                end
                                            else
                                                u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                                u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(163, 162, 165)
                                            end
                                        else
                                            u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                            u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(124, 92, 70)
                                        end
                                    else
                                        u235.Handle['NameEsp' .. Number].TextLabel.Text = u235.Name .. '   \n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                        u235.Handle['NameEsp' .. Number].TextLabel.TextColor3 = Color3.fromRGB(82, 124, 174)
                                    end
                                else
                                    local _BillboardGui = Instance.new('BillboardGui', u235.Handle)

                                    _BillboardGui.Name = 'NameEsp' .. Number
                                    _BillboardGui.ExtentsOffset = Vector3.new(0, 1, 0)
                                    _BillboardGui.Size = UDim2.new(1, 200, 1, 30)
                                    _BillboardGui.Adornee = u235.Handle
                                    _BillboardGui.AlwaysOnTop = true

                                    local _TextLabel15 = Instance.new('TextLabel', _BillboardGui)

                                    _TextLabel15.Font = 'GothamBold'
                                    _TextLabel15.FontSize = 'Size14'
                                    _TextLabel15.TextWrapped = true
                                    _TextLabel15.Size = UDim2.new(1, 0, 1, 0)
                                    _TextLabel15.TextYAlignment = 'Top'
                                    _TextLabel15.BackgroundTransparency = 1
                                    _TextLabel15.TextStrokeTransparency = 0.5
                                    _TextLabel15.TextColor3 = Color3.fromRGB(0, 225, 225)
                                    _TextLabel15.Text = u235.Name .. '\n' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - u235.Handle.Position).Magnitude / 3) .. ' M'
                                end
                            end
                        elseif u235.Handle:FindFirstChild('NameEsp' .. Number) then
                            u235.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                        end
                    end)
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            pcall(function()
                if getgenv().setting.ESPPlayer then
                    local v238, v239, v240 = pairs(game:GetService('Players'):GetPlayers())

                    while true do
                        local v241

                        v240, v241 = v238(v239, v240)

                        if v240 == nil then
                            break
                        end
                        if not isnil(v241.Character) then
                            if v241.Character.Head:FindFirstChild('NameEsp' .. v241.Name) then
                                v241.Character.Head['NameEsp' .. v241.Name].ESP.Text = v241.Name .. ' \n[ ' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - v241.Character.Head.Position).Magnitude / 3) .. ' M ]'
                                v241.Character.Head:FindFirstChild('NameEsp' .. v241.Name).ESP.TextTransparency = 0
                            else
                                local _BillboardGui2 = Instance.new('BillboardGui')
                                local _TextLabel16 = Instance.new('TextLabel')

                                _BillboardGui2.Parent = v241.Character.Head
                                _BillboardGui2.Name = 'NameEsp' .. v241.Name
                                _BillboardGui2.ExtentsOffset = Vector3.new(0, 1, 0)
                                _BillboardGui2.Size = UDim2.new(1, 200, 1, 30)
                                _BillboardGui2.Adornee = v241.Character.Head
                                _BillboardGui2.AlwaysOnTop = true
                                _TextLabel16.Name = 'ESP'
                                _TextLabel16.Parent = _BillboardGui2
                                _TextLabel16.TextTransparency = 0
                                _TextLabel16.BackgroundTransparency = 1
                                _TextLabel16.Size = UDim2.new(0, 200, 0, 30)
                                _TextLabel16.Position = UDim2.new(0, 25, 0, 0)
                                _TextLabel16.Font = Enum.Font.Gotham
                                _TextLabel16.Text = v241.Name .. ' ' .. ' \n[ ' .. u231((game:GetService('Players').LocalPlayer.Character.Head.Position - v241.Character.Head.Position).Magnitude / 3) .. ' M ]'

                                if v241.Team ~= game:GetService('Players').LocalPlayer.Team then
                                    _TextLabel16.TextColor3 = Color3.new(255, 255, 255)
                                else
                                    _TextLabel16.TextColor3 = Color3.new(255, 255, 255)
                                end

                                _TextLabel16.TextSize = 14
                                _TextLabel16.TextStrokeTransparency = 0.5
                                _TextLabel16.TextWrapped = true
                            end
                        end
                    end
                else
                    local v244, v245, v246 = pairs(game:GetService('Players'):GetPlayers())

                    while true do
                        local v247

                        v246, v247 = v244(v245, v246)

                        if v246 == nil then
                            break
                        end
                        if v247.Character.Head:FindFirstChild('NameEsp' .. v247.Name) then
                            v247.Character.Head:FindFirstChild('NameEsp' .. v247.Name).ESP.TextTransparency = 1
                        end
                    end
                end
            end)
        end
    end)
    spawn(function()
        game.GetService(game, 'RunService').RenderStepped:Connect(function()
            if Playersaimbot ~= nil then
                local v248, v249, v250 = pairs(game.Players:GetChildren())

                while true do
                    local v251

                    v250, v251 = v248(v249, v250)

                    if v250 == nil then
                        break
                    end
                    if v251.Name == Playersaimbot and game.Workspace.Characters:FindFirstChild(v251.Name) then
                        _TextLabel4.Text = 'Level  | [ ' .. math.floor(v251.Data.Level.Value) .. ' ]'
                        _TextLabel6.Text = 'Name | ' .. v251.Name
                        _TextLabel5.Text = 'Health | [ ' .. math.floor(v251.Character.Humanoid.Health) .. '/' .. v251.Character.Humanoid.MaxHealth .. ' ]'

                        local u252 = v251.Character.Humanoid.Health / v251.Character.Humanoid.MaxHealth

                        pcall(function()
                            _Frame12:TweenSize(UDim2.new(u252, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                        end)

                        _ImageLabel3.Image = game:GetService('Players'):GetUserThumbnailAsync(v251.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    end
                end
            end
        end)
    end)
    spawn(function()
        game.GetService(game, 'RunService').RenderStepped:Connect(function()
            if _G.LockPlayer then
                _TextLabel7.Text = 'Lock Players | ON'
                _G.LockPlayer = true
            else
                _TextLabel7.Text = 'Lock Players | OFF'
                _G.LockPlayer = false
            end
        end)
    end)
    spawn(function()
        while wait() do
            local v253, v254, v255 = pairs(game.Players:GetChildren())

            while true do
                local v256

                v255, v256 = v253(v254, v255)

                if v255 == nil then
                    break
                end
                if v256.Name == Playersaimbot then
                    PlayersPosition = v256.Character.HumanoidRootPart.Position
                end
            end
        end
    end)
    spawn(function()
        local v257 = getrawmetatable(game)
        local ___namecall = v257.__namecall

        setreadonly(v257, false)

        v257.__namecall = newcclosure(function(...)
            local v259 = getnamecallmethod()
            local v260 = {...}

            if tostring(v259) ~= 'FireServer' or (tostring(v260[1]) ~= 'RemoteEvent' or (tostring(v260[2]) == 'true' or (tostring(v260[2]) == 'false' or Playersaimbot == nil))) then
                return ___namecall(...)
            end
            if type(v260[2]) ~= 'vector' then
                v260[2] = CFrame.new(PlayersPosition)
            else
                v260[2] = PlayersPosition
            end

            return ___namecall(unpack(v260))
        end)
    end)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/Function/Mabar.lua'))()
    u75.Button1Down:Connect(function()
        pcall(function()
            if Playersaimbot ~= nil then
                local v261 = {
                    PlayersPosition,
                    game:GetService('Players'):FindFirstChild(Playersaimbot).Character.HumanoidRootPart,
                }

                game:GetService('Players').LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Name].RemoteFunctionShoot:InvokeServer(unpack(v261))
            end
        end)
    end)
end

-- RUNS SCRIPT INSTANTLY WITHOUT KEY
LoadScript()

pcall(function()
    u3({
        Title = 'Key Bypassed',
        Content = 'Loaded ThunderZ Hub without a key!',
        Delay = 3,
    })
end)
