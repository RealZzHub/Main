local zzUIS = game:GetService("UserInputService")
local zzTweenService = game:GetService("TweenService")
local zzLPlayer = game:GetService("Players").LocalPlayer
local zzMouse = zzLPlayer:GetMouse()
local zzRS = game:GetService("RunService")
local zzTextService = game:GetService("TextService")
local zzHttpService = game:GetService("HttpService")
local zzContentProvider = game:GetService("ContentProvider")
local Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/RealZzHub/MainV2/main/Misc/themes.lua", true))()

task.spawn(function() --preloading xd xd xd
    for _,v in pairs(Themes) do
        local LogoPreload = Instance.new("Decal")
        LogoPreload.Texture = v.Logo
        local BackgroundPreload = Instance.new("Decal")
        BackgroundPreload.Texture = v.Background
        zzContentProvider:PreloadAsync(LogoPreload)
        zzContentProvider:PreloadAsync(BackgroundPreload)
    end
end)

local RainbowSpeed = 7
local Theme = Themes[1]
local IList = {} --we do trolling cuz its 11pm and I want to sleep

function Ripple(Button) -- thanks xbox | edited a little for this ui lib | Hey buy falconss uwu
    Button.ClipsDescendants = true
    if Button:FindFirstChild("Circle") then return end
    task.spawn(function()
        local NewCircle = Instance.new("ImageLabel")
        NewCircle.Name = "NewCircle"
        NewCircle.BackgroundColor3 = Color3.fromRGB(1, 1, 1)
        NewCircle.BackgroundTransparency = 1.000
        NewCircle.BorderSizePixel = 0
        NewCircle.Size = UDim2.new(0, 100, 0, 100)
        NewCircle.ZIndex = 10
        NewCircle.Image = "rbxassetid://266543268"
        NewCircle.ImageTransparency = 0.89999997615814
        NewCircle.Parent = Button
        NewCircle.Position = UDim2.new(0, zzMouse.X - NewCircle.AbsolutePosition.X, 0, zzMouse.Y - NewCircle.AbsolutePosition.Y)

        local Size = 0

        if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
            Size = Button.AbsoluteSize.X * 1.5
        elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
            Size = Button.AbsoluteSize.Y * 1.5
        elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
            Size = Button.AbsoluteSize.X * 1.5
        end
        NewCircle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, -Size / 2, 0.5, -Size / 2), "Out", "Quad", 0.5)
        for Index = 1, 10 do
            NewCircle.ImageTransparency = NewCircle.ImageTransparency + 0.01
            wait(0.5 / 10)
        end
        NewCircle:Destroy()
    end)
end

local DraggingColorpicker = false
function Drag(obj) -- don't know where I got it from, it is 3years old and still working so idc
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
            input.UserInputType == Enum.UserInputType.Touch then
            if not DraggingColorpicker then
                dragging = true
                dragStart = input.Position
                startPos = obj.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end
    end)

    obj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or
            input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    zzUIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

function randomString(v)
    local string = ""
    for i = 1, v do string = string .. string.char(math.random(32, 126)) end
    return string
end

local Library = {}

