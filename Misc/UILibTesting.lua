
-- Hello fat skiddo this is a shitty example so fuck off | edited by 0x44
---misc---
local zzUIS = game:GetService("UserInputService")
local zzTweenService = game:GetService("TweenService")
local zzLPlayer = game:GetService("Players").LocalPlayer
local zzMouse = zzLPlayer:GetMouse()
local zzRS = game:GetService("RunService")

local GHue, GSaturation, GValue = 0, 1, 1

function Ripple(obj, parent) -- thanks xbox | edited a little for this ui lib | Hey buy falconss uwu

	local Button = parent and obj.Parent or obj

	Button.ClipsDescendants = true

	Button:SetAttribute("OriginalColor", Button.BackgroundColor3)

	obj.Activated:Connect(function()
		if Button:FindFirstChild("Circle") then return end

		spawn(function()
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

			NewCircle.Position = UDim2.new(0, zzMouse.X -
				NewCircle.AbsolutePosition.X, 0,
				zzMouse.Y -
					NewCircle.AbsolutePosition.Y)

			local Size = 0

			if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
				Size = Button.AbsoluteSize.X * 1.5
			elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
				Size = Button.AbsoluteSize.Y * 1.5
			elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
				Size = Button.AbsoluteSize.X * 1.5
			end

			NewCircle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size),
				UDim2.new(0.5, -Size / 2, 0.5,
					-Size / 2), "Out", "Quad",
				0.5)

			for Index = 1, 10 do
				NewCircle.ImageTransparency = NewCircle.ImageTransparency + 0.01

				wait(0.5 / 10)
			end

			NewCircle:Destroy()
		end)
	end)
end

function Drag(obj) -- idk some old ass drag i got back when i started still good
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or
			input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = obj.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
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

zzRS:BindToRenderStep("Rainbow", 1000, function()
	local hue2 = tick() % 5 / 5
	GHue, GSaturation, GValue = hue2, 1, 1
end)

---start---

local RealZzLib = {}

