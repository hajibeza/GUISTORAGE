
_G.Color = Color3.fromRGB(255, 33, 33) -- สี Gui (255,178,102)
_G.imageLogo = "https://www.roblox.com/asset-thumbnail/image?assetId=12622586869&width=0&height=0&format=png" -- Logo Gui
_G.Title = "The Best Script For Everyone" -- คำอธิบาย
_G.NameHub = "Unique Hub" -- ชื่อ Hub
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod()=="FireServer" and tostring(Self) == "Received" or tostring(Self) == "Sent" then
        return task.wait(9e9)
    end
    return OldNameCall(...)
end)
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end
local function HopServer()
	local Server, Next; repeat
	local Servers = ListServers(Next)
	Server = Servers.data[1]
	Next = Servers.nextPageCursor
	until Server
	TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end
repeat wait()
    if not game:IsLoaded() then
        wait()
    end
until game:IsLoaded()
task.wait(1)
-----------------------------------------------------------------

task.wait(2)

local library = {}

local UIConfig = {Bind = Enum.KeyCode.RightControl}
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local length = 20
local randomString = ""

math.randomseed(os.time())

charTable = {}
for c in chars:gmatch "." do
	table.insert(charTable, c)
end

for i = 1, length do
	randomString = randomString .. charTable[math.random(1, #charTable)]
end

for i, v in pairs(game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):GetChildren()) do
	if v.ClassName == "ScreenGui" then
		for i1, v1 in pairs(v:GetChildren()) do
			if v1.Name == "Main" then
				do
					local ui = v
					if ui then
						ui:Destroy()
					end
				end
			end
		end
	end
end
function CircleClick(Button, X, Y)
	coroutine.resume(
		coroutine.create(
			function()
				local Circle = Instance.new("ImageLabel")
				Circle.Parent = Button
				Circle.Name = "Circle"
				Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Circle.BackgroundTransparency = 1.000
				Circle.ZIndex = 10
				Circle.Image = "rbxassetid://266543268"
				Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
				Circle.ImageTransparency = 0.7
				local NewX = X - Circle.AbsolutePosition.X
				local NewY = Y - Circle.AbsolutePosition.Y
				Circle.Position = UDim2.new(0, NewX, 0, NewY)

				local Time = 0.2
				Circle:TweenSizeAndPosition(
					UDim2.new(0, 30.25, 0, 30.25),
					UDim2.new(0, NewX - 15, 0, NewY - 10),
					"Out",
					"Quad",
					Time,
					false,
					nil
				)
				for i = 1, 10 do
					Circle.ImageTransparency = Circle.ImageTransparency + 0.01
					wait(Time / 10)
				end
				Circle:Destroy()
			end
		)
	)
end
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function dragify(Frame, object)
	dragToggle = nil
	dragSpeed = .25
	dragInput = nil
	dragStart = nil
	dragPos = nil

	function updateInput(input)
		Delta = input.Position - dragStart
		Position =
			UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(
		function(input)
			if
				(input.UserInputType == Enum.UserInputType.MouseButton1 or
					input.UserInputType == Enum.UserInputType.Touch)
			then
				dragToggle = true
				dragStart = input.Position
				startPos = object.Position
				input.Changed:Connect(
					function()
						if (input.UserInputState == Enum.UserInputState.End) then
							dragToggle = false
						end
					end
				)
			end
		end
	)

	Frame.InputChanged:Connect(
		function(input)
			if
				(input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch)
			then
				dragInput = input
			end
		end
	)

	game:GetService("UserInputService").InputChanged:Connect(
	function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end
	)
end

local UI = Instance.new("ScreenGui")
UI.Name = randomString
UI.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
	syn.protect_gui(UI)
end

function library:Destroy()
	library:Destroy()
end

function library:CreateLibrary()
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
    local Top1 = Instance.new("Frame")
	local TabHolder = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
    local MainStroke = Instance.new("UIStroke")
	local TabContainer = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local Logo = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local Desc = Instance.new("TextLabel")

	Main.Name = "Main"
	Main.Parent = UI
	Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 650, 0, 500) -- (0, 650, 0, 500)
	Main.ClipsDescendants = true
	Main.AnchorPoint = Vector2.new(0.5, 0.5)


    MainStroke.Color = Color3.fromRGB(255, 255, 255)
	MainStroke.Thickness = 2
	MainStroke.Name = "MainStroke"
	MainStroke.Parent = Main

    --[[Top1.Name = "TopMain"
	Top1.Parent = Main
	Top1.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
	Top1.Position = UDim2.new(0, 0.5, 0, 0.5)
	Top1.Size = UDim2.new(0, 650, 0, 29)]]

	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.Active = true
	Logo.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 35, 0, 35)
	Logo.Size = UDim2.new(0, 50, 0, 50)
	Logo.Image = _G.imageLogo

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0882352963, 20, 0, 10)
	Title.Size = UDim2.new(0, 650, 0, 31) --483
	Title.Font = Enum.Font.GothamMedium
	Title.Text = _G.NameHub
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Desc.Name = "Desc"
	Desc.Parent = Main
	Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Desc.BackgroundTransparency = 1.000
	Desc.Position = UDim2.new(0.0882352963, 20, 0, 25)
	Desc.Size = UDim2.new(0, 650, 0, 31)	
	Desc.Font = Enum.Font.GothamMedium
	Desc.Text = _G.Title
	Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
	Desc.TextSize = 14.000
	Desc.TextWrapped = true
	Desc.TextTransparency = .5
	Desc.TextXAlignment = Enum.TextXAlignment.Left

	local UiToggle_UiStroke1 = Instance.new("UIStroke")

	UiToggle_UiStroke1.Color = Color3.fromRGB(0,0,0)
	UiToggle_UiStroke1.Thickness = 2
	UiToggle_UiStroke1.Name = "UiToggle_UiStroke1"
	UiToggle_UiStroke1.Parent = Main

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Main

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.Position = UDim2.new(0, 0, 0, 70)
	Top.Size = UDim2.new(0, 650, 0, 39)
	
	local ClickFrame = Instance.new("Frame")
	ClickFrame.Name = "Top"
	ClickFrame.Parent = Main
	ClickFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClickFrame.BackgroundTransparency = 1
	ClickFrame.Position = UDim2.new(0, 0, 0, 0)
	ClickFrame.Size = UDim2.new(0, 650, 0, 40)

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Top
	TabHolder.BackgroundColor3 = Color3.fromRGB(30,30,30)
	TabHolder.Position = UDim2.new(-0.010309278, 6, -0.0123075824, 0)
	TabHolder.Size = UDim2.new(0, 650, 0, 38)

	UICorner_2.Parent = TabHolder

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = TabHolder
	TabContainer.Active = true
	TabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TabContainer.BackgroundTransparency = 0.000
	TabContainer.Size = UDim2.new(0, 650, 0, 38)
	TabContainer.CanvasSize = UDim2.new(2, 0, 0, 0)
	TabContainer.ScrollBarThickness = 2
	TabContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always

	UIListLayout.Parent = TabContainer
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
	function()
		TabContainer.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, 0)
	end
	)


	UIPadding.Parent = TabContainer
	UIPadding.PaddingLeft = UDim.new(0, 3)
	UIPadding.PaddingTop = UDim.new(0, 3)

	local Bottom = Instance.new("Frame")
	Bottom.Name = "Bottom"
	Bottom.Parent = Main
	Bottom.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Bottom.BackgroundTransparency = 1.000
	Bottom.Position = UDim2.new(0, 5, 0, 120)
	Bottom.Size = UDim2.new(0, 650, 0, 525)

	local uitoggled = false
	UserInputService.InputBegan:Connect(
		function(io, p)
			if io.KeyCode == UIConfig.Bind then
				if uitoggled == false then
					Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
					uitoggled = true
					wait(.5)
					UI.Enabled = false
				else
					Main:TweenSize(
						UDim2.new(0, 650, 0, 500),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						1,
						true
					)
					UI.Enabled = true
					uitoggled = false
				end
			end
		end
	)

	dragify(ClickFrame, Main)
	local tabs = {}
	local S = false
	function tabs:Tab(Name)
		local FrameTab = Instance.new("Frame")
		local Tab = Instance.new("TextButton")
		local UICorner_3 = Instance.new("UICorner")
		local UICorner_Tab = Instance.new("UICorner")
		local ImageLabel = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")

		FrameTab.Name = "FrameTab"
		FrameTab.Parent = Tab
		FrameTab.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		FrameTab.Size = UDim2.new(0, 120, 0, 30)
        FrameTab.BackgroundTransparency = 1

		Tab.Name = "Tab"
		Tab.Parent = TabContainer
		Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Tab.Size = UDim2.new(0, 94, 0, 30)
		Tab.BackgroundTransparency = 0
		Tab.Text = ""
        Tab.TextTransparency = 0.7

		UICorner_3.CornerRadius = UDim.new(0, 3)
		UICorner_3.Parent = Tab

		TextLabel.Parent = Tab
		TextLabel.Text = Name

		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 94, 0, 27)
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.300
		TextLabel.TextXAlignment = Enum.TextXAlignment.Center
		TextLabel.TextTransparency = 0.600

		local Page = Instance.new("ScrollingFrame")
		local Left = Instance.new("ScrollingFrame")
		local Right = Instance.new("ScrollingFrame")
		local UIListLayout_5 = Instance.new("UIListLayout")
		local UIPadding_5 = Instance.new("UIPadding")

		Page.Name = "Page"
		Page.Parent = Bottom
		Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Page.BackgroundTransparency = 1.000
		Page.Size = UDim2.new(0, 650, 0, 365)
        Page.Position = UDim2.new(0, 0, 0, 10)
		Page.ScrollBarThickness = 0
		Page.CanvasSize = UDim2.new(0, 0, 0, 0)
		Page.Visible = false

		Left.Name = "Left"
		Left.Parent = Page
		Left.Active = true
		Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Left.BackgroundTransparency = 1
		Left.Size = UDim2.new(0, 310, 0, 365)  -- 325 325 (5,5,5,5)
		Left.ScrollBarThickness = 0
		Left.CanvasSize = UDim2.new(0, 0, 0, 0)

		Right.Name = "Right"
		Right.Parent = Page
		Right.Active = true
		Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Right.BackgroundTransparency = 1
		Right.Size = UDim2.new(0, 310, 0, 365)
		Right.ScrollBarThickness = 0
		Right.CanvasSize = UDim2.new(0, 0, 0, 0)

		local LeftList = Instance.new("UIListLayout")
		local RightList = Instance.new("UIListLayout")

		LeftList.Parent = Left
		LeftList.SortOrder = Enum.SortOrder.LayoutOrder
		LeftList.Padding = UDim.new(0, 5)

		RightList.Parent = Right
		RightList.SortOrder = Enum.SortOrder.LayoutOrder
		RightList.Padding = UDim.new(0, 5)

		UIListLayout_5.Parent = Page
		UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 20)

		UIPadding_5.Parent = Page

		if S == false then
			S = true
			Page.Visible = true
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextTransparency = 0.2
		end

		Tab.MouseButton1Click:Connect(
			function()
				for _, x in next, TabContainer:GetChildren() do
					if x.Name == "Tab" then
						TweenService:Create(
							x.TextLabel,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.7}
						):Play()
						for index, y in next, Bottom:GetChildren() do
							y.Visible = false
						end
					end
				end
				TweenService:Create(
					TextLabel,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextTransparency = 0.2}
				):Play()
				Page.Visible = true
			end
		)

		local function GetType(value)
			if value == "Left" then
				return Left
			elseif value == "Right" then
				return Right
			else
				return Left
			end
		end

		game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				Right.CanvasSize = UDim2.new(0,0,0,RightList.AbsoluteContentSize.Y + 5)
				Left.CanvasSize = UDim2.new(0,0,0,LeftList.AbsoluteContentSize.Y + 5)
			end)
		end)

		local sections = {}
		function sections:Section(side)

			if side == nil then
				return Left
			end

			local Section = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local Top_2 = Instance.new("Frame")
			local Line = Instance.new("Frame")
			local Sectionname = Instance.new("TextLabel")
			local SectionContainer = Instance.new("Frame") -- Frame
			local SectionContainer_2 = Instance.new("Frame")
			local UIListLayout_2 = Instance.new("UIListLayout")
			local UIPadding_2 = Instance.new("UIPadding")

			Section.Name = "Section"
			Section.Parent = GetType(side)
			Section.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			Section.ClipsDescendants = true
			Section.Size = UDim2.new(0, 320, 0, 10)  -- 343

			UICorner_5.CornerRadius = UDim.new(0, 5)
			UICorner_5.Parent = Section

			Top_2.Name = "Top"
			Top_2.Parent = Section
			Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Top_2.BackgroundTransparency = 1.000
			Top_2.BorderColor3 = Color3.fromRGB(24, 24, 24)
			Top_2.Size = UDim2.new(0, 320, 0, 31)

			Line.Name = "Line"
			Line.Parent = Top_2
			Line.BackgroundColor3 = _G.Color
			Line.BorderSizePixel = 0
			Line.Size = UDim2.new(0, 320, 0, 1)

			SectionContainer.Name = "SectionContainer"
			SectionContainer.Parent = Top_2
			SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionContainer.BackgroundTransparency = 1.000
			SectionContainer.BorderSizePixel = 0
			SectionContainer.Position = UDim2.new(0, 0, 0, 10)
			SectionContainer.Size = UDim2.new(0, 239, 0, 318)

			SectionContainer_2.Name = "SectionContainer_2"
			SectionContainer_2.Parent = Top_2
			SectionContainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SectionContainer_2.BackgroundTransparency = 1.000
			SectionContainer_2.BorderSizePixel = 0
			SectionContainer_2.Position = UDim2.new(0, 0, 0.796416223, -10)
			SectionContainer_2.Size = UDim2.new(0, 239, 0, 318)

			UIListLayout_2.Parent = SectionContainer
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0, 5)

			UIPadding_2.Parent = SectionContainer
			UIPadding_2.PaddingLeft = UDim.new(0, 5)

			UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
			function()

				Section.Size = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 20)
			end
			)

			local functionitem = {}

			function functionitem:Label(text)
				local textas = {}
				local Label = Instance.new("Frame")
				local Text = Instance.new("TextLabel")
				Label.Name = "Label"
				Label.Parent = SectionContainer
				Label.AnchorPoint = Vector2.new(0.5, 0.5)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 300, 0, 15)

				Text.Name = "Text"
				Text.Parent = Label
				Text.AnchorPoint = Vector2.new(0.5, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.Position = UDim2.new(0.5, 0, 0.5, 0)
				Text.Size = UDim2.new(1, 0, 1, 0)
				Text.ZIndex = 20
				Text.Font = Enum.Font.GothamBold
				Text.Text = " "..text
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextSize = 12.000
                Text.TextTransparency = 0.2
                Text.TextXAlignment = Enum.TextXAlignment.Left

				function textas:Change(newtext)
					Text.Text = " "..newtext
				end
				return textas
			end

			function functionitem:LabelColor(text,color)
				local textas = {}
				local Label = Instance.new("Frame")
				local Text = Instance.new("TextLabel")
				Label.Name = "Label"
				Label.Parent = SectionContainer
				Label.AnchorPoint = Vector2.new(0.5, 0.5)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0.975000024, 0, 0, 30)

				Text.Name = "Text"
				Text.Parent = Label
				Text.AnchorPoint = Vector2.new(0.5, 0.5)
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.Position = UDim2.new(0.5, 0, 0.5, 0)
				Text.Size = UDim2.new(0, 53, 0, 12)
				Text.ZIndex = 16
				Text.Font = Enum.Font.GothamBold
				Text.Text = text
				Text.TextColor3 = Color3.fromRGB(color)
				Text.TextSize = 12.000
				function textas:Change(newtext)
					Text.Text = newtext
				end
				return textas
			end

			function functionitem:ButtonTog(Title, default, callback)
				local b3Func = {}
				local callback = callback or function()
				end
				local Tgs = default
				local Button_2 = Instance.new("Frame")
				local UICorner_21 = Instance.new("UICorner")
				local TextLabel_4 = Instance.new("TextLabel")
				local TextButton_4 = Instance.new("TextButton")

				Button_2.Name = "Button"
				Button_2.Parent = SectionContainer
				Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
				Button_2.Size = UDim2.new(0, 300, 0, 25)
				Button_2.ZIndex = 16

				if default then
					Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
				else
					Button_2.BackgroundColor3 = _G.Color
				end

				UICorner_21.CornerRadius = UDim.new(0, 4)
				UICorner_21.Parent = Button_2

				TextLabel_4.Parent = Button_2
				TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.BackgroundTransparency = 1.000
				TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextLabel_4.Size = UDim2.new(0, 40, 0, 12)
				TextLabel_4.ZIndex = 16
				TextLabel_4.Font = Enum.Font.GothamBold
				TextLabel_4.Text = tostring(Title)
				TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_4.TextSize = 12.000

				TextButton_4.Parent = Button_2
				TextButton_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				TextButton_4.BackgroundTransparency = 1.000
				TextButton_4.BorderSizePixel = 0
				TextButton_4.ClipsDescendants = true
				TextButton_4.Size = UDim2.new(1, 0, 1, 0)
				TextButton_4.ZIndex = 16
				TextButton_4.AutoButtonColor = false
				TextButton_4.Font = Enum.Font.Gotham
				TextButton_4.Text = ""
				TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_4.TextSize = 14.000

				TextButton_4.MouseButton1Click:Connect(
					function()
						Tgs = not Tgs
						b3Func:Update(Tgs)
					end
				)

				if default then
					TweenService:Create(
						Button_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							BackgroundColor3 = state and _G.Color or Color3.fromRGB(33, 132, 112)
						}
					):Play()
					callback(default)
					Tgs = default
				end
				function b3Func:Update(state)
					TweenService:Create(
						Button_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							BackgroundColor3 = state and Color3.fromRGB(33, 132, 112) or _G.Color
						}
					):Play()
					callback(state)
					Tgs = state
				end

				return b3Func
			end

			function functionitem:Button(Name, callback)
				local Button = Instance.new("Frame")
				local UICorner_6 = Instance.new("UICorner")
				local TextLabel_3 = Instance.new("TextLabel")
				local TextButton = Instance.new("TextButton")

				Button.Name = "Button"
				Button.Parent = SectionContainer
				Button.BackgroundColor3 = _G.Color
				Button.Size = UDim2.new(0, 300, 0, 20)
				Button.ZIndex = 16
				Button.BackgroundTransparency = 0.7

				UICorner_6.CornerRadius = UDim.new(0, 4)
				UICorner_6.Parent = Button

				TextLabel_3.Parent = Button
				TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.BackgroundTransparency = 1
				TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextLabel_3.Size = UDim2.new(0, 40, 0, 12)
				TextLabel_3.ZIndex = 16
				TextLabel_3.Font = Enum.Font.GothamBold
				TextLabel_3.Text = Name
				TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_3.TextSize = 12.000
				TextLabel_3.TextTransparency = 0.7

				TextButton.Parent = Button
				TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderSizePixel = 0
				TextButton.ClipsDescendants = true
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.ZIndex = 16
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.Gotham
				TextButton.Text = ""
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 14.000

				TextButton.MouseButton1Click:Connect(function()
					callback()
				end)

				TextButton.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.2}
                    ):Play()
					TweenService:Create(
                        TextLabel_3,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
				end)
            
                TextButton.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.7}
                    ):Play()
					TweenService:Create(
                        TextLabel_3,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                end)
			end

			function functionitem:Toggle(Name, default, callback)
				local ToglFunc = {}
				local Tgo = default
				local MainToggle = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Text = Instance.new("TextLabel")
				local MainToggle_2 = Instance.new("ImageLabel")
				local UICorner_2 = Instance.new("UICorner")
				local MainToggle_3 = Instance.new("ImageLabel")
				local UICorner_3 = Instance.new("UICorner")
                local Cir = Instance.new("ImageLabel")
				local CorCir = Instance.new("UICorner")
				local TextButton = Instance.new("TextButton")

				MainToggle.Name = "MainToggle"
				MainToggle.Parent = SectionContainer
				MainToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				MainToggle.BackgroundTransparency = 1
				MainToggle.BorderSizePixel = 0
				MainToggle.ClipsDescendants = true
				MainToggle.Size = UDim2.new(0, 320, 0, 15)
				MainToggle.ZIndex = 16

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = MainToggle

				Text.Name = "Text"
				Text.Parent = MainToggle
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.Position = UDim2.new(0, 5, 0, 4.5)
				Text.Size = UDim2.new(0, 300, 0, 12)
				Text.ZIndex = 16
				Text.Font = Enum.Font.GothamBold
				Text.Text = Name
				Text.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text.TextSize = 12.000
				Text.TextTransparency = 0.7
				Text.TextXAlignment = Enum.TextXAlignment.Left
                Text.TextYAlignment = Enum.TextYAlignment.Center

                Cir.Name = "MainToggle"
				Cir.Parent = MainToggle
				Cir.AnchorPoint = Vector2.new(0.5, 0.5)
                Cir.BackgroundTransparency = 0
				Cir.BackgroundColor3 = Color3.fromRGB(15,15,15)
				Cir.ClipsDescendants = true
				Cir.Position = UDim2.new(0.899999976, 0, 0.5, 0)
				Cir.Size = UDim2.new(0, 15, 0, 15)
				Cir.ZIndex = 16

                CorCir.CornerRadius = UDim.new(0, 399)
				CorCir.Parent = Cir

				MainToggle_2.Name = "MainToggle"
				MainToggle_2.Parent = MainToggle
				MainToggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
                MainToggle_2.BackgroundTransparency = 1
				MainToggle_2.BackgroundColor3 = _G.Color
				MainToggle_2.ClipsDescendants = true
				MainToggle_2.Position = UDim2.new(0.899999976, 0, 0.5, 0)
				MainToggle_2.Size = UDim2.new(0, 15, 0, 15)
				MainToggle_2.ZIndex = 16

				UICorner_2.CornerRadius = UDim.new(0, 399)
				UICorner_2.Parent = MainToggle_2

				MainToggle_3.Name = "MainToggle"
				MainToggle_3.Parent = MainToggle_2
				MainToggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
				MainToggle_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                MainToggle_3.BackgroundTransparency = 1
				MainToggle_3.ClipsDescendants = true
				MainToggle_3.Position = UDim2.new(0.5, 0, 0.5, 0)
				MainToggle_3.Size = UDim2.new(0, 0, 0, 0)
				MainToggle_3.ZIndex = 16
				MainToggle_3.Image = "http://www.roblox.com/asset/?id=6023426926"
				MainToggle_3.ImageColor3 = Color3.fromRGB(255,255,255)
				MainToggle_3.Visible =false
                
				UICorner_3.CornerRadius = UDim.new(0, 3)
				UICorner_3.Parent = MainToggle_3

				TextButton.Name = ""
				TextButton.Parent = MainToggle
				TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				TextButton.BackgroundTransparency = 1.000
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(1, 0, 1, 0)
				TextButton.ZIndex = 16
				TextButton.AutoButtonColor = false
				TextButton.Font = Enum.Font.Gotham
				TextButton.Text = ""
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 14.000
			
				TextButton.MouseButton1Click:Connect(function()
					Tgo = not Tgo
					ToglFunc:Update(Tgo)
				end)

				if default then
					if default then
						MainToggle_3.Visible = default
					end
					TweenService:Create(
						Text,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							TextTransparency = default and 0 or 0.7
						}
					):Play()
                    TweenService:Create(
						MainToggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							BackgroundTransparency = default and 0 or 1
						}
					):Play()
					local we = TweenService:Create(
						MainToggle_3,
						TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{
							Size = default and UDim2.new(0, 13, 0, 13) or UDim2.new(0, 0, 0, 0) 
						}
					)
					we:Play()
					we.Completed:Wait()
					if default == false then
						MainToggle_3.Visible = default
					end
					callback(default)
					Tgo = default
					if (default) == false then
						TextButton.MouseLeave:Connect(function()
							TweenService:Create(
								Text,
								TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.7} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end)
					end
				end
				
				function ToglFunc:Update(state)
					if state then
						MainToggle_3.Visible = state
					end
					TweenService:Create(
						Text,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							TextTransparency = state and 0 or 0.7
						}
					):Play()
                    TweenService:Create(
						MainToggle_2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{
							BackgroundTransparency = state and 0 or 1
						}
					):Play()
					local we = TweenService:Create(
						MainToggle_3,
						TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
						{
							Size = state and UDim2.new(0, 13, 0, 13) or UDim2.new(0, 0, 0, 0) 
						}
					)
					we:Play()
					we.Completed:Wait()
					if state == false then
						MainToggle_3.Visible = state
					end
					callback(state)
					Tgo = state
					if (state) == false then
						TextButton.MouseLeave:Connect(function()
							TweenService:Create(
								Text,
								TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0.7} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end)
					end
				end
				
				if (state or default) == false then
					TextButton.MouseLeave:Connect(function()
						TweenService:Create(
							Text,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextTransparency = 0.7} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
				end
				TextButton.MouseEnter:Connect(function()
                    TweenService:Create(
                        Text,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
				end)
                
				return ToglFunc
			end

			function functionitem:Textbox(Name, Placeholder, defalut, callback)
			    if type(defalut) == 'string' then
			        Placeholder = tostring(defalut)
			        callback(tostring(defalut))
			    end
				local Textbox = Instance.new("Frame")
				local UICorner_16 = Instance.new("UICorner")
				local Text_5 = Instance.new("TextLabel")
				local TextboxHoler = Instance.new("Frame")
				local UICorner_17 = Instance.new("UICorner")
				local HeadTitle = Instance.new("TextBox")
				
				Textbox.Name = "Textbox"
				Textbox.Parent = SectionContainer
				Textbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				Textbox.BackgroundTransparency = 0.5
				Textbox.BorderSizePixel = 0
				Textbox.ClipsDescendants = true
				Textbox.Size = UDim2.new(0, 300, 0, 60)
				Textbox.ZIndex = 16

				UICorner_16.CornerRadius = UDim.new(0, 4)
				UICorner_16.Parent = Textbox

				Text_5.Name = "Text"
				Text_5.Parent = Textbox
				Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text_5.BackgroundTransparency = 1.000
				Text_5.Position = UDim2.new(0, 10, 0, 10)
				Text_5.Size = UDim2.new(0, 1, 0, 12)
				Text_5.ZIndex = 16
				Text_5.Font = Enum.Font.GothamBold
				Text_5.Text = Name
				Text_5.TextColor3 = _G.Color
                Text_5.TextTransparency = 0.7
				Text_5.TextSize = 11.000
				Text_5.TextXAlignment = Enum.TextXAlignment.Left

				TextboxHoler.Name = "TextboxHoler"
				TextboxHoler.Parent = Textbox
				TextboxHoler.AnchorPoint = Vector2.new(0.5, 0.5)
				TextboxHoler.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
				TextboxHoler.BackgroundTransparency = 1.000
				TextboxHoler.BorderSizePixel = 0
				TextboxHoler.Position = UDim2.new(0.5, 0, 0.5, 13)
				TextboxHoler.Size = UDim2.new(0.970000029, 0, 0, 30)

				UICorner_17.CornerRadius = UDim.new(0, 6)
				UICorner_17.Parent = TextboxHoler

				HeadTitle.Name = "HeadTitle"
				HeadTitle.Parent = TextboxHoler
				HeadTitle.AnchorPoint = Vector2.new(0.5, 0.5)
				HeadTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				HeadTitle.BackgroundTransparency = 1.000
				HeadTitle.BorderSizePixel = 0
				HeadTitle.ClipsDescendants = true
				HeadTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
				HeadTitle.Size = UDim2.new(0.949999988, 0, 0, 40)
				HeadTitle.ZIndex = 16
				HeadTitle.Font = Enum.Font.GothamBold
				HeadTitle.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
				HeadTitle.PlaceholderText = Placeholder
				HeadTitle.Text = ""
				HeadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				HeadTitle.TextSize = 13.000
				HeadTitle.TextTransparency = 0.700
				HeadTitle.TextXAlignment = Enum.TextXAlignment.Left
				HeadTitle.FocusLost:Connect(function(ep)
					if ep then
						if #HeadTitle.Text > 0 then
							callback(HeadTitle.Text)
						end
					end
				end)
				
				TextboxHoler.MouseEnter:Connect(function()
                    TweenService:Create(
                        Text_5,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                    TweenService:Create(
                        HeadTitle,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                end)
    
                TextboxHoler.MouseLeave:Connect(function()
                    TweenService:Create(
                        Text_5,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                    TweenService:Create(
                        HeadTitle,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                end)
			
				TextboxHoler.MouseEnter:Connect(function()
                    TweenService:Create(
                        Text_5,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                    TweenService:Create(
                        HeadTitle,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                end)
    
                TextboxHoler.MouseLeave:Connect(function()
                    TweenService:Create(
                        Text_5,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                    TweenService:Create(
                        HeadTitle,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                end)
			end

			function functionitem:Dropdown(Name, list, default, callback)
				local Dropfunc = {}
				local Dropfunc = {}
                local DropMain = Instance.new("Frame")
				local MainDropDown = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local MainDropDown_2 = Instance.new("Frame")
				local UICorner_8 = Instance.new("UICorner")
                local ItemCor = Instance.new("UICorner")
				local v = Instance.new("TextButton")
				local Text_2 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local Scroll_Items = Instance.new("ScrollingFrame")
				local UIListLayout_3 = Instance.new("UIListLayout")
				local UIPadding_3 = Instance.new("UIPadding")

                DropMain.Name = "dropmaain"
				DropMain.Parent = SectionContainer
				DropMain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				DropMain.BackgroundTransparency = 1
				DropMain.BorderSizePixel = 0
				DropMain.ClipsDescendants = true
				DropMain.Size = UDim2.new(0, 300, 0, 30)
				DropMain.ZIndex = 16

				MainDropDown.Name = "MainDropDown"
				MainDropDown.Parent = DropMain
				MainDropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				MainDropDown.BackgroundTransparency = 1
				MainDropDown.BorderSizePixel = 0
				MainDropDown.ClipsDescendants = true
				MainDropDown.Size = UDim2.new(0, 300, 0, 30)
				MainDropDown.ZIndex = 16

				UICorner_7.CornerRadius = UDim.new(0, 4)
				UICorner_7.Parent = MainDropDown
                

				MainDropDown_2.Name = "MainDropDown"
				MainDropDown_2.Parent = MainDropDown
				MainDropDown_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				MainDropDown_2.BackgroundTransparency = 0
				MainDropDown_2.BorderSizePixel = 0
				MainDropDown_2.ClipsDescendants = true
				MainDropDown_2.Size = UDim2.new(0, 300, 0, 30)
				MainDropDown_2.ZIndex = 16

				UICorner_8.CornerRadius = UDim.new(0, 4)
				UICorner_8.Parent = MainDropDown_2

				v.Name = "v"
				v.Parent = MainDropDown_2
				v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = 1.000
				v.BorderSizePixel = 0
				v.Size = UDim2.new(1, 0, 1, 0)
				v.ZIndex = 16
				v.AutoButtonColor = false
				v.Font = Enum.Font.GothamBold
				v.Text = ""
				v.TextColor3 = Color3.fromRGB(255, 255, 255)
				v.TextSize = 12.000

				local function GetValues()
					if default then
						callback(default)
						return Name .. " : " .. v
					else
						return Name .. " : nil"
					end
				end

				Text_2.Name = "Text"
				Text_2.Parent = MainDropDown_2
				Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text_2.BackgroundTransparency = 1.000
				Text_2.Position = UDim2.new(0, 3, 0, 10)
				Text_2.Size = UDim2.new(0, 300, 0, 12)
				Text_2.ZIndex = 16
				Text_2.Font = Enum.Font.GothamBold
				Text_2.Text = tostring(GetValues())
				Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text_2.TextSize = 12.000
                Text_2.TextTransparency = 0.7
				Text_2.TextXAlignment = Enum.TextXAlignment.Left

				ImageButton.Parent = MainDropDown_2
				ImageButton.AnchorPoint = Vector2.new(0, 0.5)
				ImageButton.BackgroundTransparency = 1
				ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
				ImageButton.Size = UDim2.new(0, 20, 0, 20)
				ImageButton.ZIndex = 16
				ImageButton.Image = "http://www.roblox.com/asset/?id=6031094687"
                ImageButton.ImageColor3 = Color3.fromRGB(150,150,150)

				local DropTable = {}

				Scroll_Items.Name = "Scroll_Items"
				Scroll_Items.Parent = DropMain
				Scroll_Items.Active = true
				Scroll_Items.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				Scroll_Items.BackgroundTransparency = 0
				Scroll_Items.BorderSizePixel = 0
				Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
				Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
				Scroll_Items.ZIndex = 16
				Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
				Scroll_Items.ScrollBarThickness = 2

				UIListLayout_3.Parent = Scroll_Items
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_3.Padding = UDim.new(0, 5)
				UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
				end)

				UIPadding_3.Parent = Scroll_Items
				UIPadding_3.PaddingLeft = UDim.new(0, 10)
				UIPadding_3.PaddingTop = UDim.new(0, 5)

                ItemCor.CornerRadius = UDim.new(0, 4)
				ItemCor.Parent = Scroll_Items
				
				v.MouseEnter:Connect(function()
                    TweenService:Create(
                        Text_2,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                end)
    
                v.MouseLeave:Connect(function()
                    TweenService:Create(
                        Text_2,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                end)
                
				function Dropfunc:TogglePanel(state)
                    TweenService:Create(
						DropMain,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = state and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 300, 0, 30)}
					):Play()
					TweenService:Create(
						MainDropDown,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = state and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 300, 0, 30)}
					):Play()
					TweenService:Create(
						ImageButton,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = state and 180 or 0}
					):Play()
				end

				local Tof = false

				ImageButton.MouseButton1Click:Connect(
					function()
						Tof = not Tof
						Dropfunc:TogglePanel(Tof)
					end
				)

				v.MouseButton1Click:Connect(
					function()
						Tof = not Tof
						Dropfunc:TogglePanel(Tof)
					end
				)

				function Dropfunc:Add(v)
					local _5 = Instance.new("TextButton")
					local UICorner_9 = Instance.new("UICorner")
					_5.Name = v
					_5.Parent = Scroll_Items
					_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    _5.BackgroundTransparency = 0
					_5.BorderSizePixel = 0
					_5.ClipsDescendants = true
					_5.Size = UDim2.new(1, -10, 0, 20)
					_5.ZIndex = 17
					_5.AutoButtonColor = false
					_5.Font = Enum.Font.GothamBold
					_5.Text = v
					_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					_5.TextSize = 12.000
                    _5.TextTransparency = 0.5

					UICorner_9.CornerRadius = UDim.new(0, 4)
					UICorner_9.Parent = _5
                    
					_5.MouseButton1Click:Connect(function()
						if _x == nil then
							Tof = false
							Dropfunc:TogglePanel(Tof)
							callback(v)
							Text_2.Text = Name .. " : " .. v
							_x = nil
						end
					end)
				end

				function Dropfunc:Remove()
					for i, v in next, Scroll_Items:GetChildren() do
						if v:IsA("TextButton") then 
							v:Destroy()
						end
					end
				end

				for i, v in next, list do
					Dropfunc:Add(v)
				end
				return Dropfunc
			end

			function functionitem:MultiDropdown(Name, list, default, callback)
				local Dropfunc = {}
                local DropMain = Instance.new("Frame")
				local MainDropDown = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local MainDropDown_2 = Instance.new("Frame")
				local UICorner_8 = Instance.new("UICorner")
                local ItemCor = Instance.new("UICorner")
				local v = Instance.new("TextButton")
				local Text_2 = Instance.new("TextLabel")
				local ImageButton = Instance.new("ImageButton")
				local Scroll_Items = Instance.new("ScrollingFrame")
				local UIListLayout_3 = Instance.new("UIListLayout")
				local UIPadding_3 = Instance.new("UIPadding")

                DropMain.Name = "dropmaain"
				DropMain.Parent = SectionContainer
				DropMain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				DropMain.BackgroundTransparency = 1
				DropMain.BorderSizePixel = 0
				DropMain.ClipsDescendants = true
				DropMain.Size = UDim2.new(0, 300, 0, 30)
				DropMain.ZIndex = 16

				MainDropDown.Name = "MainDropDown"
				MainDropDown.Parent = DropMain
				MainDropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				MainDropDown.BackgroundTransparency = 1
				MainDropDown.BorderSizePixel = 0
				MainDropDown.ClipsDescendants = true
				MainDropDown.Size = UDim2.new(0, 300, 0, 30)
				MainDropDown.ZIndex = 16

				UICorner_7.CornerRadius = UDim.new(0, 4)
				UICorner_7.Parent = MainDropDown
                

				MainDropDown_2.Name = "MainDropDown"
				MainDropDown_2.Parent = MainDropDown
				MainDropDown_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				MainDropDown_2.BackgroundTransparency = 0
				MainDropDown_2.BorderSizePixel = 0
				MainDropDown_2.ClipsDescendants = true
				MainDropDown_2.Size = UDim2.new(0, 300, 0, 30)
				MainDropDown_2.ZIndex = 16

				UICorner_8.CornerRadius = UDim.new(0, 4)
				UICorner_8.Parent = MainDropDown_2

				v.Name = "v"
				v.Parent = MainDropDown_2
				v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				v.BackgroundTransparency = 1.000
				v.BorderSizePixel = 0
				v.Size = UDim2.new(1, 0, 1, 0)
				v.ZIndex = 16
				v.AutoButtonColor = false
				v.Font = Enum.Font.GothamBold
				v.TextTransparency = 0.7
				v.Text = ""
				v.TextColor3 = Color3.fromRGB(255, 255, 255)
				v.TextSize = 12.000

				local function GetValues()
					if default then
						for i, v in next, default do
							if table.find(list, v) then
								callback(default)
								return Name .. " : " .. table.concat(default, ", ")
							else
								return Name
							end
						end
					else
						return Name
					end
				end

				Text_2.Name = "Text"
				Text_2.Parent = MainDropDown_2
				Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text_2.BackgroundTransparency = 1.000
				Text_2.Position = UDim2.new(0, 3, 0, 10)
				Text_2.Size = UDim2.new(0, 300, 0, 12)
				Text_2.ZIndex = 16
				Text_2.Font = Enum.Font.GothamBold
				Text_2.Text = GetValues()
				Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Text_2.TextSize = 12.000
                Text_2.TextTransparency = 0.7				Text_2.TextXAlignment = Enum.TextXAlignment.Left

				v.MouseEnter:Connect(function()
                    TweenService:Create(
                        Text_2,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2}
                    ):Play()
                end)
    
                v.MouseLeave:Connect(function()
                    TweenService:Create(
                        Text_2,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7}
                    ):Play()
                end)
                
				ImageButton.Parent = MainDropDown_2
				ImageButton.AnchorPoint = Vector2.new(0, 0.5)
				ImageButton.BackgroundTransparency = 1
				ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
				ImageButton.Size = UDim2.new(0, 20, 0, 20)
				ImageButton.ZIndex = 16
				ImageButton.Image = "http://www.roblox.com/asset/?id=6031094687"
                ImageButton.ImageColor3 = Color3.fromRGB(150,150,150)

				local DropTable = {}

				Scroll_Items.Name = "Scroll_Items"
				Scroll_Items.Parent = DropMain
				Scroll_Items.Active = true
				Scroll_Items.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				Scroll_Items.BackgroundTransparency = 0
				Scroll_Items.BorderSizePixel = 0
				Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
				Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
				Scroll_Items.ZIndex = 16
				Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
				Scroll_Items.ScrollBarThickness = 2

				UIListLayout_3.Parent = Scroll_Items
				UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_3.Padding = UDim.new(0, 5)
				UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
				function()
					Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
				end
				)
				UIPadding_3.Parent = Scroll_Items
				UIPadding_3.PaddingLeft = UDim.new(0, 10)
				UIPadding_3.PaddingTop = UDim.new(0, 5)

                ItemCor.CornerRadius = UDim.new(0, 4)
				ItemCor.Parent = Scroll_Items

				function Dropfunc:TogglePanel(state)
                    TweenService:Create(
						DropMain,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = state and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 300, 0, 30)}
					):Play()
					TweenService:Create(
						MainDropDown,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = state and UDim2.new(0, 300, 0, 200) or UDim2.new(0, 300, 0, 30)}
					):Play()
					TweenService:Create(
						ImageButton,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = state and 180 or 0}
					):Play()
				end
				local Tof = false
				ImageButton.MouseButton1Click:Connect(
					function()
						Tof = not Tof
						Dropfunc:TogglePanel(Tof)
					end
				)
				v.MouseButton1Click:Connect(
					function()
						Tof = not Tof
						Dropfunc:TogglePanel(Tof)
					end
				)
				function Dropfunc:Add(Text)
					local _5 = Instance.new("TextButton")
					local UICorner_9 = Instance.new("UICorner")
					_5.Name = Text
					_5.Parent = Scroll_Items
					_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                    _5.BackgroundTransparency = 0
					_5.BorderSizePixel = 0
					_5.ClipsDescendants = true
					_5.Size = UDim2.new(1, -10, 0, 20)
					_5.ZIndex = 17
					_5.AutoButtonColor = false
					_5.Font = Enum.Font.GothamBold
					_5.Text = Text
					_5.TextColor3 = Color3.fromRGB(255, 255, 255)
					_5.TextSize = 12.000
                    _5.TextTransparency = 0.5

					UICorner_9.CornerRadius = UDim.new(0, 4)
					UICorner_9.Parent = _5
					_5.MouseButton1Click:Connect(
						function()
							if not table.find(DropTable, Text) then
								table.insert(DropTable, Text)
								callback(DropTable, Text)
								Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
								TweenService:Create(
									_5,
									TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{TextTransparency = 0}
								):Play()
							else
								TweenService:Create(
									_5,
									TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
									{TextTransparency = 0.5}
								):Play()
								for i2, v2 in pairs(DropTable) do
									if v2 == Text then
										table.remove(DropTable, i2)
										Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
									end
								end
								callback(DropTable, Text)
							end
						end
					)
				end
				function Dropfunc:Clear()
					for i, v in next, Scroll_Items:GetChildren() do
						if v:IsA("TextButton")  then 
							v:Destroy()
						end
					end 
				end

				for i, v in next, list do
					Dropfunc:Add(v)
				end
				return Dropfunc
			end

            function functionitem:Line()
                local LineFrame = Instance.new("Frame")
                local Line = Instance.new("Frame")
                local v12 = Instance.new("UICorner")

                LineFrame.Name = "LineFrame"
                LineFrame.Parent = SectionContainer
                LineFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)
                LineFrame.BorderSizePixel = 0
                LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                LineFrame.Size = UDim2.new(0, 300, 0, 10)
                LineFrame.BackgroundTransparency  = 1
                LineFrame.ClipsDescendants = true

                Line.Name = "Line"
                Line.Parent = LineFrame
                Line.BackgroundColor3 =  _G.Color
                Line.BorderSizePixel = 0
                Line.Position = UDim2.new(0.5, 0, 0.5, 0)
                Line.AnchorPoint = Vector2.new(0.5, 0.5)
                Line.Size = UDim2.new(0, 300, 0, 2)
                Line.BackgroundTransparency  = 0.7
                Line.ClipsDescendants = true
    
                v12.CornerRadius = UDim.new(0, 8)
                v12.Name = ""
                v12.Parent = Line

                Line.MouseEnter:Connect(function()
                    TweenService:Create(
                        Line,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.2}
                    ):Play()
                end)
    
                Line.MouseLeave:Connect(function()
                    TweenService:Create(
                        Line,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7}
                    ):Play()
                end)
            end

            function functionitem:Slider(Name, min, max, de, floor, inc, callback)
                local SliderFrame = Instance.new("Frame")

                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = SectionContainer
                SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- _G.Color
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderFrame.Size = UDim2.new(0, 300, 0, 40) -- UDim2.new(0, 213, 0, 35)
                SliderFrame.BackgroundTransparency  = 0
                SliderFrame.ClipsDescendants = true
    
                local SliderFrameStroke = Instance.new("UIStroke")
    
                SliderFrameStroke.Thickness = 1
                SliderFrameStroke.Name = ""
                SliderFrameStroke.Parent = SliderFrame
                SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
                SliderFrameStroke.Color = _G.Color
                SliderFrameStroke.Transparency = 0.7
    
                local LabelNameSliderxd = Instance.new("TextLabel")
    
                LabelNameSliderxd.Parent = SliderFrame
                LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.BackgroundTransparency = 1
                LabelNameSliderxd.BorderSizePixel = 0
                LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
                LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelNameSliderxd.Size = UDim2.new(0, 200, 0, 20)
                LabelNameSliderxd.Font = Enum.Font.GothamBold
                LabelNameSliderxd.Text = tostring(Name)
                LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelNameSliderxd.TextSize = 11.000
                LabelNameSliderxd.TextTransparency = 0.7
                LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left
    
    
                local ShowValueFarm = Instance.new("Frame")
    
                ShowValueFarm.Name = "ShowValueFarm"
                ShowValueFarm.Parent = SliderFrame
                ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ShowValueFarm.Position = UDim2.new(0, 0, 0, 5)
                ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
                ShowValueFarm.BackgroundTransparency = 0
                ShowValueFarm.BorderSizePixel = 0
                ShowValueFarm.AnchorPoint = Vector2.new(0.25, 0.3)
                ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
                ShowValueFarm.ClipsDescendants = false
    
                local CustomValue = Instance.new("TextBox")
    
                CustomValue.Parent = ShowValueFarm
                CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
                CustomValue.BorderSizePixel = 0
                CustomValue.ClipsDescendants = true
                CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
                CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                CustomValue.Size = UDim2.new(0, 158, 0, 15)
                CustomValue.Font = Enum.Font.GothamBold
                CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
                CustomValue.PlaceholderText =  ""
                if floor == true then
                    CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
                else
                    CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
                end
                CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
                CustomValue.TextSize = 8.000
                CustomValue.BackgroundTransparency = 1
    
                local ValueFrame = Instance.new("Frame")
    
                ValueFrame.Name = "ValueFrame"
                ValueFrame.Parent = SliderFrame
                ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ValueFrame.Position = UDim2.new(0, 0, 0.235135213, 0)
                ValueFrame.Size = UDim2.new(0, 200, 0, 3)
                ValueFrame.BackgroundTransparency = 0
                ValueFrame.BorderSizePixel = 0
                ValueFrame.AnchorPoint = Vector2.new(0.725, 0.5)
                ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
                ValueFrame.ClipsDescendants = false
    
    
                local PartValue = Instance.new("Frame")
    
                PartValue.Name = "PartValue"
                PartValue.Parent = ValueFrame
                PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
                PartValue.Position = UDim2.new(0, 0, 0.235135213, 0)
                PartValue.Size = UDim2.new(0, 200, 0, 3)
                PartValue.BackgroundTransparency = 1
                PartValue.BorderSizePixel = 0
                PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
                PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
                PartValue.ClipsDescendants = false
    
                local MainValue = Instance.new("Frame")
    
                MainValue.Name = "MainValue"
                MainValue.Parent = PartValue
                MainValue.BackgroundColor3 = _G.Color
                MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 3)
                MainValue.BackgroundTransparency = 0.7
                MainValue.BorderSizePixel = 0
                MainValue.AnchorPoint = Vector2.new(0, 0.5)
                MainValue.Position = UDim2.new(0, 0, 0, 0)
                MainValue.ClipsDescendants = false
    
                local Conner_S1 = Instance.new("UICorner")
    
                Conner_S1.CornerRadius = UDim.new(0, 8)
                Conner_S1.Name = ""
                Conner_S1.Parent = MainValue
    
                local Conner_S2 = Instance.new("UICorner")
    
                Conner_S2.CornerRadius = UDim.new(0, 8)
                Conner_S2.Name = ""
                Conner_S2.Parent = ValueFrame

                local ConneValue = Instance.new("Frame")
        
                ConneValue.Name = "ConneValue"
                ConneValue.Parent = PartValue
                ConneValue.BackgroundColor3 = _G.Color
                ConneValue.Size = UDim2.new(0, 10, 0, 10)
                ConneValue.BackgroundTransparency = 0.7
                ConneValue.BorderSizePixel = 0
                ConneValue.AnchorPoint = Vector2.new(0, 0.5)
                ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0, 0, 0)
                ConneValue.ClipsDescendants = false
                
                SliderFrame.MouseEnter:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        ConneValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        MainValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()    
                    TweenService:Create(
                        LabelNameSliderxd,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        CustomValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.2} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)
    
                SliderFrame.MouseLeave:Connect(function()
                    TweenService:Create(
                        SliderFrameStroke,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        ConneValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        MainValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()    
                    TweenService:Create(
                        LabelNameSliderxd,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        CustomValue,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)
                local Ca = Instance.new("UICorner")
    
                Ca.CornerRadius = UDim.new(0, 999)
                Ca.Name = ""
                Ca.Parent = ConneValue
    
                local Addvalue = Instance.new("ImageButton")
    
                Addvalue.Name = "Imatog"
                Addvalue.Parent = SliderFrame
                Addvalue.BackgroundTransparency = 1.000
                Addvalue.BorderSizePixel = 0
                Addvalue.Position = UDim2.new(0.92, 0, 0.5, 0)
                Addvalue.Size = UDim2.new(0, 15, 0, 15)
                Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
                Addvalue.ImageColor3 =  _G.Color
    
                local Deletevalue = Instance.new("ImageButton")
    
                Deletevalue.Name = "Imatog"
                Deletevalue.Parent = SliderFrame
                Deletevalue.BackgroundTransparency = 1.000
                Deletevalue.BorderSizePixel = 0
                Deletevalue.Position = UDim2.new(0.75, 0, 0.5, 0)
                Deletevalue.Size = UDim2.new(0, 15, 0, 15)
                Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
                Deletevalue.ImageColor3 =  _G.Color
    
                local function move(input)
                    local pos =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0,
                            0
                        )
                    local pos1 =
                        UDim2.new(
                            math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                            0,
                            0,
                            3
                        )
    
                        MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
    
                        ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                        if floor == true then
                            local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                            callback(value)
                        else
                            local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                            CustomValue.Text = tostring(value)
                            callback(value)
                        end
                    end
    
                    local dragging = false
                    ConneValue.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true
    
                            end
                        end
                    )
                    ConneValue.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false
    
                            end
                        end
                    )
                    SliderFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true
    
                            end
                        end
                    )
                    SliderFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false
    
                            end
                        end
                    )
    
    
                    ValueFrame.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = true
    
                            end
                        end
                    )
                    ValueFrame.InputEnded:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                dragging = false
    
                            end
                        end
                    )
    
                    game:GetService("UserInputService").InputChanged:Connect(
                        function(input)
                            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                                move(input)
                            end
                        end
                        )
    
                        CustomValue.FocusLost:Connect(function()
                            if CustomValue.Text == "" then
                                CustomValue.Text  = de
                            end
                            if  tonumber(CustomValue.Text) > max then
                                CustomValue.Text  = max
                            end
                            MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 3), "Out", "Sine", 0.2, true)
                            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0, 0, 0) , "Out", "Sine", 0.2, true)
                            if floor == true then
                                CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                            else
                                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                            end
                            pcall(callback, CustomValue.Text)
                        end)
    
    
                Addvalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    CustomValue.Text  = CustomValue.Text  - tonumber(inc)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 3), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0, 0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)
    
                Deletevalue.MouseButton1Click:Connect(function ()
                    if CustomValue.Text == "" then
                        CustomValue.Text  = de
                    end
                    CustomValue.Text  = CustomValue.Text  + tonumber(inc)
                    if  tonumber(CustomValue.Text) > max then
                        CustomValue.Text  = max
                    end
                    if  tonumber(CustomValue.Text) < min then
                        CustomValue.Text  = min
                    end
                    MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 3), "Out", "Sine", 0.2, true)
                    ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0, 0, 0) , "Out", "Sine", 0.2, true)
                    if floor == true then
                        CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                    else
                        CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                    end
                    pcall(callback, CustomValue.Text)
                end)
            end
			return functionitem
		end
		return sections
	end
	return tabs
end
return library