function Library:Main(GName)

    local UIRevamp = Instance.new("ScreenGui")
    local MainBackground = Instance.new("ImageLabel")
    local Bar = Instance.new("Frame")
    local Logo = Instance.new("ImageButton")
    local Name = Instance.new("TextLabel")
    local GameName = Instance.new("TextLabel")
    local MainBackgroundUICorner = Instance.new("UICorner")
    local ContainerContainer = Instance.new("Folder")
    local TabContainer = Instance.new("ScrollingFrame")
    local TabUIListLayout = Instance.new("UIListLayout")
    local Notifications = Instance.new("Folder", UIRevamp)

    if syn and syn.protect_gui then
        syn.protect_gui(UIRevamp)
        UIRevamp.Parent = game.CoreGui
    elseif gethui then
        UIRevamp.Parent = gethui()
    else
        UIRevamp.Parent = game.CoreGui
    end

    UIRevamp.Name = randomString(math.random(15, 25))
    UIRevamp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainBackground.Name = "MainBackground"
    MainBackground.Parent = UIRevamp
    MainBackground.AnchorPoint = Vector2.new(0.5, 0.5)
    MainBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainBackground.BorderSizePixel = 0
    MainBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainBackground.Size = UDim2.new(0, 540, 0, 300)
    MainBackground.Image = "rbxassetid://7877641241"
    Drag(MainBackground)

    zzUIS.InputBegan:connect(function(key)
        if key.KeyCode == Enum.KeyCode.RightControl then
            MainBackground.Visible = not MainBackground.Visible
        end
    end)

    Bar.Name = "Bar"
    Bar.Parent = MainBackground
    Bar.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0, 205, 0, 0)
    Bar.Size = UDim2.new(0, 5, 1, 0)

    Logo.Name = "Logo"
    Logo.Parent = MainBackground
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0, 10, 0, 10)
    Logo.Size = UDim2.new(0, 35, 0, 35)
    Logo.Image = "rbxassetid://6771656595"

    Name.Name = "Name"
    Name.Parent = MainBackground
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.BorderSizePixel = 0
    Name.Position = UDim2.new(0.0955555588, 0, 0.00700000022, 0)
    Name.Size = UDim2.new(0, 153, 0, 50)
    Name.Font = Enum.Font.Gotham
    Name.Text = "RealZzHub"
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 27.000
    Name.TextXAlignment = Enum.TextXAlignment.Left

    GameName.Name = "GameName"
    GameName.Parent = MainBackground
    GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GameName.BackgroundTransparency = 1.000
    GameName.BorderSizePixel = 0
    GameName.Position = UDim2.new(0, 224, 0, 2)
    GameName.Size = UDim2.new(0, 316, 0, 50)
    GameName.Font = Enum.Font.Gotham
    GameName.Text = tostring(GName) or "undefined"
    GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
    GameName.TextSize = 19.000
    GameName.TextXAlignment = Enum.TextXAlignment.Left

    MainBackgroundUICorner.CornerRadius = UDim.new(0, 4)
    MainBackgroundUICorner.Name = "MainBackgroundUICorner"
    MainBackgroundUICorner.Parent = MainBackground

    ContainerContainer.Name = "ContainerContainer"
    ContainerContainer.Parent = MainBackground

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainBackground
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 0, 0.173333332, 0)
    TabContainer.Size = UDim2.new(0, 199, 0, 242)
    TabContainer.ScrollBarThickness = 3

    TabUIListLayout.Name = "TabUIListLayout"
    TabUIListLayout.Parent = TabContainer
    TabUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabUIListLayout.Padding = UDim.new(0, 5)

    Notifications.Name = "Notifications"

    TabUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            TabContainer.CanvasSize = UDim2.new(0, 0, 0,
                                                TabUIListLayout.AbsoluteContentSize
                                                    .Y)
        end)

    local FirstTab = true
    local Functions = {}
    local Config = {}

    local TabLibrary = {}

    function TabLibrary:Notify(NText, Time)
        NText = tostring(NText) or "undefined"
        Time = tonumber(Time) or 10

        local Notification = Instance.new("Frame")
        local NotificationUICorner = Instance.new("UICorner")
        local NotificationName = Instance.new("TextLabel")
        local NotificationLogo = Instance.new("ImageButton")
        local NotificationText = Instance.new("TextLabel")
        local NotificationClose = Instance.new("TextButton")
        local NotificationBar = Instance.new("Frame")
        local NotificationBarUICorner = Instance.new("UICorner")

        Notification.Name = randomString(10)
        Notification.Parent = Notifications
        Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notification.Position = UDim2.new(0.823282957, 0, 0.876073599, 0)
        Notification.Size = UDim2.new(0, 282, 0, 93)

        NotificationUICorner.CornerRadius = UDim.new(0, 4)
        NotificationUICorner.Name = "NotificationUICorner"
        NotificationUICorner.Parent = Notification

        NotificationName.Name = "NotificationName"
        NotificationName.Parent = Notification
        NotificationName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationName.BackgroundTransparency = 1.000
        NotificationName.BorderSizePixel = 0
        NotificationName.Position = UDim2.new(0.13255322, 0, 0.0215053763, 0)
        NotificationName.Size = UDim2.new(0, 75, 0, 26)
        NotificationName.Font = Enum.Font.Gotham
        NotificationName.Text = "RealZzHub"
        NotificationName.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationName.TextSize = 16.000
        NotificationName.TextXAlignment = Enum.TextXAlignment.Left

        NotificationLogo.Name = "NotificationLogo"
        NotificationLogo.Parent = Notification
        NotificationLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationLogo.BackgroundTransparency = 1.000
        NotificationLogo.BorderSizePixel = 0
        NotificationLogo.Position = UDim2.new(0.0130000003, 0, 0.0280000009, 0)
        NotificationLogo.Size = UDim2.new(0, 26, 0, 26)
        NotificationLogo.Image = "rbxassetid://6771656595"

        NotificationText.Name = "NotificationText"
        NotificationText.Parent = Notification
        NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationText.BackgroundTransparency = 1.000
        NotificationText.BorderSizePixel = 0
        NotificationText.Position = UDim2.new(0.0283687934, 0, 0.419354826, 0)
        NotificationText.Size = UDim2.new(0, 267, 0, 38)
        NotificationText.Font = Enum.Font.Gotham
        NotificationText.Text = NText
        NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationText.TextSize = 12.000
        NotificationText.TextXAlignment = Enum.TextXAlignment.Left
        NotificationText.TextYAlignment = Enum.TextYAlignment.Top

        NotificationClose.Name = "NotificationClose"
        NotificationClose.Parent = Notification
        NotificationClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NotificationClose.BackgroundTransparency = 1.000
        NotificationClose.BorderSizePixel = 0
        NotificationClose.Position = UDim2.new(0.90780139, 0, 0, 0)
        NotificationClose.Rotation = 45.000
        NotificationClose.Size = UDim2.new(0, 26, 0, 26)
        NotificationClose.AutoButtonColor = false
        NotificationClose.Font = Enum.Font.Gotham
        NotificationClose.Text = "+"
        NotificationClose.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotificationClose.TextSize = 29.000

        NotificationBar.Name = "NotificationBar"
        NotificationBar.Parent = Notification
        NotificationBar.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
        NotificationBar.Position = UDim2.new(0, 0, 0.931225836, 0)
        NotificationBar.Size = UDim2.new(0, 282, 0, 6)

        NotificationBarUICorner.CornerRadius = UDim.new(0, 4)
        NotificationBarUICorner.Name = "NotificationBarUICorner"
        NotificationBarUICorner.Parent = NotificationBar

        local function organise()
            local notifies = Notifications:GetChildren()
            local offset = -25
            for i = #notifies, 1, -1 do
                local tween = zzTweenService:Create(notifies[i], TweenInfo.new(0.20, Enum.EasingStyle.Sine), {
                    Position = UDim2.new(0.843282957, 0, 0.926073599, offset)
                })
                tween:Play()
                offset = offset - (notifies[i].AbsoluteSize.Y + 10)
            end
        end
        organise()

        NotificationClose.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local tween = zzTweenService:Create(Notification,
                                                    TweenInfo.new(0.25,
                                                                  Enum.EasingStyle
                                                                      .Sine), {
                    Position = UDim2.new(1, 300, Notification.Position.Y.Scale,
                                         Notification.Position.Y.Offset)
                })
                tween:Play()
                tween.Completed:Connect(function()
                    Notification:Destroy()
                    organise()
                end)
            end
        end)

        local tween1 = zzTweenService:Create(NotificationBar, TweenInfo.new(
                                                 Time, Enum.EasingStyle.Linear),
                                             {Size = UDim2.new(0, 2, 0, 6)})
        tween1:Play()
        tween1.Completed:Connect(function()
            local tween2 = zzTweenService:Create(Notification, TweenInfo.new(
                                                     0.25, Enum.EasingStyle.Sine),
                                                 {
                Position = UDim2.new(1, 300, Notification.Position.Y.Scale,
                                     Notification.Position.Y.Offset)
            })
            tween2:Play()
            tween2.Completed:Connect(function()
                Notification:Destroy()
                organise()
            end)
        end)
    end

    function TabLibrary:NewTab(TName)
        TName = tostring(TName) or "undefined"

        Functions[TName] = {}
        Config[TName] = {}

        local TabButton = Instance.new("Frame")
        local TabButtonUICorner = Instance.new("UICorner")
        local TabName = Instance.new("TextLabel")
        local NewTabContainer = Instance.new("ScrollingFrame")
        local ContainerUIListLayout = Instance.new("UIListLayout")
        local TabToggle = Instance.new("TextButton")
        local TabToggleUICorner = Instance.new("UICorner")

        NewTabContainer.Name = TName .. "Container"
        NewTabContainer.Parent = ContainerContainer
        NewTabContainer.Active = true
        NewTabContainer.Visible = false
        NewTabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NewTabContainer.BackgroundTransparency = 1.000
        NewTabContainer.BorderSizePixel = 0
        NewTabContainer.Position = UDim2.new(0.401851863, 0, 0.173666686, 0)
        NewTabContainer.Size = UDim2.new(0, 317, 0, 241)
        NewTabContainer.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
        NewTabContainer.ScrollBarThickness = 3

        ContainerUIListLayout.Name = "ContainerUIListLayout"
        ContainerUIListLayout.Parent = NewTabContainer
        ContainerUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        ContainerUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerUIListLayout.Padding = UDim.new(0, 5)

        TabButton.Name = TName .. "TabButton"
        TabButton.Parent = TabContainer
        TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        TabButton.Position = UDim2.new(0.0637755096, 0, 0, 0)
        TabButton.Size = UDim2.new(0, 173, 0, 32)

        TabButtonUICorner.CornerRadius = UDim.new(0, 4)
        TabButtonUICorner.Name = "TabButtonUICorner"
        TabButtonUICorner.Parent = TabButton

        TabName.Name = "TabName"
        TabName.Parent = TabButton
        TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabName.BackgroundTransparency = 1.000
        TabName.BorderSizePixel = 0
        TabName.Position = UDim2.new(0.0433526002, 0, 0, 0)
        TabName.Size = UDim2.new(0, 136, 0, 32)
        TabName.Font = Enum.Font.Gotham
        TabName.Text = TName
        TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabName.TextSize = 14.000
        TabName.TextXAlignment = Enum.TextXAlignment.Left

        TabToggle.Name = "TabToggle"
        TabToggle.Parent = TabButton
        TabToggle.BackgroundColor3 = Theme.Color1
        TabToggle.BorderSizePixel = 0
        TabToggle.Position = UDim2.new(0, 144, 0, 5)
        TabToggle.Size = UDim2.new(0, 22, 0, 22)
        TabToggle.Font = Enum.Font.SourceSans
        TabToggle.Text = ""
        TabToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabToggle.TextSize = 14.000
        table.insert(IList, TabToggle)

        TabToggleUICorner.CornerRadius = UDim.new(0, 4)
        TabToggleUICorner.Name = "TabToggleUICorner"
        TabToggleUICorner.Parent = TabToggle

        if FirstTab then
            TabToggle.BackgroundColor3 = Theme.Color2
            NewTabContainer.Visible = true
            FirstTab = false
        end

        ContainerUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            NewTabContainer.CanvasSize = UDim2.new(0, 0, 0,ContainerUIListLayout.AbsoluteContentSize.Y)
        end)

        TabButton.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                for i, v in pairs(TabContainer:GetChildren()) do
                    if v ~= TabUIListLayout then
                        v.TabToggle.BackgroundColor3 = Theme.Color1
                    end
                end
                for i, v in pairs(ContainerContainer:GetChildren()) do
                    v.Visible = false
                end
                TabToggle.BackgroundColor3 = Theme.Color2
                NewTabContainer.Visible = true
                Ripple(TabButton)
            end
        end)
        TabToggle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                for i, v in pairs(TabContainer:GetChildren()) do
                    if v ~= TabUIListLayout then
                        v.TabToggle.BackgroundColor3 = Theme.Color1
                    end
                end
                for i, v in pairs(ContainerContainer:GetChildren()) do
                    v.Visible = false
                end
                TabToggle.BackgroundColor3 = Theme.Color2
                NewTabContainer.Visible = true
                Ripple(TabButton)
            end
        end)

        local ItemLibrary = {}

        function ItemLibrary:NewLabel(LText, Lines)
            LText = tostring(LText) or "undefined"
            Lines = Lines or false

            local Label = Instance.new("TextLabel")
            local LabelUICorner = Instance.new("UICorner")

            Label.Name = "Label"
            Label.Parent = NewTabContainer
            Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0.0457413234, 0, 0, 0)
            Label.Size = UDim2.new(0, 297, 0, 28)
            Label.Font = Enum.Font.Gotham
            Label.Text = LText
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13.000

            LabelUICorner.CornerRadius = UDim.new(0, 4)
            LabelUICorner.Name = "LabelUICorner"
            LabelUICorner.Parent = Label

            if Lines then
                local LabelBarLeft = Instance.new("Frame")
                local LabelBarRight = Instance.new("Frame")

                LabelBarLeft.Name = "LabelBarLeft"
                LabelBarLeft.Parent = Label
                LabelBarLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelBarLeft.BorderSizePixel = 0
                LabelBarLeft.Position = UDim2.new(0, 8, 0.5, -1)
                LabelBarLeft.Size = UDim2.new(0, 55, 0, 1)

                LabelBarRight.Name = "LabelBarRight"
                LabelBarRight.Parent = Label
                LabelBarRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelBarRight.BorderSizePixel = 0
                LabelBarRight.Position = UDim2.new(1, -68, 0.5, -1)
                LabelBarRight.Size = UDim2.new(0, 55, 0, 1)
            end

            local LabelLibrary = {}
            function LabelLibrary:Set(v)
                Label.Text = tostring(v)
            end
            return LabelLibrary
        end

        function ItemLibrary:NewButton(BName, callback)
            BName = tostring(BName) or "undefined"
            callback = callback or function() end

            local ButtonFrame = Instance.new("Frame")
            local ButtonFrameUICorner = Instance.new("UICorner")
            local ButtonButton = Instance.new("TextButton")
            local ButtonButtonUICorner = Instance.new("UICorner")

            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = NewTabContainer
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ButtonFrame.Size = UDim2.new(0, 297, 0, 28)

            ButtonFrameUICorner.CornerRadius = UDim.new(0, 4)
            ButtonFrameUICorner.Name = "ButtonFrameUICorner"
            ButtonFrameUICorner.Parent = ButtonFrame

            ButtonButton.Name = "ButtonButton"
            ButtonButton.Parent = ButtonFrame
            ButtonButton.BackgroundColor3 = Theme.Color1
            ButtonButton.Position = UDim2.new(0, 4, 0, 4)
            ButtonButton.Size = UDim2.new(1, -8, 1, -8)
            ButtonButton.Font = Enum.Font.Gotham
            ButtonButton.Text = BName
            ButtonButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ButtonButton.TextSize = 13.000
            table.insert(IList, ButtonButton)

            ButtonButtonUICorner.CornerRadius = UDim.new(0, 4)
            ButtonButtonUICorner.Name = "ButtonButtonUICorner"
            ButtonButtonUICorner.Parent = ButtonButton

            ButtonButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    pcall(callback)
                    Ripple(ButtonButton)
                end
            end)
        end

        function ItemLibrary:NewToggle(TGName, callback, State)
            TGName = tostring(TGName) or "undefined"
            callback = callback or function() end
            local CurrentState = State or false

            local ToggleFrame = Instance.new("Frame")
            local ToggleFrameUICorner = Instance.new("UICorner")
            local ToggleText = Instance.new("TextLabel")
            local ToggleToggle = Instance.new("TextButton")
            local ToggleToggleUICorner = Instance.new("UICorner")

            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = NewTabContainer
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ToggleFrame.Size = UDim2.new(0, 297, 0, 28)

            ToggleFrameUICorner.CornerRadius = UDim.new(0, 4)
            ToggleFrameUICorner.Name = "ToggleFrameUICorner"
            ToggleFrameUICorner.Parent = ToggleFrame

            ToggleText.Name = "ToggleText"
            ToggleText.Parent = ToggleFrame
            ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleText.BackgroundTransparency = 1.000
            ToggleText.BorderSizePixel = 0
            ToggleText.Position = UDim2.new(0, 6, 0, 0)
            ToggleText.Size = UDim2.new(0, 253, 0, 28)
            ToggleText.Font = Enum.Font.Gotham
            ToggleText.Text = TGName
            ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleText.TextSize = 13.000
            ToggleText.TextXAlignment = Enum.TextXAlignment.Left

            ToggleToggle.Name = "ToggleToggle"
            ToggleToggle.Parent = ToggleFrame
            if not CurrentState then
                ToggleToggle.BackgroundColor3 = Theme.Color1
            else
                ToggleToggle.BackgroundColor3 = Theme.Color2
            end
            pcall(callback, CurrentState)
            Config[TName][TGName] = CurrentState
            ToggleToggle.BorderSizePixel = 0
            ToggleToggle.Position = UDim2.new(0, 271, 0, 3)
            ToggleToggle.Size = UDim2.new(0, 22, 0, 22)
            ToggleToggle.Font = Enum.Font.SourceSans
            ToggleToggle.Text = ""
            ToggleToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleToggle.TextSize = 14.000
            ToggleToggle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    CurrentState = not CurrentState
                    pcall(callback, CurrentState)
                    Config[TName][TGName] = CurrentState

                    if not CurrentState then
                        ToggleToggle.BackgroundColor3 = Theme.Color1
                    else
                        ToggleToggle.BackgroundColor3 = Theme.Color2
                    end
                    Ripple(ToggleFrame)
                end
            end)
            table.insert(IList, ToggleToggle)

            ToggleToggleUICorner.CornerRadius = UDim.new(0, 4)
            ToggleToggleUICorner.Name = "ToggleToggleUICorner"
            ToggleToggleUICorner.Parent = ToggleToggle
            local ToggleLibrary = {}
            function ToggleLibrary:Set(v)
                CurrentState = v
                pcall(callback, CurrentState)

                if not CurrentState then
                    ToggleToggle.BackgroundColor3 = Theme.Color1
                else
                    ToggleToggle.BackgroundColor3 = Theme.Color2
                end
            end
            Functions[TName][TGName] = ToggleLibrary
            return ToggleLibrary
        end

        function ItemLibrary:NewSlider(SName, MinVal, MaxVal, Inc, callback, StartValue)
            SName = tostring(SName) or "undefined"
            MinVal = tonumber(MinVal) or 0
            MaxVal = tonumber(MaxVal) or 100
            Inc = tonumber(Inc) or 1
            callback = callback or function() end
            local Val = tonumber(StartValue) or MinVal
            local SDragging = false

            local SliderFrame = Instance.new("Frame")
            local SliderFrameUICorner = Instance.new("UICorner")
            local SliderBackground = Instance.new("TextButton")
            local Slider = Instance.new("Frame")
            local SliderUICorner = Instance.new("UICorner")
            local SliderBackgroundUICorner = Instance.new("UICorner")
            local SliderText = Instance.new("TextLabel")
            local SliderValue = Instance.new("TextBox")

            SliderFrame.Name = SName.."SliderFrame"
            SliderFrame.Parent = NewTabContainer
            SliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            SliderFrame.Position = UDim2.new(0.0315457396, 0, 0.414937645, 0)
            SliderFrame.Size = UDim2.new(0, 297, 0, 37)

            SliderFrameUICorner.CornerRadius = UDim.new(0, 4)
            SliderFrameUICorner.Name = SName.."SliderFrameUICorner"
            SliderFrameUICorner.Parent = SliderFrame

            SliderBackground.Name = SName.."SliderBackground"
            SliderBackground.Parent = SliderFrame
            SliderBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderBackground.BorderSizePixel = 0
            SliderBackground.Position = UDim2.new(0.0202020202, 0, 0.692000151, 0)
            SliderBackground.Size = UDim2.new(0, 285, 0, 6)
            SliderBackground.AutoButtonColor = false
            SliderBackground.Font = Enum.Font.Gotham
            SliderBackground.Text = ""
            SliderBackground.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderBackground.TextSize = 14.000

            Slider.Name = SName.."Slider"
            Slider.Parent = SliderBackground
            Slider.BackgroundColor3 = Theme.Color1
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(-0.00355871883, 1, -0.266666681, 1)
            Slider.Size = UDim2.new(0, 130, 0, 6)
            table.insert(IList, Slider)

            SliderUICorner.CornerRadius = UDim.new(0, 4)
            SliderUICorner.Name = SName.."SliderUICorner"
            SliderUICorner.Parent = Slider

            SliderBackgroundUICorner.CornerRadius = UDim.new(0, 4)
            SliderBackgroundUICorner.Name = SName.."SliderBackgroundUICorner"
            SliderBackgroundUICorner.Parent = SliderBackground

            SliderText.Name = SName.."SliderText"
            SliderText.Parent = SliderFrame
            SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderText.BackgroundTransparency = 1.000
            SliderText.BorderSizePixel = 0
            SliderText.Position = UDim2.new(0, 6, 0, 4)
            SliderText.Size = UDim2.new(0, 210, 0, 21)
            SliderText.Font = Enum.Font.Gotham
            SliderText.Text = SName
            SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderText.TextSize = 13.000
            SliderText.TextXAlignment = Enum.TextXAlignment.Left

            SliderValue.Name = SName.."SliderValue"
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0, 229, 0, 4)
            SliderValue.Size = UDim2.new(0, 61, 0, 21)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.Text = "50"
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 13.000
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right

            local function set(v)
                if tonumber(v) then
                    if v < MinVal then
                        v = MinVal
                    elseif v > MaxVal then
                        v = MaxVal
                    end
                    local a, b = math.modf(v / Inc)
                    v = math.clamp(Inc * (a + (b > 0.5 and 1 or 0)), MinVal, MaxVal)
                    Val = string.format("%.14g", v)
                    SliderValue.Text = string.format("%.14g", v)
                    Slider:TweenSize(UDim2.new((v - MinVal) / (MaxVal - MinVal), 0, 1, 0), "Out", "Quad", 0.05, true)
                    pcall(callback, tonumber(v))
                    Config[TName][SName] = tonumber(v)
                end
            end

            set(Val)

            SliderValue.Focused:Connect(function()
                SliderValue.PlaceholderText = ""
            end)

            SliderValue.FocusLost:Connect(function()
                if #SliderValue.Text > 0 then
                    if tonumber(SliderValue.Text) then
                        set(tonumber(SliderValue.Text))
                    else
                        SliderValue.Text = Val
                        Slider:TweenSize(UDim2.new((Val - MinVal) / (MaxVal - MinVal), 0, 1, 0), "Out", "Quad", 0.05, true)
                        pcall(callback, v)
                    end
                end
            end)

            SliderBackground.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    SDragging = true
                end
            end)

            SliderBackground.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    SDragging = false
                end
            end)

            zzUIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and SDragging == true then
                    set(MinVal + ((MaxVal - MinVal) * math.clamp((zzMouse.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1)))
                end
            end)
            local SliderLibrary = {}

            function SliderLibrary:Set(v)
                if tonumber(v) then
                    set(tonumber(v))
                else
                    SliderValue.Text = Val
                    Slider:TweenSize(UDim2.new((Val - MinVal) /
                                                   (MaxVal - MinVal), 0, 1, 0),
                                     "Out", "Quad", 0.05, true)
                    pcall(callback, v)
                end
            end
            Functions[TName][SName] = SliderLibrary

            return SliderLibrary
        end

        function ItemLibrary:NewTextBox(TBName, callback, Text, Keep)
            TBName = tostring(TBName) or "undefined"
            callback = callback or function() end
            Keep = Keep or false
            if tostring(Text) then
                pcall(callback, tostring(Text))
                Config[TName][TBName] = tostring(Text)
            end
            Text = tostring(Text) or "..."

            local TextFrame = Instance.new("Frame")
            local TextFrameUICorner = Instance.new("UICorner")
            local TextText = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")
            local TextBoxUICorner = Instance.new("UICorner")

            TextFrame.Name = TBName.."TextFrame"
            TextFrame.Parent = NewTabContainer
            TextFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TextFrame.Position = UDim2.new(-0.0189274456, 0, 0.00333333341, 0)
            TextFrame.Size = UDim2.new(0, 297, 0, 28)

            TextFrameUICorner.CornerRadius = UDim.new(0, 4)
            TextFrameUICorner.Name = "TextFrameUICorner"
            TextFrameUICorner.Parent = TextFrame

            TextText.Name = TBName.."TextText"
            TextText.Parent = TextFrame
            TextText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextText.BackgroundTransparency = 1.000
            TextText.BorderSizePixel = 0
            TextText.Position = UDim2.new(0, 6, 0, 0)
            TextText.Size = UDim2.new(0, 161, 0, 28)
            TextText.Font = Enum.Font.Gotham
            TextText.Text = TBName
            TextText.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextText.TextSize = 13.000
            TextText.TextXAlignment = Enum.TextXAlignment.Left

            TextBox.Name = TBName.."TextBox"
            TextBox.Parent = TextFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TextBox.Position = UDim2.new(0, 125, 0, 3)
            TextBox.Size = UDim2.new(0, 168, 0, 22)
            TextBox.Font = Enum.Font.Gotham
            TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.PlaceholderText = "..."
            TextBox.Text = Text
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 13.000
            TextBox.TextTruncate = 1

            TextBoxUICorner.CornerRadius = UDim.new(0, 4)
            TextBoxUICorner.Name = TBName.."TextBoxUICorner"
            TextBoxUICorner.Parent = TextBox

            TextBox.Focused:Connect(function()
                TextBox.PlaceholderText = ""
            end)

            TextBox.FocusLost:Connect(function()
                if #TextBox.Text > 0 then
                    pcall(callback, TextBox.Text)
                    Config[TName][TBName] = TextBox.Text
                    if not Keep then
                        TextBox.Text = ""
                        TextBox.PlaceholderText = "..."
                    end
                end
            end)
            local TextBoxLibrary = {}
            function TextBoxLibrary:Set(v)
                if #tostring(v) > 0 then
                    TextBox.Text = tostring(v)
                    pcall(callback, tostring(v))
                    Config[TName][TBName] = tostring(v)
                    if not Keep then
                        TextBox.Text = ""
                        TextBox.PlaceholderText = "..."
                    end
                end
            end
            Functions[TName][TBName] = TextBoxLibrary
            return TextBoxLibrary
        end

        function ItemLibrary:NewKeybind(KName, Key, callback)
            KName = tostring(KName) or "undefined"
            callback = callback or function() end
            local CurrentKey = Key.Name

            local KeybindFrame = Instance.new("Frame")
            local KeybindFrameUICorner = Instance.new("UICorner")
            local KeybindText = Instance.new("TextLabel")
            local Keybind = Instance.new("TextButton")
            local KeybindUICorner = Instance.new("UICorner")

            KeybindFrame.Name = KName.."KeybindFrame"
            KeybindFrame.Parent = NewTabContainer
            KeybindFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            KeybindFrame.Size = UDim2.new(0, 297, 0, 28)

            KeybindFrameUICorner.CornerRadius = UDim.new(0, 4)
            KeybindFrameUICorner.Name = "KeybindFrameUICorner"
            KeybindFrameUICorner.Parent = KeybindFrame

            KeybindText.Name = KName.."KeybindText"
            KeybindText.Parent = KeybindFrame
            KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindText.BackgroundTransparency = 1.000
            KeybindText.BorderSizePixel = 0
            KeybindText.Position = UDim2.new(0, 6, 0, 0)
            KeybindText.Size = UDim2.new(0, 210, 0, 28)
            KeybindText.Font = Enum.Font.Gotham
            KeybindText.Text = KName
            KeybindText.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindText.TextSize = 13.000
            KeybindText.TextXAlignment = Enum.TextXAlignment.Left

            Keybind.Name = KName.."Keybind"
            Keybind.Parent = KeybindFrame
            Keybind.BackgroundColor3 = Theme.Color1
            Keybind.Position = UDim2.new(0, 183, 0, 3)
            Keybind.Size = UDim2.new(0, 110, 0, 22)
            Keybind.Font = Enum.Font.Gotham
            Keybind.Text = "[ " .. CurrentKey .. " ]"
            Keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
            Keybind.TextSize = 13.000
            table.insert(IList, Keybind)

            KeybindUICorner.CornerRadius = UDim.new(0, 4)
            KeybindUICorner.Name = KName.."KeybindUICorner"
            KeybindUICorner.Parent = Keybind

            zzUIS.InputBegan:connect(function(cur, pressed)
                if not pressed then
                    if cur.KeyCode.Name == CurrentKey or cur.UserInputType.Name ==
                        CurrentKey then
                        pcall(callback,
                              ((cur.UserInputType == Enum.UserInputType.Keyboard and
                                  cur.KeyCode) or cur.UserInputType))
                    end
                end
            end)

            Keybind.MouseButton1Click:connect(function()
                Keybind.Text = "[ ... ]"
                Ripple(KeybindFrame)
                local i = zzUIS.InputBegan:wait()
                Keybind.Text = "[ " ..
                                   tostring(
                                       (i.UserInputType ==
                                           Enum.UserInputType.Keyboard and
                                           i.KeyCode.Name) or
                                           i.UserInputType.Name) .. " ]"
                CurrentKey = tostring((i.UserInputType ==
                                          Enum.UserInputType.Keyboard and
                                          i.KeyCode.Name) or
                                          i.UserInputType.Name)
                Config[TName][KName] = (i.UserInputType ==
                                           Enum.UserInputType.Keyboard and
                                           i.KeyCode.Name) or
                                           i.UserInputType.Name
            end)
            local KeybindLibrary = {}
            function KeybindLibrary:Set(v)
                CurrentKey = tostring(v)
                Config[TName][KName] = v
                Keybind.Text = "[ " .. tostring(v) .. " ]"
            end
            Functions[TName][KName] = KeybindLibrary
            return KeybindLibrary
        end

        function ItemLibrary:NewDropdown(DName, Items, callback, ShowItem, UseItem)
            DName = tostring(DName) or "undefined"
            callback = callback or function() end
            ShowItem = ShowItem or false
            local Item = UseItem and UseItem or not UseItem and Items[1]
            local Open = false

            pcall(callback, Item)
            Config[TName][DName] = tostring(v)

            local DropdownToggleFrame = Instance.new("Frame")
            local DropdownToggleFrameUICorner = Instance.new("UICorner")
            local DropdownText = Instance.new("TextLabel")
            local DropdownToggle = Instance.new("ImageButton")
            local DropdownContainerFrame = Instance.new("Frame")
            local DropdownContainerFrameUICorner = Instance.new("UICorner")
            local DropdownContainerFrameUIListLayout = Instance.new(
                                                           "UIListLayout")

            DropdownToggleFrame.Name = DName.."DropdownToggleFrame"
            DropdownToggleFrame.Parent = NewTabContainer
            DropdownToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            DropdownToggleFrame.Size = UDim2.new(0, 297, 0, 28)

            DropdownToggleFrameUICorner.CornerRadius = UDim.new(0, 4)
            DropdownToggleFrameUICorner.Name = DName.."DropdownToggleFrameUICorner"
            DropdownToggleFrameUICorner.Parent = DropdownToggleFrame

            DropdownText.Name = DName.."DropdownText"
            DropdownText.Parent = DropdownToggleFrame
            DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.BackgroundTransparency = 1.000
            DropdownText.BorderSizePixel = 0
            DropdownText.Position = UDim2.new(0, 6, 0, 0)
            DropdownText.Size = UDim2.new(0, 253, 0, 28)
            DropdownText.Font = Enum.Font.Gotham
            DropdownText.Text = DName
            if ShowItem then
                DropdownText.Text = DName .. " - " .. Item
            end
            DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.TextSize = 13.000
            DropdownText.TextXAlignment = Enum.TextXAlignment.Left

            DropdownToggle.Name = DName.."DropdownToggle"
            DropdownToggle.Parent = DropdownToggleFrame
            DropdownToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownToggle.BackgroundTransparency = 1.000
            DropdownToggle.Position = UDim2.new(0, 268, 0, 1)
            DropdownToggle.Rotation = -90.000
            DropdownToggle.Size = UDim2.new(0, 25, 0, 25)
            DropdownToggle.Image = "http://www.roblox.com/asset/?id=3192533593"
            DropdownToggle.ImageColor3 = Theme.Color1
            DropdownToggle.ScaleType = Enum.ScaleType.Crop
            table.insert(IList, DropdownToggle)

            DropdownContainerFrame.Name = DName.."DropdownContainerFrame"
            DropdownContainerFrame.Parent = NewTabContainer
            DropdownContainerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            DropdownContainerFrame.Position =
                UDim2.new(0.0315457396, 0, 0.373443991, 0)
            DropdownContainerFrame.Size = UDim2.new(0, 297, 0, 2)
            DropdownContainerFrame.Visible = false
            DropdownContainerFrame.BorderSizePixel = 0

            DropdownContainerFrameUICorner.CornerRadius = UDim.new(0, 4)
            DropdownContainerFrameUICorner.Name =
                "DropdownContainerFrameUICorner"
            DropdownContainerFrameUICorner.Parent = DropdownContainerFrame

            DropdownContainerFrameUIListLayout.Name =
                "DropdownContainerFrameUIListLayout"
            DropdownContainerFrameUIListLayout.Parent = DropdownContainerFrame
            DropdownContainerFrameUIListLayout.SortOrder = Enum.SortOrder
                                                               .LayoutOrder

            local function closeOpen()
                if not Open and (#Items - 1) > 0 then
                    Open = true
                    DropdownContainerFrame.Visible = true
                    local tween = zzTweenService:Create(DropdownContainerFrame,
                                                        TweenInfo.new(0.3,
                                                                      Enum.EasingStyle
                                                                          .Sine),
                                                        {
                        Size = UDim2.new(0, 297, 0,
                                         math.min(((#Items) * 28), 500))
                    })
                    tween:Play()
                    tween.Completed:Connect(function()
                        for _, v in pairs(DropdownContainerFrame:GetChildren()) do
                            if v ~= DropdownContainerFrameUIListLayout and v ~=
                                DropdownContainerFrameUICorner then
                                v.Visible = true
                            end
                        end
                    end)
                    local tween1 = zzTweenService:Create(DropdownToggle,
                                                         TweenInfo.new(0.3,
                                                                       Enum.EasingStyle
                                                                           .Linear,
                                                                       Enum.EasingDirection
                                                                           .In,
                                                                       0),
                                                         {Rotation = 90})
                    tween1:Play()
                else
                    Open = false
                    for _, v in pairs(DropdownContainerFrame:GetChildren()) do
                        if v ~= DropdownContainerFrameUIListLayout and v ~=
                            DropdownContainerFrameUICorner then
                            v.Visible = false
                        end
                    end
                    local tween = zzTweenService:Create(DropdownContainerFrame,
                                                        TweenInfo.new(0.3,
                                                                      Enum.EasingStyle
                                                                          .Sine),
                                                        {
                        Size = UDim2.new(0, 297, 0, 0.2)
                    })
                    tween:Play()
                    tween.Completed:Connect(function()
                        wait(0.15)
                        DropdownContainerFrame.Visible = false
                    end)
                    local tween1 = zzTweenService:Create(DropdownToggle,
                                                         TweenInfo.new(0.3,
                                                                       Enum.EasingStyle
                                                                           .Linear,
                                                                       Enum.EasingDirection
                                                                           .In,
                                                                       0),
                                                         {Rotation = -90})
                    tween1:Play()
                end
            end

            DropdownToggle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    closeOpen()
                    Ripple(DropdownToggleFrame)
                end
            end)

            local function AddItem(v)
                local Example = Instance.new("TextButton")
                local ExampleUICorner = Instance.new("UICorner")

                Example.Name = tostring(v)
                Example.Parent = DropdownContainerFrame
                Example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Example.BackgroundTransparency = 1.000
                Example.Size = UDim2.new(0, 297, 0, 28)
                Example.Font = Enum.Font.Gotham
                Example.Text = tostring(v)
                Example.TextColor3 = Color3.fromRGB(255, 255, 255)
                Example.TextSize = 13.000
                Example.Visible = false

                ExampleUICorner.CornerRadius = UDim.new(0, 4)
                ExampleUICorner.Name = "ExampleUICorner"
                ExampleUICorner.Parent = Example

                Example.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ShowItem then
                            DropdownText.Text = DName .. " - " .. tostring(v)
                        end
                        Item = tostring(v)
                        pcall(callback, tostring(v))
                        Config[TName][DName] = tostring(v)
                        Ripple(Example)
                        wait(0.3)
                        closeOpen()
                    end
                end)
            end

            for _, v in pairs(Items) do AddItem(v) end

            local DropdownLibrary = {}
            function DropdownLibrary:AddItem(v)
                AddItem(v)
                table.insert(Items, v)
            end

            function DropdownLibrary:AddItems(newItems)
                for _, v in pairs(newItems) do
                    AddItem(v)
                    table.insert(Items, v)
                end
            end

            function DropdownLibrary:Clear()
                if Open then closeOpen() end
                for i, v in pairs(DropdownContainerFrame:GetChildren()) do
                    if v ~= DropdownContainerFrameUIListLayout and v ~=
                        DropdownContainerFrameUICorner then
                        v:Destroy()
                        Items = {}
                    end
                end
            end
            function DropdownLibrary:Set(v)
                if table.find(Items, tostring(v)) then
                    if ShowItem then
                        DropdownText.Text = DName .. " - " .. tostring(v)
                    end
                    Item = tostring(v)
                    pcall(callback, tostring(v))
                    Config[TName][DName] = tostring(v)
                    if Open then closeOpen() end
                end
            end
            Functions[TName][DName] = DropdownLibrary
            return DropdownLibrary
        end

        function ItemLibrary:NewColorpicker(CName, callback, Color)
            CName = tostring(CName) or "undefined"
            callback = callback or function() end
            local CurrentColor = Color3.fromHSV(0, 1, 1)
            local IsRainbow = false
            if Color == "Rainbow" then
                IsRainbow = true
            else
                CurrentColor = Color
                print(CurrentColor)
            end
            local Ch, Cs, Cv
            local Cr, Cg, Cb
            local Dragging = false
            local Open = false

            local ColorpickerToggleFrame = Instance.new("Frame")
            local ColorpickerToggleFrameUICorner = Instance.new("UICorner")
            local ColorpickerText = Instance.new("TextLabel")
            local ColorpickerToggle = Instance.new("TextButton")
            local ColorpickerToggleUICorner = Instance.new("UICorner")
            local ColorpickerContainerFrame = Instance.new("Frame")
            local ColorpickerContainerFrameUICorner = Instance.new("UICorner")
            local SatBase = Instance.new("ImageLabel")
            local SatButton = Instance.new("ImageLabel")
            local SatBaseUICorner = Instance.new("UICorner")
            local HueBase = Instance.new("Frame")
            local HueBaseUICorner = Instance.new("UICorner")
            local HueBaseUIGradient = Instance.new("UIGradient")
            local HueButton = Instance.new("ImageLabel")
            local RainbowToggle = Instance.new("TextButton")
            local RainbowToggleUICorner = Instance.new("UICorner")
            local RainbowText = Instance.new("TextLabel")
            local RTextBox = Instance.new("TextBox")
            local RTextBoxUICorner = Instance.new("UICorner")
            local GTextBox = Instance.new("TextBox")
            local GTextBoxUICorner = Instance.new("UICorner")
            local BTextBox = Instance.new("TextBox")
            local BTextBoxUICorner = Instance.new("UICorner")
            local RText = Instance.new("TextLabel")
            local GText = Instance.new("TextLabel")
            local BText = Instance.new("TextLabel")

            ColorpickerToggleFrame.Name = "ColorpickerToggleFrame"
            ColorpickerToggleFrame.Parent = NewTabContainer
            ColorpickerToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ColorpickerToggleFrame.Size = UDim2.new(0, 297, 0, 28)

            ColorpickerToggleFrameUICorner.CornerRadius = UDim.new(0, 4)
            ColorpickerToggleFrameUICorner.Name =
                "ColorpickerToggleFrameUICorner"
            ColorpickerToggleFrameUICorner.Parent = ColorpickerToggleFrame

            ColorpickerText.Name = "ColorpickerText"
            ColorpickerText.Parent = ColorpickerToggleFrame
            ColorpickerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerText.BackgroundTransparency = 1.000
            ColorpickerText.BorderSizePixel = 0
            ColorpickerText.Position = UDim2.new(0, 6, 0, 0)
            ColorpickerText.Size = UDim2.new(0, 216, 0, 28)
            ColorpickerText.Font = Enum.Font.Gotham
            ColorpickerText.Text = CName
            ColorpickerText.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerText.TextSize = 13.000
            ColorpickerText.TextXAlignment = Enum.TextXAlignment.Left

            ColorpickerToggle.Name = "ColorpickerToggle"
            ColorpickerToggle.Parent = ColorpickerToggleFrame
            ColorpickerToggle.BackgroundColor3 = Color3.fromRGB(0,0,0)
            ColorpickerToggle.Position = UDim2.new(0, 222, 0, 3)
            ColorpickerToggle.Size = UDim2.new(0, 71, 0, 22)
            ColorpickerToggle.Font = Enum.Font.Gotham
            ColorpickerToggle.Text = ""
            ColorpickerToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            ColorpickerToggle.TextSize = 13.000

            ColorpickerToggleUICorner.CornerRadius = UDim.new(0, 4)
            ColorpickerToggleUICorner.Name = "ExampleKeybindUICorner"
            ColorpickerToggleUICorner.Parent = ColorpickerToggle

            ColorpickerContainerFrame.Name = "ColorpickerContainerFrame"
            ColorpickerContainerFrame.Parent = NewTabContainer
            ColorpickerContainerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ColorpickerContainerFrame.Position = UDim2.new(0.0315457396, 0, 0.207468882, 0)
            ColorpickerContainerFrame.Size = UDim2.new(0, 297, 0, 124)

            ColorpickerContainerFrameUICorner.CornerRadius = UDim.new(0, 4)
            ColorpickerContainerFrameUICorner.Name =
                "ColorpickerContainerFrameUICorner"
            ColorpickerContainerFrameUICorner.Parent = ColorpickerContainerFrame

            SatBase.Name = "SatBase"
            SatBase.Parent = ColorpickerContainerFrame
            SatBase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SatBase.BorderSizePixel = 0
            SatBase.Position = UDim2.new(0.0240638833, 0, 0.0806451589, 0)
            SatBase.Size = UDim2.new(0, 147, 0, 108)
            SatBase.Image = "rbxassetid://11712625069"
            SatBase.ImageColor3 = Color3.fromRGB(20, 3, 255)
            

            SatButton.Name = "SatButton"
            SatButton.Parent = SatBase
            SatButton.AnchorPoint = Vector2.new(0.5, 0.5)
            SatButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SatButton.BackgroundTransparency = 1.000
            SatButton.Position = UDim2.new(0.488000005, 0, 0.138999999, 0)
            SatButton.Size = UDim2.new(0, 11, 0, 11)
            SatButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
            SatButton.Image = "rbxassetid://244221613"
            SatButton.ImageColor3 = Color3.fromRGB(0, 0, 0)

            SatBaseUICorner.CornerRadius = UDim.new(0, 4)
            SatBaseUICorner.Name = "SatBaseUICorner"
            SatBaseUICorner.Parent = SatBase

            HueBase.Name = "HueBase"
            HueBase.Parent = ColorpickerContainerFrame
            HueBase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueBase.Position = UDim2.new(0.555000007, 0, 0.0810000002, 0)
            HueBase.Size = UDim2.new(0, 20, 0, 107)

            HueBaseUICorner.CornerRadius = UDim.new(0, 4)
            HueBaseUICorner.Name = "HueBaseUICorner"
            HueBaseUICorner.Parent = HueBase

            HueBaseUIGradient.Color = ColorSequence.new {
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 23, 23)),
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(1, 0, 0)),
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
            }
            HueBaseUIGradient.Rotation = 90
            HueBaseUIGradient.Name = "HueBaseUIGradient"
            HueBaseUIGradient.Parent = HueBase

            HueButton.Name = "HueButton"
            HueButton.Parent = HueBase
            HueButton.AnchorPoint = Vector2.new(0.5, 0.5)
            HueButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueButton.BackgroundTransparency = 1.000
            HueButton.Position = UDim2.new(0.488000005, 0, 0.138999999, 0)
            HueButton.Size = UDim2.new(0, 11, 0, 11)
            HueButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
            HueButton.Image = "rbxassetid://244221613"
            HueButton.ImageColor3 = Color3.fromRGB(0, 0, 0)

            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = ColorpickerContainerFrame
            RainbowToggle.BackgroundColor3 = Theme.Color1
            RainbowToggle.Position = UDim2.new(0, 263, 0, 10)
            RainbowToggle.Size = UDim2.new(0, 22, 0, 22)
            RainbowToggle.Font = Enum.Font.Gotham
            RainbowToggle.Text = ""
            RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            RainbowToggle.TextSize = 13.000
            table.insert(IList, RainbowToggle)

            RainbowToggleUICorner.CornerRadius = UDim.new(0, 4)
            RainbowToggleUICorner.Name = "RainbowToggleUICorner"
            RainbowToggleUICorner.Parent = RainbowToggle

            RainbowText.Name = "RainbowText"
            RainbowText.Parent = ColorpickerContainerFrame
            RainbowText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowText.BackgroundTransparency = 1.000
            RainbowText.BorderSizePixel = 0
            RainbowText.Position = UDim2.new(0, 197, 0, 7)
            RainbowText.Size = UDim2.new(0, 62, 0, 28)
            RainbowText.Font = Enum.Font.Gotham
            RainbowText.Text = "Rainbow:"
            RainbowText.TextColor3 = Color3.fromRGB(255, 255, 255)
            RainbowText.TextSize = 13.000
            RainbowText.TextXAlignment = Enum.TextXAlignment.Left

            RTextBox.Name = "RTextBox"
            RTextBox.Parent = ColorpickerContainerFrame
            RTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            RTextBox.Position = UDim2.new(0, 216, 0, 39)
            RTextBox.Size = UDim2.new(0, 69, 0, 22)
            RTextBox.Font = Enum.Font.Gotham
            RTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            RTextBox.PlaceholderText = ""
            RTextBox.Text = "255"
            RTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            RTextBox.TextSize = 13.000

            RTextBoxUICorner.CornerRadius = UDim.new(0, 4)
            RTextBoxUICorner.Name = "RTextBoxUICorner"
            RTextBoxUICorner.Parent = RTextBox

            GTextBox.Name = "GTextBox"
            GTextBox.Parent = ColorpickerContainerFrame
            GTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            GTextBox.Position = UDim2.new(0, 216, 0, 68)
            GTextBox.Size = UDim2.new(0, 69, 0, 22)
            GTextBox.Font = Enum.Font.Gotham
            GTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            GTextBox.PlaceholderText = ""
            GTextBox.Text = "255"
            GTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            GTextBox.TextSize = 13.000

            GTextBoxUICorner.CornerRadius = UDim.new(0, 4)
            GTextBoxUICorner.Name = "GTextBoxUICorner"
            GTextBoxUICorner.Parent = GTextBox

            BTextBox.Name = "BTextBox"
            BTextBox.Parent = ColorpickerContainerFrame
            BTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            BTextBox.Position = UDim2.new(0, 216, 0, 97)
            BTextBox.Size = UDim2.new(0, 69, 0, 22)
            BTextBox.Font = Enum.Font.Gotham
            BTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            BTextBox.PlaceholderText = ""
            BTextBox.Text = "255"
            BTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            BTextBox.TextSize = 13.000

            BTextBoxUICorner.CornerRadius = UDim.new(0, 4)
            BTextBoxUICorner.Name = "BTextBoxUICorner"
            BTextBoxUICorner.Parent = BTextBox

            RText.Name = "RText"
            RText.Parent = ColorpickerContainerFrame
            RText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RText.BackgroundTransparency = 1.000
            RText.BorderSizePixel = 0
            RText.Position = UDim2.new(0, 197, 0, 36)
            RText.Size = UDim2.new(0, 15, 0, 28)
            RText.Font = Enum.Font.Gotham
            RText.Text = "R:"
            RText.TextColor3 = Color3.fromRGB(255, 255, 255)
            RText.TextSize = 13.000
            RText.TextXAlignment = Enum.TextXAlignment.Left

            GText.Name = "GText"
            GText.Parent = ColorpickerContainerFrame
            GText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            GText.BackgroundTransparency = 1.000
            GText.BorderSizePixel = 0
            GText.Position = UDim2.new(0, 197, 0, 65)
            GText.Size = UDim2.new(0, 15, 0, 28)
            GText.Font = Enum.Font.Gotham
            GText.Text = "G:"
            GText.TextColor3 = Color3.fromRGB(255, 255, 255)
            GText.TextSize = 13.000
            GText.TextXAlignment = Enum.TextXAlignment.Left

            BText.Name = "BText"
            BText.Parent = ColorpickerContainerFrame
            BText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BText.BackgroundTransparency = 1.000
            BText.BorderSizePixel = 0
            BText.Position = UDim2.new(0, 198, 0, 94)
            BText.Size = UDim2.new(0, 15, 0, 28)
            BText.Font = Enum.Font.Gotham
            BText.Text = "B:"
            BText.TextColor3 = Color3.fromRGB(255, 255, 255)
            BText.TextSize = 13.000
            BText.TextXAlignment = Enum.TextXAlignment.Left

            RainbowText.Visible = false
            RainbowToggle.Visible = false
            RTextBox.Visible = false
            GTextBox.Visible = false
            BTextBox.Visible = false
            RText.Visible = false
            GText.Visible = false
            BText.Visible = false
            HueButton.Visible = false
            HueBase.Visible = false
            SatButton.Visible = false
            SatBase.Visible = false
            ColorpickerContainerFrame.Visible = false

            local function closeOpen()
                if not Open then
                    ColorpickerContainerFrame.Visible = true
                    local tween = zzTweenService:Create(
                                      ColorpickerContainerFrame, TweenInfo.new(
                                          0.3, Enum.EasingStyle.Sine),
                                      {Size = UDim2.new(0, 297, 0, 124)})
                    tween:Play()
                    tween.Completed:Connect(function()
                        Open = true
                        RainbowText.Visible = true
                        RainbowToggle.Visible = true
                        RTextBox.Visible = true
                        GTextBox.Visible = true
                        BTextBox.Visible = true
                        RText.Visible = true
                        GText.Visible = true
                        BText.Visible = true
                        HueButton.Visible = true
                        HueBase.Visible = true
                        SatButton.Visible = true
                        SatBase.Visible = true
                        ColorpickerContainerFrame.Visible = true
                    end)
                else
                    Open = false
                    RainbowText.Visible = false
                    RainbowToggle.Visible = false
                    RTextBox.Visible = false
                    GTextBox.Visible = false
                    BTextBox.Visible = false
                    RText.Visible = false
                    GText.Visible = false
                    BText.Visible = false
                    HueButton.Visible = false
                    HueBase.Visible = false
                    SatButton.Visible = false
                    SatBase.Visible = false
                    ColorpickerContainerFrame.Visible = false
                    local tween = zzTweenService:Create(
                                      ColorpickerContainerFrame, TweenInfo.new(
                                          0.3, Enum.EasingStyle.Sine),
                                      {Size = UDim2.new(0, 297, 0, 0.2)})
                    tween:Play()
                    tween.Completed:Connect(function()
                        wait(0.15)
                        ColorpickerContainerFrame.Visible = false
                    end)
                end
            end

            ColorpickerToggle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    closeOpen()
                    Ripple(ColorpickerToggleFrame)
                end
            end)

            local function set(h, s, v)
                local tween = zzTweenService:Create(HueButton, TweenInfo.new(0.05,Enum.EasingStyle.Sine),{Position = UDim2.new(0.5, 0, h, 0)})
                tween:Play()
                local tween1 = zzTweenService:Create(SatButton, TweenInfo.new(0.05,Enum.EasingStyle.Sine),{Position = UDim2.new(s, 0, 1 - v, 0)})
                tween1:Play()
                ColorpickerToggle.BackgroundColor3 = Color3.fromHSV(h, s, v)
                SatBase.ImageColor3 = Color3.fromHSV(h, 1, 1)
                CurrentColor = Color3.fromHSV(h, s, v)
                Ch, Cs, Cv = h, s, v
                Cr, Cg, Cb = math.floor((CurrentColor.R * 255) + 0.5), math.floor((CurrentColor.G * 255) + 0.5), math.floor((CurrentColor.B * 255) + 0.5)
                RTextBox.Text = Cr
                GTextBox.Text = Cg
                BTextBox.Text = Cb
                pcall(callback, Color3.fromHSV(h, s, v))
                if IsRainbow then
                    Config[TName][CName] = "Rainbow"
                else
                    Config[TName][CName] = "Color3.fromHSV("..h..", "..s..", "..v..")"
                end
            end

            if not IsRainbow then
                ColorpickerToggle.BackgroundColor3 = CurrentColor
                set(Color3.toHSV(CurrentColor))
            end

            task.spawn(function()
                while IsRainbow do
                    set(tick() % RainbowSpeed / RainbowSpeed, Cs, Cv)
                    wait()
                end
            end)

            RTextBox.FocusLost:Connect(function()
                if #RTextBox.Text > 0 and tonumber(RTextBox.Text) then
                    local Num = tonumber(RTextBox.Text)
                    if Num < 0 then
                        Num = 0
                    elseif Num > 255 then
                        Num = 255
                    end
                    local Color = Color3.fromRGB(Num, Cg, Cb)
                    set(Color:ToHSV())
                else
                    set(Ch, Cs, Cv)
                end
            end)

            GTextBox.FocusLost:Connect(function()
                if #GTextBox.Text > 0 and tonumber(GTextBox.Text) then
                    local Num = tonumber(GTextBox.Text)
                    if Num < 0 then
                        Num = 0
                    elseif Num > 255 then
                        Num = 255
                    end
                    local Color = Color3.fromRGB(Cr, Num, Cb)
                    set(Color:ToHSV())
                else
                    set(Ch, Cs, Cv)
                end
            end)

            BTextBox.FocusLost:Connect(function()
                if #BTextBox.Text > 0 and tonumber(BTextBox.Text) then
                    local Num = tonumber(BTextBox.Text)
                    if Num < 0 then
                        Num = 0
                    elseif Num > 255 then
                        Num = 255
                    end
                    local Color = Color3.fromRGB(Cr, Cg, Num)
                    set(Color:ToHSV())
                else
                    set(Ch, Cs, Cv)
                end
            end)

            HueBase.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and
                    not Dragging then
                    if IsRainbow then
                        IsRainbow = false
                        RainbowToggle.BackgroundColor3 = Theme.Color1
                    end
                    Dragging = true
                    DraggingColorpicker = true
                    local MC, IC
                    MC = zzMouse.Move:Connect(function()
                        set(math.clamp(
                                (zzMouse.Y - HueBase.AbsolutePosition.Y) /
                                    HueBase.AbsoluteSize.Y, 0, 1), Cs, Cv)
                    end)
                    IC = input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            MC:Disconnect()
                            IC:Disconnect()
                            Dragging = false
                            DraggingColorpicker = false
                        end
                    end)
                end
            end)

            SatBase.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and
                    not Dragging then
                    Dragging = true
                    DraggingColorpicker = true
                    local MC, IC
                    MC = zzMouse.Move:Connect(function()
                        set(Ch,
                            math.clamp(
                                (zzMouse.X - SatBase.AbsolutePosition.X) /
                                    SatBase.AbsoluteSize.X, 0, 1), 1 -
                                math.clamp(
                                    (zzMouse.Y - SatBase.AbsolutePosition.Y) /
                                        SatBase.AbsoluteSize.Y, 0, 1))
                    end)
                    IC = input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            MC:Disconnect()
                            IC:Disconnect()
                            Dragging = false
                            DraggingColorpicker = false
                        end
                    end)
                end
            end)

            RainbowToggle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    IsRainbow = not IsRainbow
                    if not IsRainbow then
                        RainbowToggle.BackgroundColor3 = Theme.Color1
                    else
                        RainbowToggle.BackgroundColor3 = Theme.Color2
                        task.spawn(function()
                            while IsRainbow do
                                set(tick() % RainbowSpeed / RainbowSpeed, Cs, Cv)
                                wait()
                            end
                        end)
                    end
                end
            end)
            local ColorpickerLibrary = {}
            function ColorpickerLibrary:Set(v)
                IsRainbow = false
                RainbowToggle.BackgroundColor3 = Theme.Color1
                if tostring(v) and tostring(v) == "Rainbow" then
                    IsRainbow = true
                    RainbowToggle.BackgroundColor3 = Theme.Color2
                    task.spawn(function()
                        while IsRainbow do
                            set(tick() % RainbowSpeed / RainbowSpeed, Cs, Cv)
                            wait()
                        end
                    end)
                else
                    set(Color3.toHSV(loadstring(tostring("return "..v))()))
                end
            end
            Functions[TName][CName] = ColorpickerLibrary
            return ColorpickerLibrary
        end

        return ItemLibrary
    end

    function TabLibrary:NewConfigTab(CustomCredits) --messy xd
        if not isfolder("RealZzHub") then makefolder("RealZzHub") end
        if not isfolder("RealZzHub/" .. game.GameId) then
            makefolder("RealZzHub/" .. game.GameId)
        end
        local DefaultConfig = Config
        if DefaultConfig then
            writefile("RealZzHub/" .. game.GameId .. "/default.json", zzHttpService:JSONEncode(DefaultConfig))
        end

        local configs = {"t"}
        local SelectedConfig
        local NM
        local ConfigTab = TabLibrary:NewTab("Settings")

        local ThemesList = {}
        for _,v in pairs(Themes) do
            table.insert(ThemesList, v.Name)
        end

        local function UpdateTheme(SelectedTheme)
            local OldTheme = Theme
            Theme = nil
            for _,v in pairs(Themes) do
                if v.Name == SelectedTheme then
                    Theme = v
                    break
                end
            end
            MainBackground.Image = Theme.Background
            Logo.Image = Theme.Logo
            for _,v in pairs(IList) do
                if v:IsA("ImageButton") then
                    if v.ImageColor3 == OldTheme.Color1 then
                        v.ImageColor3 = Theme.Color1
                    else
                        v.ImageColor3 = Theme.Color2
                    end
                else
                    if v.BackgroundColor3 == OldTheme.Color1 then
                        v.BackgroundColor3 = Theme.Color1
                    else
                        v.BackgroundColor3 = Theme.Color2
                    end
                end
            end
        end

        ConfigTab:NewLabel("Main", true)
        ConfigTab:NewDropdown("Theme", ThemesList, function(v)
            UpdateTheme(v)
        end, true)
        ConfigTab:NewSlider("Rainbow Speed", 1,10,1,function(v)
            RainbowSpeed = 11-v
        end, 7)
        ConfigTab:NewLabel("Configs", true)
        local ConfigDropdown = ConfigTab:NewDropdown("Configs", configs, function(v)
            SelectedConfig = v
        end, true)
        ConfigDropdown:Clear()
        wait(0.2)
        for _, v in pairs(listfiles("RealZzHub/"..game.GameId)) do
            table.insert(configs, string.split(v,"RealZzHub/"..game.GameId.."\\")[2])
            ConfigDropdown:AddItem(tostring(string.split(v,"RealZzHub/"..game.GameId.."\\")[2]))
        end
        ConfigDropdown:Set("default.json")
        ConfigTab:NewButton("Load", function()
            local c = zzHttpService:JSONDecode(readfile("RealZzHub/".. game.GameId.."/"..string.lower(SelectedConfig)))
            for i, v in pairs(c) do
                if Functions[i] and type(v) == "table" then
                    for x, y in pairs(v) do
                        if Functions[i][x] then
                            pcall(function() --pcall just incase, cuz random shit be breaking the whole config. not bothered to replicate the actual issue or search for it so a temporary fix
                                Functions[i][x]:Set(y)
                            end)
                        end
                    end
                end
            end
        end)
        ConfigTab:NewButton("Delete", function()
            if string.lower(SelectedConfig) == "default.json" then
                TabLibrary:Notify("default.json cannot be removed!", 2)
            else
                delfile("RealZzHub/"..game.GameId.."/"..string.lower(SelectedConfig))
                configs = {}
                ConfigDropdown:Clear()
                wait(1)
                for _, v in pairs(listfiles("RealZzHub/" .. game.GameId)) do
                    table.insert(configs, string.split(v,"RealZzHub/"..game.GameId.."\\")[2])
                    ConfigDropdown:AddItem(tostring(string.split(v,"RealZzHub/"..game.GameId .."\\")[2]))
                end
                ConfigDropdown:Set(configs[1])
            end
        end)
        ConfigTab:NewButton("Overwrite", function()
            if string.lower(SelectedConfig) == "default.json" then
                TabLibrary:Notify("Default.json cannot be overwriten!", 2)
            else
                writefile("RealZzHub/"..game.GameId .."/"..string.lower(SelectedConfig),zzHttpService:JSONEncode(Config))
            end
        end)
        ConfigTab:NewTextBox("Config Name", function(v) 
            NM = string.lower(v) 
        end, "...", true)
        ConfigTab:NewButton("Create", function()
            if isfile("RealZzHub/"..game.GameId .."/"..string.lower(NM)..".json") or string.lower(NM) == "default" then
                TabLibrary:Notify("Config already exists!", 2)
            else
                writefile("RealZzHub/"..game.GameId.."/"..string.lower(NM)..".json",zzHttpService:JSONEncode(Config))
                configs = {}
                ConfigDropdown:Clear()
                wait(1)
                for _, v in pairs(listfiles("RealZzHub/"..game.GameId)) do
                    table.insert(configs, string.split(v,"RealZzHub/"..game.GameId.."\\")[2])
                    ConfigDropdown:AddItem(tostring(string.split(v,"RealZzHub/"..game.GameId.."\\")[2]))
                end
                ConfigDropdown:Set(configs[1])
            end
        end)
        CustomCredits = CustomCredits or tostring(game:HttpGet("https://raw.githubusercontent.com/RealZzHub/MainV2/main/Misc/Credits.txt"))
        local Credits = string.split((CustomCredits), ",")
        ConfigTab:NewDropdown("Credits", Credits, function(v)
            return
        end, false)

    end

    return TabLibrary

end

return Library