function RealZzLib:CreateMain(GameName, xyz)
	local TabF = false
	local ABC = xyz or "RealZzHub"

	local Main = Instance.new("ScreenGui")
	local mainbackground = Instance.new("ImageLabel")
	local Logo = Instance.new("ImageLabel")
	local hubname = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local Bar = Instance.new("Frame")
	local gamename = Instance.new("TextLabel")
	local TabContainer = Instance.new("ScrollingFrame")
	local Containers = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	
	if syn then
	syn.protect_gui(Main)
	Main.Parent = game.CoreGui
	elseif gethui then
	Main.Parent = gethui()
	else
	Main.Parent = game.CoreGui
	end

	Main.Name = GameName
	Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	mainbackground.Name = "mainbackground"
	mainbackground.Parent = Main
	mainbackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	mainbackground.BorderSizePixel = 0
	mainbackground.Position = UDim2.new(0.318, 0, 0.283, 0)
	mainbackground.Size = UDim2.new(0, 601, 0, 352)
	mainbackground.Image = "rbxassetid://7155473879"

	Logo.Name = "Logo"
	Logo.Parent = mainbackground
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0.0249584019, 0, 0.0255681816, 0)
	Logo.Size = UDim2.new(0, 45, 0, 45)
	Logo.Image = "rbxassetid://6771656595"

	hubname.Name = "hubname"
	hubname.Parent = mainbackground
	hubname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	hubname.BackgroundTransparency = 1.000
	hubname.BorderSizePixel = 0
	hubname.Position = UDim2.new(0.101254329, 0, 0.0255681816, 0)
	hubname.Size = UDim2.new(0, 154, 0, 45)
	hubname.Font = Enum.Font.SourceSansSemibold
	hubname.Text = ABC
	hubname.TextColor3 = Color3.fromRGB(255, 255, 255)
	hubname.TextSize = 41.000
	hubname.TextWrapped = true

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = mainbackground

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = mainbackground
	TabContainer.Active = true
	TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer.BackgroundTransparency = 1.000
	TabContainer.BorderSizePixel = 0
	TabContainer.Position = UDim2.new(0.0133111477, 0, 0.15625, 0)
	TabContainer.Size = UDim2.new(0, 198, 0, 287)
	TabContainer.ScrollBarThickness = 5

	UIListLayout.Parent = TabContainer
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	TabContainer.ChildAdded:Connect(function(child)
		TabContainer.CanvasSize = UDim2.new(0, 0, 0,
			UIListLayout.AbsoluteContentSize.Y)
	end)
	TabContainer.ChildRemoved:Connect(function(child)
		TabContainer.CanvasSize = UDim2.new(0, 0, 0,
			UIListLayout.AbsoluteContentSize.Y)
	end)
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
	function()
		TabContainer.CanvasSize = UDim2.new(0, 0, 0,
			UIListLayout.AbsoluteContentSize
			.Y)
	end)

	Containers.Name = "Containers"
	Containers.Parent = mainbackground
	Containers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Containers.BackgroundTransparency = 1.000
	Containers.BorderSizePixel = 0
	Containers.Position = UDim2.new(0.419301122, 0, 0.15625, 0)
	Containers.Size = UDim2.new(0, 339, 0, 276)

	Bar.Name = "Bar"
	Bar.Parent = mainbackground
	Bar.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0.370999992, 0, 0.0270000007, 0)
	Bar.Size = UDim2.new(0, 8, 0, 332)

	gamename.Name = "gamename"
	gamename.Parent = mainbackground
	gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	gamename.BackgroundTransparency = 1.000
	gamename.BorderSizePixel = 0
	gamename.Position = UDim2.new(0.419301152, 0, 0.0255681816, 0)
	gamename.Size = UDim2.new(0, 339, 0, 45)
	gamename.Font = Enum.Font.Gotham
	gamename.Text = GameName
	gamename.TextColor3 = Color3.fromRGB(255, 255, 255)
	gamename.TextSize = 27.000
	gamename.TextXAlignment = Enum.TextXAlignment.Left

	local tweening = false

	local function CloseOpenMain()

		if not tweening then
			if mainbackground.Visible then
				tweening = true
				gamename.Visible = false
				hubname.Visible = false
				Bar.Visible = false
				Containers.Visible = false
				TabContainer.Visible = false
				wait(0.55)
				mainbackground:TweenSize(UDim2.new(0, 47, 0, 47),
					Enum.EasingDirection.In,
					Enum.EasingStyle.Sine, 0.65)
				wait(0.65)
				local Tween = zzTweenService:Create(mainbackground,
					TweenInfo.new(0.2,
						Enum.EasingStyle
						.Linear,
						Enum.EasingDirection
						.Out, 0),
					{Rotation = 360})
				Tween:Play()
				wait(0.55)
				mainbackground.Rotation = 0
				mainbackground.Visible = false
				tweening = false
				return "Done"
			else
				tweening = true
				mainbackground.Visible = true
				wait(0.55)
				local Tween4 = zzTweenService:Create(mainbackground,
					TweenInfo.new(0.2,
						Enum.EasingStyle
						.Linear,
						Enum.EasingDirection
						.Out, 0),
					{Rotation = 360})
				Tween4:Play()
				wait(0.55)
				mainbackground:TweenSize(UDim2.new(0, 601, 0, 352),
					Enum.EasingDirection.In,
					Enum.EasingStyle.Sine, 0.65)
				wait(0.95)
				mainbackground.Rotation = 0
				gamename.Visible = true
				hubname.Visible = true
				Bar.Visible = true
				Containers.Visible = true
				TabContainer.Visible = true
				tweening = false
				return "Done"
			end
		else
			return "Already Tweening"
		end
	end

	Drag(mainbackground)

	zzUIS.InputBegan:connect(function(key)
		if key.KeyCode == Enum.KeyCode.RightControl then CloseOpenMain() end
	end)

	local TabLibrary = {}

	function TabLibrary:NewTab(TabName)

		local Tab = Instance.new("TextButton")
		local Tab1 = Instance.new("ScrollingFrame")
		local UICorner_2 = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		local UIListLayout_2 = Instance.new("UIListLayout")

		Tab.Name = TabName
		Tab.Parent = TabContainer
		Tab.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
		Tab.Position = UDim2.new(0.06313131, 0, 0.0207612459, 0)
		Tab.Size = UDim2.new(0, 173, 0, 44)
		Tab.Font = Enum.Font.Gotham
		Tab.Text = TabName
		Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tab.TextSize = 22.000
		Tab.MouseButton1Click:Connect(function()
			for i, v in pairs(Containers:GetChildren()) do
				v.Visible = false
			end
			Containers:FindFirstChild(TabName).Visible = true
		end)
		UICorner_2.Parent = Tab

		Ripple(Tab, false)

		Tab1.Name = TabName
		Tab1.Parent = Containers
		Tab1.Active = true
		Tab1.Visible = false
		Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab1.BackgroundTransparency = 1.000
		Tab1.BorderSizePixel = 0
		Tab1.Size = UDim2.new(0, 338, 0, 276)
		Tab1.ScrollBarThickness = 5
		Tab1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

		UIListLayout_2.Parent = Tab1
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		if not TabF then

			TabF = true
			Tab1.Visible = true

		end

		Tab1.ChildAdded:Connect(function(child)
			Tab1.CanvasSize = UDim2.new(0, 0, 0,
				UIListLayout_2.AbsoluteContentSize.Y)
		end)
		Tab1.ChildRemoved:Connect(function(child)
			Tab1.CanvasSize = UDim2.new(0, 0, 0,
				UIListLayout_2.AbsoluteContentSize.Y)
		end)
		UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Tab1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y)
		end)

		local MainLibrary = {}

		function MainLibrary:NewToggle(ToggleName, callback, State)
			local CurrentState = State or false
			local TName = ToggleName
            local callback = callback or function() end

			local ToggleContainer = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local ToggleName = Instance.new("TextLabel")
			local ToggleButton = Instance.new("TextButton")
			local UICorner_5 = Instance.new("UICorner")

			ToggleContainer.Name = "ToggleContainer"
			ToggleContainer.Parent = Tab1
			ToggleContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			--   ToggleContainer.Position = UDim2.new(0.352071017, 0, 0.226666659, 0)
			ToggleContainer.Size = UDim2.new(0, 315, 0, 27)

			ToggleName.Name = "ToggleName"
			ToggleName.Parent = ToggleContainer
			ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.BackgroundTransparency = 1.000
			ToggleName.Position = UDim2.new(0.0190476198, 0, 0, 0)
			ToggleName.Size = UDim2.new(0, 224, 0, 27)
			ToggleName.Font = Enum.Font.Gotham
			ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.TextSize = 18.000
			ToggleName.TextXAlignment = Enum.TextXAlignment.Left
			ToggleName.Text = tostring(TName)

			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = ToggleContainer
			if not CurrentState then
				ToggleButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			else
				ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			end
			ToggleButton.Position = UDim2.new(0.913650811, 0, 0.111111112, 0)
			ToggleButton.Size = UDim2.new(0, 21, 0, 21)
			ToggleButton.Font = Enum.Font.SourceSans
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14.000
			ToggleButton.MouseButton1Click:Connect(function()
				CurrentState = not CurrentState
				pcall(callback, CurrentState)

				if not CurrentState then
					ToggleButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
				else
					ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
				end
			end)

			Ripple(ToggleButton, true)
			UICorner_5.CornerRadius = UDim.new(0, 6)
			UICorner_5.Parent = ToggleButton
			UICorner_4.CornerRadius = UDim.new(0, 6)
			UICorner_4.Parent = ToggleContainer

		end

		function MainLibrary:NewButton(ButtonName, callback)
			local BName = ButtonName
            local callback = callback or function() end

			local ButtonContainer = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			local ButtonButton = Instance.new("TextButton")
			local UICorner_7 = Instance.new("UICorner")

			ButtonContainer.Name = "ButtonContainer"
			ButtonContainer.Parent = Tab1
			ButtonContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			ButtonContainer.Size = UDim2.new(0, 315, 0, 27)

			UICorner_6.CornerRadius = UDim.new(0, 6)
			UICorner_6.Parent = ButtonContainer

			ButtonButton.Name = "ButtonButton"
			ButtonButton.Parent = ButtonContainer
			ButtonButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			ButtonButton.Position = UDim2.new(0.0158730168, 0, 0.0740740746, 0)
			ButtonButton.Size = UDim2.new(0, 304, 0, 23)
			ButtonButton.Font = Enum.Font.Gotham
			ButtonButton.Text = tostring(BName)
			ButtonButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonButton.TextSize = 18.000
			ButtonButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)

			Ripple(ButtonButton, false)

			UICorner_7.CornerRadius = UDim.new(0, 6)
			UICorner_7.Parent = ButtonButton

		end

		function MainLibrary:NewLabel(LabelName)
			local LName = LabelName

			local Label = Instance.new("TextLabel")
			local UICorner_3 = Instance.new("UICorner")

			Label.Name = "Label"
			Label.Parent = Tab1
			Label.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Label.Position = UDim2.new(0.0340236686, 0, 0, 0)
			Label.Size = UDim2.new(0, 315, 0, 27)
			Label.Font = Enum.Font.Gotham
			Label.Text = tostring(LName)
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 16.000

			UICorner_3.CornerRadius = UDim.new(0, 6)
			UICorner_3.Parent = Label

            local Label = {}

            function Label:Set(NewName) 
                LName = NewName
                Label.Text = tostring(NewName)
            end
            return Label
		end

		function MainLibrary:NewSlider(SliderName, MinVal, MaxVal, callback, StartValue)
			local SName = SliderName
			local Val = StartValue or MinVal
			local Dragging = false
            local callback = callback or function() end

			local SliderContainer = Instance.new("Frame")
			local UICorner_8 = Instance.new("UICorner")
			local SliderName = Instance.new("TextLabel")
			local SliderValue = Instance.new("TextBox")
			local Slider = Instance.new("TextButton")
			local Slider2 = Instance.new("Frame")
			local UICorner_9 = Instance.new("UICorner")
			local UICorner_10 = Instance.new("UICorner")

			SliderContainer.Name = "SliderContainer"
			SliderContainer.Parent = Tab1
			SliderContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			-- SliderContainer.Position = UDim2.new(0.0340236686, 0, 0.361739129, 0)
			SliderContainer.Size = UDim2.new(0, 315, 0, 37)

			UICorner_8.CornerRadius = UDim.new(0, 6)
			UICorner_8.Parent = SliderContainer

			SliderName.Name = "SliderName"
			SliderName.Parent = SliderContainer
			SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.BackgroundTransparency = 1.000
			SliderName.Position = UDim2.new(0.0190476198, 0, 0, 0)
			SliderName.Size = UDim2.new(0, 187, 0, 23)
			SliderName.Font = Enum.Font.Gotham
			SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.TextSize = 18.000
			SliderName.TextXAlignment = Enum.TextXAlignment.Left
			SliderName.Text = tostring(SName)

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = SliderContainer
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.Position = UDim2.new(0.615999997, 0, 0, 0)
			SliderValue.Size = UDim2.new(0, 115, 0, 23)
			SliderValue.Font = Enum.Font.Gotham
			SliderValue.Text = Val
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 18.000
			SliderValue.TextXAlignment = Enum.TextXAlignment.Right

			Slider.Name = "Slider"
			Slider.Parent = SliderContainer
			Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.0160000008, 0, 0.621999979, 0)
			Slider.Size = UDim2.new(0, 304, 0, 7)
			Slider.AutoButtonColor = false
			Slider.Font = Enum.Font.SourceSans
			Slider.Text = ""
			Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slider.TextSize = 14.000

			Slider2.Name = "Slider2"
			Slider2.Parent = Slider
			Slider2.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			Slider2.Position = UDim2.new(-0.00373679702, 0, -0.00200108113, 0)
			Slider2.Size = UDim2.new(0, 1, 0, 6)
			Slider2.BorderSizePixel = 0

			UICorner_9.CornerRadius = UDim.new(0, 6)
			UICorner_9.Parent = Slider2
			UICorner_10.CornerRadius = UDim.new(0, 6)
			UICorner_10.Parent = Slider

			Tab1.CanvasSize = UDim2.new(0, 0, 0,
				UIListLayout_2.AbsoluteContentSize.Y)

			local function set(v)
				if v < MinVal then
                    v = MinVal
                elseif v > MaxVal then
                    v = MaxVal
				end
				SliderValue.Text = v
				Slider2:TweenSize(UDim2.new((v - MinVal) / (MaxVal - MinVal), 0, 0, 6), "Out", "Quad", 0.05, true)
				pcall(callback, v)
			end
			
			set(Val)

			SliderValue.Focused:Connect(function()
				SliderValue.PlaceholderText = ""
			end)
			
			SliderValue.FocusLost:Connect(function()
				if #SliderValue.Text > 0 then
					if tonumber(s) ~= nil then
					set(tonumber(SliderValue.Text))
					end
				end
			end)

			Slider.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dragging = true
				end
			end)

			Slider.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Dragging = false
				end
			end)

			zzUIS.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging == true then
					local Percent = math.clamp((input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1)
					set(math.floor(MinVal + (math.clamp((input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1) * (MaxVal - MinVal))))
				end
			end)
            local SliderT = {}

            function SliderT:Set(NewVal)
				if tonumber(s) ~= nil then
                	set(tonumber(NewVal))
				end
            end
            return SliderT
		end

		function MainLibrary:NewKeybind(SKeybindName, StartKey, callback)
			local KName = SKeybindName
			local CurrentKey = StartKey.Name
            local callback = callback or function() end

			local KeybindContainer = Instance.new("Frame")
			local UICorner_11 = Instance.new("UICorner")
			local KeybindName = Instance.new("TextLabel")
			local KeybindButton = Instance.new("TextButton")
			local UICorner_12 = Instance.new("UICorner")

			KeybindContainer.Name = "KeybindContainer"
			KeybindContainer.Parent = Tab1
			KeybindContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			KeybindContainer.Size = UDim2.new(0, 315, 0, 27)

			UICorner_11.CornerRadius = UDim.new(0, 6)
			UICorner_11.Parent = KeybindContainer

			KeybindName.Name = "KeybindName"
			KeybindName.Parent = KeybindContainer
			KeybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeybindName.BackgroundTransparency = 1.000
			KeybindName.Position = UDim2.new(0.0190476198, 0, 0.0740740746, 0)
			KeybindName.Size = UDim2.new(0, 187, 0, 23)
			KeybindName.Font = Enum.Font.Gotham
			KeybindName.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindName.TextSize = 18.000
			KeybindName.TextXAlignment = Enum.TextXAlignment.Left
			KeybindName.Text = tostring(KName)

			KeybindButton.Name = "KeybindButton"
			KeybindButton.Parent = KeybindContainer
			KeybindButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			KeybindButton.Position = UDim2.new(0.612698436, 0, 0.0740740746, 0)
			KeybindButton.Size = UDim2.new(0, 116, 0, 23)
			KeybindButton.Font = Enum.Font.Gotham
			KeybindButton.Text = tostring(CurrentKey)
			KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindButton.TextSize = 18.000

			UICorner_12.CornerRadius = UDim.new(0, 6)
			UICorner_12.Parent = KeybindButton

			zzUIS.InputBegan:connect(function(cur, pressed)

				if not pressed then
					if cur.KeyCode.Name == CurrentKey then
						pcall(callback, cur.KeyCode)
					end
				end
			end)

			KeybindButton.MouseButton1Click:connect(function()
				KeybindButton.Text = "..."
				local i, v = zzUIS.InputBegan:wait()
				if i.KeyCode.Name ~= "Unknown" then
					KeybindButton.Text = i.KeyCode.Name
					CurrentKey = i.KeyCode.Name
				end
			end)
		end

		function MainLibrary:NewTextbox(TextboxName, callback) 
			local TBName = TextboxName
            local callback = callback or function() end
			
			local TextContainer = Instance.new("Frame")
			local TextName = Instance.new("TextLabel")
			local UICorner_28 = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_29 = Instance.new("UICorner")
			
			
			TextContainer.Name = "TextContainer"
			TextContainer.Parent = Tab1
			TextContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			TextContainer.Size = UDim2.new(0, 315, 0, 27)

			TextName.Name = "TextName"
			TextName.Parent = TextContainer
			TextName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextName.BackgroundTransparency = 1.000
			TextName.Position = UDim2.new(0.0222222228, 0, 0.0740740746, 0)
			TextName.Size = UDim2.new(0, 187, 0, 23)
			TextName.Font = Enum.Font.Gotham
			TextName.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextName.TextSize = 18.000
			TextName.TextXAlignment = Enum.TextXAlignment.Left
			TextName.Text = tostring(TBName)

			UICorner_28.CornerRadius = UDim.new(0, 6)
			UICorner_28.Parent = TextContainer

			TextBox.Parent = TextContainer
			TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			TextBox.Position = UDim2.new(0.645, 0,0.074, 0)
			TextBox.Size = UDim2.new(0, 105, 0, 23)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderColor3 = Color3.fromRGB(147, 147, 147)
			TextBox.PlaceholderText = "..."
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 14.000

			UICorner_29.CornerRadius = UDim.new(0, 6)
			UICorner_29.Parent = TextBox
			
			TextBox.Focused:Connect(function()
				TextBox.PlaceholderText = ""
			end)
			
			TextBox.FocusLost:Connect(function()
				if #TextBox.Text > 0 then
					pcall(callback, TextBox.Text)
					TextBox.Text = ""
					TextBox.PlaceholderText = "..."
				end
			end)
			
		end

		function MainLibrary:NewDropdown(DropdownName, ItemList, callback, Settings)
			local DName = DropdownName
			local cSize = 0 -- made for later changes
			local DToggled = Settings["Toggled"] or true
            local callback = callback or function() end
			local CurItem = Settings["CurrentItem"] or ItemList[1]
			local ShowSelected = Settings["ShowSelected"] or false

			pcall(callback, CurItem, DToggled)

			local DropdownContainer = Instance.new("Frame")
			local UICorner_20 = Instance.new("UICorner")
			local DropdownName = Instance.new("TextLabel")
			local DropdownToggle = Instance.new("TextButton")
			local UICorner_21 = Instance.new("UICorner")
			local DropdownItemContainer = Instance.new("Frame")
			local UICorner_22 = Instance.new("UICorner")
			local UIListLayout_3 = Instance.new("UIListLayout")
			local DToggleButton = Instance.new("TextButton")
			local UICorner_255 = Instance.new("UICorner")

			local function Dcloseopen() -- it was made quickly so fuck off | making a new one later

				if DropdownItemContainer.Visible then

					DropdownItemContainer:TweenSize(UDim2.new(0, 315, 0, 0),
						Enum.EasingDirection.In,
						Enum.EasingStyle.Sine, 0.3,
						true)

					local Tween = zzTweenService:Create(DropdownToggle,
						TweenInfo.new(0.3,
							Enum.EasingStyle
							.Linear,
							Enum.EasingDirection
							.Out,
							0),
						{Rotation = -90})
					Tween:Play()

					repeat wait() until DropdownItemContainer.Size ==
						UDim2.new(0, 315, 0, 0)
					DropdownItemContainer.Visible = false
				else
					DropdownItemContainer.Size = UDim2.new(0, 315, 0, 0)
					DropdownItemContainer.Visible = true
					DropdownItemContainer:TweenSize(UDim2.new(0, 315, 0, cSize),
						Enum.EasingDirection.In,
						Enum.EasingStyle.Sine, 0.2,
						true)
					local Tween = zzTweenService:Create(DropdownToggle,
						TweenInfo.new(0.3,
							Enum.EasingStyle
							.Linear,
							Enum.EasingDirection
							.Out,
							0),
						{Rotation = 90})
					Tween:Play()

					repeat wait() until DropdownItemContainer.Size ==
						UDim2.new(0, 315, 0, cSize)
				end
			end

			DropdownContainer.Name = "DropdownContainer"
			DropdownContainer.Parent = Tab1
			DropdownContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			DropdownContainer.Size = UDim2.new(0, 315, 0, 27)

			UICorner_20.CornerRadius = UDim.new(0, 6)
			UICorner_20.Parent = DropdownContainer

			DropdownName.Name = "DropdownName"
			DropdownName.Parent = DropdownContainer
			DropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownName.BackgroundTransparency = 1.000
			DropdownName.Position = UDim2.new(0.0190476198, 0, 0.0740740746, 0)
			DropdownName.Size = UDim2.new(0, 187, 0, 23)
			DropdownName.Font = Enum.Font.Gotham
			DropdownName.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownName.TextSize = 18.000
			DropdownName.TextXAlignment = Enum.TextXAlignment.Left
			DropdownName.Text = tostring(DName)
			if ShowSelected then
				DropdownName.Text = tostring(DName).." - "..tostring(CurItem)
			end

			DropdownToggle.Name = "DropdownToggle"
			DropdownToggle.Parent = DropdownContainer
			DropdownToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownToggle.BackgroundTransparency = 1.000
			DropdownToggle.Position = UDim2.new(0.914285719, 0, 0.111111119, 0)
			DropdownToggle.Rotation = -90.000
			DropdownToggle.Size = UDim2.new(0, 21, 0, 21)
			DropdownToggle.Font = Enum.Font.Gotham
			DropdownToggle.Text = ">"
			DropdownToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownToggle.TextSize = 18.000
			DropdownToggle.MouseButton1Click:Connect(function()
				Dcloseopen()

			end)
			Ripple(DropdownToggle, true)

			UICorner_21.CornerRadius = UDim.new(0, 6)
			UICorner_21.Parent = DropdownToggle

			DropdownItemContainer.Name = "DropdownItemContainer"
			DropdownItemContainer.Parent = Tab1
			DropdownItemContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			DropdownItemContainer.Position =
				UDim2.new(0.0340236686, 0, 0.175710157, 0)
			DropdownItemContainer.Size = UDim2.new(0, 315, 0, 0)
			DropdownItemContainer.Visible = false

			UICorner_22.CornerRadius = UDim.new(0, 6)
			UICorner_22.Parent = DropdownItemContainer

			UIListLayout_3.Parent = DropdownItemContainer
			UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

			DToggleButton.Name = "ToggleButton"
			DToggleButton.Parent = DropdownContainer
			DToggleButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			if not DToggled then
				DToggleButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			else
				DToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			end
			DToggleButton.Position = UDim2.new(0.821587324, 0, 0.111111112, 0)
			DToggleButton.Size = UDim2.new(0, 21, 0, 21)
			DToggleButton.Font = Enum.Font.SourceSans
			DToggleButton.Text = ""
			DToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DToggleButton.TextSize = 14.000
			DToggleButton.Visible = Settings["ToggleButton"] or false
			DToggleButton.MouseButton1Click:Connect(function()
				DToggled = not DToggled
				pcall(callback, CurItem, DToggled)

				if not DToggled then
					DToggleButton.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
				else
					DToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
				end
			end)

			UICorner_255.CornerRadius = UDim.new(0, 6)
			UICorner_255.Parent = DToggleButton

            local function newItem(Item)
                local DropdownButton = Instance.new("TextButton")
				local UICorner_23 = Instance.new("UICorner")

				DropdownButton.Name = "DropdownButton"
				DropdownButton.Parent = DropdownItemContainer
				DropdownButton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
				DropdownButton.Size = UDim2.new(0, 315, 0, 27)
				DropdownButton.Font = Enum.Font.Gotham
				DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownButton.TextSize = 16.000
				DropdownButton.Text = tostring(Item)
				DropdownButton.MouseButton1Click:Connect(function()
					CurItem = DropdownButton.Text
					if ShowSelected then
						DropdownName.Text = tostring(DName).." - "..tostring(CurItem)
					end
					pcall(callback, CurItem, DToggled)
					Dcloseopen()
				end)

				UICorner_23.CornerRadius = UDim.new(0, 6)
				UICorner_23.Parent = DropdownButton

				Ripple(DropdownButton, false)

				DropdownItemContainer.Size =
				UDim2.new(0, 315, 0, UIListLayout_3.AbsoluteContentSize.Y)
				cSize = UIListLayout_3.AbsoluteContentSize.Y
            end

			for i, v in pairs(ItemList) do
				newItem(v)
			end

            local Dropdown = {}

            function Dropdown:Clear()
                if DropdownItemContainer.Visible then
					DropdownName.Text = tostring(DName)
                    Dcloseopen()
                end
                for i,v in pairs(DropdownItemContainer:GetChildren()) do
                    v:Destroy()
                    DropdownItemContainer.Size =
					UDim2.new(0, 315, 0, UIListLayout_3.AbsoluteContentSize.Y)
				    cSize = UIListLayout_3.AbsoluteContentSize.Y
                end
            end
            function Dropdown:AddItem(Item)
                for i, v in pairs(Item) do
                    newItem(v)
                end
            end
            return Dropdown
		end

		function MainLibrary:NewColorPicker(ColorPickerName, callback, PresetColor, IsRainbow) 
			local CPName = ColorPickerName
			local sPresetColor = PresetColor or Color3.fromRGB(255,255,255)
			local WheelDown = false
			local SlideDown = false
			local hue, saturation, value = sPresetColor:ToHSV()
			local sRainbow = IsRainbow or false
            local callback = callback or function() end

			local ColorpickerButton = Instance.new("Frame")
			local UICorner_24 = Instance.new("UICorner")
			local ColorpickerName = Instance.new("TextLabel")
			local ColorpickerColorToggle = Instance.new("TextButton")
			local UICorner_25 = Instance.new("UICorner")
			local ColorpickerFrame = Instance.new("Frame")
			local UICorner_26 = Instance.new("UICorner")
			local Wheel = Instance.new("ImageButton")
			local Ring = Instance.new("ImageLabel")
			local Slider_2 = Instance.new("ImageButton")
			local Slide = Instance.new("ImageLabel")
			local Rainbow = Instance.new("TextLabel")
			local ToggleRainbow = Instance.new("TextButton")
			local UICorner_27 = Instance.new("UICorner")
			
			local function CPcloseopen() -- it was made quickly so fuck off | making a new one later

				if ColorpickerFrame.Visible then

					ColorpickerFrame:TweenSize(UDim2.new(0, 315, 0, 0),
						Enum.EasingDirection.In,
						Enum.EasingStyle.Sine, 0.3,
						true)



					repeat wait() until ColorpickerFrame.Size ==
						UDim2.new(0, 315, 0, 0)
					ColorpickerFrame.Visible = false
				else
					ColorpickerFrame.Size = UDim2.new(0, 315, 0, 0)
					ColorpickerFrame.Visible = true
					ColorpickerFrame:TweenSize(UDim2.new(0, 315, 0, 153),
						Enum.EasingDirection.In,
						Enum.EasingStyle.Sine, 0.2,
						true)
					

					repeat wait() until ColorpickerFrame.Size ==
						UDim2.new(0, 315, 0, 153)
				end
			end

			ColorpickerButton.Name = "ColorpickerButton"
			ColorpickerButton.Parent = Tab1
			ColorpickerButton.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			ColorpickerButton.Size = UDim2.new(0, 315, 0, 27)

			UICorner_24.CornerRadius = UDim.new(0, 6)
			UICorner_24.Parent = ColorpickerButton

			ColorpickerName.Name = "ColorpickerName"
			ColorpickerName.Parent = ColorpickerButton
			ColorpickerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerName.BackgroundTransparency = 1.000
			ColorpickerName.Position = UDim2.new(0.0190476198, 0, 0.0740740746,0)
			ColorpickerName.Text = tostring(CPName)
			ColorpickerName.Size = UDim2.new(0, 187, 0, 23)
			ColorpickerName.Font = Enum.Font.Gotham
			ColorpickerName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerName.TextSize = 18.000
			ColorpickerName.TextXAlignment = Enum.TextXAlignment.Left

			ColorpickerColorToggle.Name = "ColorpickerColorToggle"
			ColorpickerColorToggle.Parent = ColorpickerButton
			ColorpickerColorToggle.BackgroundColor3 = sPresetColor
			ColorpickerColorToggle.Position =
				UDim2.new(0.782540083, 0, 0.0740740746, 0)
			ColorpickerColorToggle.Size = UDim2.new(0, 62, 0, 23)
			ColorpickerColorToggle.Font = Enum.Font.Gotham
			ColorpickerColorToggle.Text = ""
			ColorpickerColorToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ColorpickerColorToggle.TextSize = 18.000
			ColorpickerColorToggle.MouseButton1Click:Connect(function()
				CPcloseopen()
			end)
			Ripple(ColorpickerColorToggle, true)

			UICorner_25.CornerRadius = UDim.new(0, 6)
			UICorner_25.Parent = ColorpickerColorToggle

			ColorpickerFrame.Name = "ColorpickerFrame"
			ColorpickerFrame.Parent = Tab1
			ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			ColorpickerFrame.ClipsDescendants = true
			ColorpickerFrame.Position =
				UDim2.new(0.306213021, 0, 0.236695662, 0)
			ColorpickerFrame.Size = UDim2.new(0, 315, 0, 0)
			ColorpickerFrame.Visible = false

			UICorner_26.CornerRadius = UDim.new(0, 6)
			UICorner_26.Parent = ColorpickerFrame

			Wheel.Name = "Wheel"
			Wheel.Parent = ColorpickerFrame
			Wheel.Active = false
			Wheel.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
			Wheel.BackgroundTransparency = 1.000
			Wheel.Position = UDim2.new(0.0476190485, 0, 0.0953594819, 0)
			Wheel.Selectable = false
			Wheel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
			Wheel.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Wheel.AutoButtonColor = false
			Wheel.Image = "rbxassetid://2849458409"

			Ring.Name = "Ring"
			Ring.Parent = Wheel
			Ring.AnchorPoint = Vector2.new(0.5, 0.5)
			Ring.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Ring.BackgroundTransparency = 1.000
			Ring.Position = UDim2.new(0.5, 0, 0.5, 0)
			Ring.Size = UDim2.new(0.0799999982, 0, 0.0799999982, 0)
			Ring.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Ring.Image = "rbxassetid://244221613"
			Ring.ImageColor3 = Color3.fromRGB(0, 0, 0)

			Slider_2.Name = "Slider"
			Slider_2.Parent = Wheel
			Slider_2.Active = false
			Slider_2.BackgroundColor3 = sPresetColor
			Slider_2.BorderSizePixel = 0
			Slider_2.Position = UDim2.new(1.24084973, 0, 0, 0)
			Slider_2.Selectable = false
			Slider_2.Size = UDim2.new(0.150000006, 0, 1, 0)
			Slider_2.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Slider_2.AutoButtonColor = false
			Slider_2.Image = "rbxassetid://156579757"

			Slide.Name = "Slide"
			Slide.Parent = Slider_2
			Slide.AnchorPoint = Vector2.new(0.5, 0.5)
			Slide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slide.BackgroundTransparency = 1.000
			Slide.Position = UDim2.new(0.479999989, 0, 0, 0)
			Slide.Size = UDim2.new(0.0799999982, 0, 0.0799999982, 0)
			Slide.SizeConstraint = Enum.SizeConstraint.RelativeYY
			Slide.Image = "rbxassetid://244221613"
			Slide.ImageColor3 = Color3.fromRGB(0, 0, 0)

			Rainbow.Name = "Rainbow"
			Rainbow.Parent = ColorpickerFrame
			Rainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Rainbow.BackgroundTransparency = 1.000
			Rainbow.Position = UDim2.new(0.647619069, 0, 0.09150327, 0)
			Rainbow.Size = UDim2.new(0, 76, 0, 23)
			Rainbow.Font = Enum.Font.Gotham
			Rainbow.Text = "Rainbow"
			Rainbow.TextColor3 = Color3.fromRGB(255, 255, 255)
			Rainbow.TextSize = 18.000
			Rainbow.TextXAlignment = Enum.TextXAlignment.Left
			
			local function update()
				local color = Color3.fromHSV(hue, saturation, value)

				ColorpickerColorToggle.BackgroundColor3 = color
				Slider_2.BackgroundColor3 = Color3.fromHSV(hue, saturation, 1)
				pcall(callback, Color3.new(color.R,color.G,color.B))

			end

			ToggleRainbow.Name = "ToggleRainbow"
			ToggleRainbow.Parent = ColorpickerFrame
			if not sRainbow then
				ToggleRainbow.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
			else
				ToggleRainbow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			end
			ToggleRainbow.Position = UDim2.new(0.910476208, 0, 0.0980392173, 0)
			ToggleRainbow.Size = UDim2.new(0, 21, 0, 21)
			ToggleRainbow.Font = Enum.Font.SourceSans
			ToggleRainbow.Text = ""
			ToggleRainbow.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleRainbow.TextSize = 14.000
			ToggleRainbow.MouseButton1Click:Connect(function()
				sRainbow = not sRainbow
				if not sRainbow then
					ToggleRainbow.BackgroundColor3 = Color3.fromRGB(166, 79, 219)
				else
					ToggleRainbow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
					spawn(function()
						repeat
							hue = GHue
							saturation = GSaturation
							value = GValue
							update()
							wait(0.01)
						until not sRainbow
						
					end)
				end
			end)

			UICorner_27.CornerRadius = UDim.new(0, 6)
			UICorner_27.Parent = ToggleRainbow

			local function toPolar(o)
				return math.atan2(o.y,o.x), o.magnitude
			end

			local function radToDeg(v)
				return ((v + math.pi) / (2 * math.pi)) * 360
			end

			local function UpdateS(iX, iY)
				local rY = iY - Slider_2.AbsolutePosition.y
				local cY = math.clamp(rY, 0, Slider_2.AbsoluteSize.y -
					Slide.AbsoluteSize.y)
				Slide.Position = UDim2.new(0.5, 0, 0, cY)

				value = 1 -
					(cY /
						(Slider_2.AbsoluteSize.y - Slide.AbsoluteSize.y))
				Slide.BackgroundColor3 = Color3.fromHSV(0, 0, 1 - value)
				
				if sRainbow then
					return
				end
				update()
			end
			local function UpdateR(iX, iY)
				local r = Wheel.AbsoluteSize.x / 2
				local d = Vector2.new(iX, iY) - Wheel.AbsolutePosition -
					Wheel.AbsoluteSize / 2

				if (d:Dot(d) > r * r) then d = d.unit * r end

				Ring.Position = UDim2.new(0.5, d.x, 0.5, d.y)

				local phi, len = toPolar(d * Vector2.new(1, -1))
				hue, saturation = radToDeg(phi) / 360, len / r
				
				if sRainbow then
					return
				end
				Slider_2.BackgroundColor3 = Color3.fromHSV(hue, saturation, 1)
				update()
			end
			Wheel.MouseButton1Down:Connect(function()
				WheelDown = true
				UpdateR(zzMouse.X, zzMouse.Y)
			end)
			Slider_2.MouseButton1Down:Connect(function()
				SlideDown = true
				UpdateS(zzMouse.X, zzMouse.Y)
			end)
			zzUIS.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					WheelDown = false
					SlideDown = false
				end
			end)
			Wheel.MouseMoved:Connect(function()
				if WheelDown then
					UpdateR(zzMouse.X, zzMouse.Y)
				end
			end)
			Slider_2.MouseMoved:Connect(function()
				if SlideDown then
					UpdateS(zzMouse.X, zzMouse.Y)
				end
			end)
			
			

		end
		

		return MainLibrary

	end

	function TabLibrary:Close() return CloseOpenMain() end

	return TabLibrary
end

return RealZzLib

-----------------------------------
