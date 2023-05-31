repeat wait() until game:IsLoaded()

local ui = game.Players.LocalPlayer.PlayerGui :FindFirstChild("UniqueMobile") ;

if ui then 
	ui:Destroy() ;
end

local InputService = game:GetService("UserInputService");
local TextService = game:GetService('TextService');
local TweenService = game:GetService('TweenService');
local CoreGui = game:GetService('CoreGui');
local RenderStepped = game:GetService('RunService').RenderStepped;
local LocalPlayer = game:GetService('Players').LocalPlayer;
local Mouse = LocalPlayer:GetMouse();

local userId = game:GetService("Players")[LocalPlayer.Name].UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(userId, thumbType, thumbSize)
local player = game.Players.LocalPlayer.Name


local Library = {
	Funcs = {} ;	
	Items = {} ;
	TabFunc = {} ;
	OpenedDropdown = false ;
	OpenUI = true ;
} ;

function Library:Tween(object,timeout,method,property)
	if type(object) ~= "table" then 
		return TweenService:Create(object,TweenInfo.new(timeout,method),property):Play()
	else
		for a ,b  in pairs(object) do 
			TweenService:Create(b.object,TweenInfo.new(timeout,method),b.property):Play()
		end
	end
end


function Library:Service(service) 
	return game:GetService(service) ;
end 

function Library:Ripple(obj)
	spawn(function()
		local Circle = Library:Create("ImageLabel",{
			Name = "CiRainbowModeColorValuercle",
			Parent = obj,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			ZIndex = 100,
			Image = "rbxassetid://266543268",
			ImageColor3 =  Color3.fromRGB(254,12,100) , 
			ImageTransparency = 0.1,
		})
		--local Mouse = game.Players.LocalPlayer:GetMouse();
		--local NewX, NewY = Mouse.X - Circle.AbsolutePosition.X, Mouse.Y - Circle.AbsolutePosition.Y
		Circle.value.Position = UDim2.new(0.5,0,0.5,0)
		local Size = 0
		if obj.AbsoluteSize.X > obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.X * 1.5
		elseif obj.AbsoluteSize.X < obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.Y * 1.5
		elseif obj.AbsoluteSize.X == obj.AbsoluteSize.Y then
			Size = obj.AbsoluteSize.X * 1.5
		end
		Circle.value:TweenSizeAndPosition(
			UDim2.new(0, Size, 0, Size),
			UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
			"Out",
			"Back",
			1.2,
			false
		)
		for i = 1, 20 do
			Circle.value.ImageTransparency = Circle.value.ImageTransparency + 0.1
			wait(0.1 / 10)
		end
		Circle.value:Destroy()
	end)
end ;

function Library:Hold(Instance,wdud,callback)
	if not Instance or not callback then return end
	local c 
	if type(Instance) == "table" then
		for i ,v in pairs(Instance) do 
			c = v[wdud]:Connect(callback)
		end
	else
		c = Instance[wdud]:Connect(callback)
	end
	return c 
end

do -- Misc Function 

	local Funcs = {} ;

	function Funcs:Corner(v) 

		local Corner = Instance.new("UICorner",self.value) ; 
		Corner.CornerRadius = UDim.new(0,v)

		return self.value
	end ;

	Library.Funcs.__index = Funcs ;  

end ;

function Library:Create(_Instance,Property)

	local Funcs = {} ;

	function Funcs:instance_create(ins,pop) 

		if not ins or type(pop) ~= "table" then return end 

		local _newinstants = Instance.new(ins) ;

		for i ,v in pairs(pop) do 
			_newinstants[i] = v ;
		end ;

		return _newinstants 
	end ;

	Funcs.value = Funcs:instance_create(_Instance,Property)

	setmetatable(Funcs,Library.Funcs)

	return Funcs
end ;

function Library:FrameText(ver,data)
	if ver == "1" and data then
		local object = data.object
		local object2 = data.object2
		local min = data.min
		local tss = game:GetService("TextService"):GetTextSize(object.Text,object.TextSize,object.Font,Vector2.new(999999,999999))
		if tss.x > 100 then
			tss = Vector2.new(100,0)
		end
		object.Size =  UDim2.new(0,tss.x, 0, min)
		if object2 then
			object2.Size =  UDim2.new(0,tss.x, 0, min)
		end
	elseif ver == "2" and  data then
		local object = data.object
		local object2 = data.object2
		local min = data.min
		local tss = game:GetService("TextService"):GetTextSize(object.Text,object.TextSize,object.Font,Vector2.new(999999,999999))
		if tss.x > 100 then
			tss = Vector2.new(100,0)
		end
		object.Size =  UDim2.new(min,0, 0,tss.x + 5)
		if object2 then
			object2.Size =  UDim2.new(0,min, 0,tss.x)
		end
	end
end;

function Library:CreateTextLabel(text,par,pop,postype,alingtype) 

	local TextLabel = Library:Create("TextLabel",{
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5,0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0,0,0,0),
		Font = Enum.Font.GothamBold,
		Text =   text ,
		TextColor3 = Color3.fromRGB(255,255,255),
		TextTransparency = 0,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		-- TextYAlignment = Enum.TextYAlignment.Center, 
		Parent = par
	})

	local PosConfig = {
		TopLeft = {
			AnchorPoint = Vector2.new(0,0);
			Position = UDim2.new(0,0,0,0) ;
		} ;
		TopCenter = {
			AnchorPoint = Vector2.new(0.5,0);
			Position = UDim2.new(0.5,0,0,0) ;
		} ;
		TopRight = {
			AnchorPoint = Vector2.new(1,0);
			Position = UDim2.new(1,0,0,0) ;
		} ;
		RightCenter = {
			AnchorPoint = Vector2.new(1,0) ;
			Position = UDim2.new(1,0,0,0) ;
		} ;
		CenterLeft = {
			AnchorPoint = Vector2.new(0,0.5) ;
			Position = UDim2.new(0,0,0.5,0) ;
		} ;
		Center = {
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Position = UDim2.new(0.5,0,0.5,0) ;
		} ;
		CenterRight = {
			AnchorPoint = Vector2.new(1,0.5) ;
			Position = UDim2.new(1,0,0.5,0) ;
		} ;

	} 

	if postype then 
		for i ,v in pairs(PosConfig) do 
			if PosConfig[postype] then 
				for i2 ,v2 in pairs(v) do 
					TextLabel.value[i2] = v2 ;
				end
				break
			end
		end
	end

	if pop then 
		for i ,v in pairs(pop) do 
			TextLabel.value[i] = v ;
		end ;
	end ;

	Library:FrameText("1",{
		object =  TextLabel.value,
		min = 25
	})

	return TextLabel.value
end ;

local MakeDraggable = function(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.01), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	Library:Service("UserInputService").InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end
	)
end

local Screen = Library:Create("ScreenGui",{
	Name = "UniqueMobile" , 
	Parent = game.Players.LocalPlayer.PlayerGui ,
	IgnoreGuiInset = true
}) ; 

local ScreenMain = nil ;

function Library:ToggleUI() 
	local MainFrame = Library:Create("Frame",{
		Parent = Screen.value ;
		Size = UDim2.new(0,65,0,65) ;
		AnchorPoint = Vector2.new(0,0.5);
		Position = UDim2.new(0,5,0.2,0) ;
		BackgroundColor3 = Color3.fromRGB(25,25,25) ;
	}):Corner(7) ;


	local Logo = Library:Create("ImageButton",{
		Parent = MainFrame ;
		Size = UDim2.new(1,0,1,0) ;
		--Position = UDim2.new(0,15,0,-5) ;
		AutoButtonColor = false ;
		Image = "http://www.roblox.com/asset/?id=13163199831" ;
		BackgroundTransparency = 1 ;
	})

	MakeDraggable(Logo.value,MainFrame) ;


	Logo.value.MouseButton1Click:Connect(function()
		if not ScreenMain then
			return ; 
		end
		if not Library.OpenUI then 
			Library:Tween({
				{
					object = ScreenMain ;
					property = {
						Size = UDim2.new(0,600,0,350) ;
					}
				}
			},0.3,Enum.EasingStyle.Quad)
		else
			Library:Tween({
				{
					object = ScreenMain ;
					property = {
						Size = UDim2.new(0,0,0,0) ;
					}
				}
			},0.3,Enum.EasingStyle.Quad)
		end
		Library.OpenUI = not Library.OpenUI ;
	end)

end

Library:ToggleUI() ;

function Library:New() 

	local MainFrame = Library:Create("Frame",{
		Parent = Screen.value ; 
		Size = UDim2.new(0,600,0,350) ;
		Position = UDim2.new(0.5,0,0.5,0) ;
		AnchorPoint = Vector2.new(0.5,0.5) ;
		BackgroundColor3 = Color3.fromRGB(30,30,30) ;
		ClipsDescendants = true ;
	}):Corner(7) ;

	ScreenMain = MainFrame

	local Topbar = Library:Create("Frame",{
		Parent = MainFrame  ;
		Size = UDim2.new(1,0,0,25) ;
		BackgroundColor3 = Color3.fromRGB(20,20,20) ;
		-- AnchorPoint = Vector2.new(0.5,0.5) ;
		-- Position = UDim2.new(0,5,0.,0) ;
	}):Corner(7)

	local Logo = Library:Create("ImageButton",{
		Parent = Topbar ;
		Size = UDim2.new(0,50,0,50) ;
		Position = UDim2.new(0.1,-25,0.5,0) ;
		AnchorPoint = Vector2.new(0.5,0.5) ;
		AutoButtonColor = false ;
		Image = "http://www.roblox.com/asset/?id=13163199831" ;
		BackgroundTransparency = 1 ;
	})

	Library:CreateTextLabel("UNIQUE",Topbar,
	{
		Position = UDim2.new(0.15,10,0.5,0) ;
		AnchorPoint = Vector2.new(0.5,0.5) ;	
		TextSize = 12 ;
		TextColor3 = Color3.fromRGB(254,12,100) 
	},"CenterLeft")

	Library:CreateTextLabel("HUB",Topbar,
	{
		Position = UDim2.new(0.25,-5,0.5,0) ;
		AnchorPoint = Vector2.new(0.5,0.5) ;	
		TextSize = 13 ;
		-- TextColor3 = Color3.fromRGB(254,12,100) 
	},"CenterLeft")

	local Tab = Library:Create("Frame",{
		Parent = MainFrame ;
		Size = UDim2.new(0.95,0,0,35) ;
		AnchorPoint = Vector2.new(1,0.5) ;
		Position = UDim2.new(1,-15,0.1,10) ; 
		BackgroundColor3 = Color3.fromRGB(20,20,20) ;
	}):Corner(7)

	local ScrollingTab = Library:Create("ScrollingFrame",{
		Parent = Tab ; 
		Position = UDim2.new(0.5,0,0.5,0);
		AnchorPoint = Vector2.new(0.5,0.5) ;
		Size = UDim2.new(1,0,1,0) ;
		BackgroundColor3 = Color3.fromRGB(255,255,255) ;
		ScrollBarThickness = 0 ;
		BackgroundTransparency = 1.9;
	})

	local TabListLayout = Library:Create("UIListLayout",{
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center ; 
		Padding = UDim.new(0, 10),   
		Parent = ScrollingTab.value
	})

	Library:Create("UIPadding",{
		PaddingTop = UDim.new(0, 0) ,
		PaddingLeft = UDim.new(0,5) ;
		Parent =  ScrollingTab.value
	})

	TabListLayout.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingTab.value.CanvasSize = UDim2.fromOffset(0,TabListLayout.value.AbsoluteContentSize.Y)
	end)

	local Container = Library:Create("Frame",{
		Parent = MainFrame ; 
		Size = UDim2.new(0.97,0,0.8,0) ;
		Position = UDim2.new(0.5,0,1,-5) ;
		AnchorPoint = Vector2.new(0.5,1) ;
		BackgroundColor3 = Color3.fromRGB(35,35,35) ;
		ClipsDescendants = true ;
	}):Corner(7)

	local UIPage = Library:Create("UIPageLayout",{
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Horizontal,
		EasingDirection = Enum.EasingDirection.InOut,
		EasingStyle = Enum.EasingStyle.Quad,
		Padding = UDim.new(0, 15),
		ScrollWheelInputEnabled = false,
		TouchInputEnabled = false,
		TweenTime = 0.4,
		Parent = Container,
	})  

	return setmetatable({
		ContainerTab = ScrollingTab.value ;
		ContainerPage = Container ; 
		PageLayout = UIPage.value ; 
	},Library.Items)
end

do -- Item Func 
	local Func = {} 

	function Func:AddButton(title,callback) 
		local btn = {}

		local Container = Library:Create("Frame",{
			Parent = self.Container  ;
			Size = UDim2.new(1,0,0,25) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
			BackgroundTransparency =1 ;	
		}):Corner(7)

		local PageList = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 5),   
			Parent = Container
		})

		function btn:Create(p1,p2) 

			local Containerbtn = Library:Create("Frame",{
				Parent = Container ;
				Size = UDim2.new(0.93,0,0,25) ;
				BackgroundColor3 = Color3.fromRGB(35,35,35) ;
				BackgroundTransparency = 0  ;	
				ClipsDescendants = true ;
			}):Corner(3)
			
			local Logo = Library:Create("ImageButton",{
				Parent = Containerbtn ;
				Size = UDim2.new(0,40,0,40) ;
				Position = UDim2.new(0.1,-10,0.5,0) ;
				AnchorPoint = Vector2.new(0.5,0.5) ;
				AutoButtonColor = false ;
				Image = "http://www.roblox.com/asset/?id=13163199831" ;
				BackgroundTransparency = 1 ;
			})
		

			local Stroke = Library:Create("UIStroke",{
				Parent = Containerbtn ; 
				Thickness = 1 ;
				Color =  Color3.fromRGB(254,12,100)
			})
			
			local TextButton = Library:Create("TextButton",{
				BackgroundColor3 = Color3.fromRGB(45,45,45),
				Name = p1 ,
				BackgroundTransparency = 1,
				BorderSizePixel = 0 , 
				Size = UDim2.new(1,0,1,0),
				AutoButtonColor = false,
				Font = Enum.Font.GothamBold,
				TextTransparency = 0.,
				Text = p1 ,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = 12,
				Parent = Containerbtn
			})

			TextButton.value.MouseButton1Click:Connect(function()
				if Library.OpenedDropdown then return end ;
				Library:Ripple(TextButton.value) ;
				p2() ;
			end)

		end

		btn.Value = btn:Create(title,callback)

		return btn ;
	end

	function Func:AddToggle(title,stuts,callback,icon,iconpop)
		
		local image = icon 
		
		if not icon then 
			image = "6022668884" ;
		end

		--http://www.roblox.com/asset/?id=

		local ValueToggle = stuts

		local Container = Library:Create("Frame",{
			Parent = self.Container  ;
			Size = UDim2.new(0.93,0,0,30) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
			BackgroundTransparency = 1 ;	
		}):Corner(3)
		
		local Stroke = Library:Create("UIStroke",{
			Parent = Container ; 
			Thickness = 1 ;
			Color = Color3.fromRGB(255,255,255)
		})

		local ImageIcon = Library:Create("ImageLabel",{
			Parent = Container ; 
			Size = UDim2.new(0,30,0,30); 
			Image = "http://www.roblox.com/asset/?id="..tostring(image) ;
			BackgroundTransparency = 1 ;
		})

		local FrameText = Library:Create("Frame",{
			Parent = Container ; 
			Size = UDim2.new(0.65,0,0,30) ;
			Position = UDim2.new(0.45,0,0,0) ;
			AnchorPoint = Vector2.new(0.5,0) ;
			BackgroundTransparency = 1 ;
		}):Corner(7) ;

		local Title = Library:CreateTextLabel(title,FrameText,
			{
				Position = UDim2.new(0,10,0,5) ;	
				TextSize = 12 ;
				-- TextWrapped = true ;
				-- Size = UDim2.new(1,0,1,0) ;
				TextXAlignment = Enum.TextXAlignment.Left ; 
				TextYAlignment = Enum.TextYAlignment.Center ; 
				-- BackgroundTransparency = 0.8  ;
			},"CenterLeft")

		local ToggleValue = Library:Create("Frame",{
			Parent = Container ;
			Size = UDim2.new(0,50,0,20) ;
			BackgroundColor3 = Color3.fromRGB(35,35,35) ;
			Position = UDim2.new(1,-15,0,5) ;
			AnchorPoint = Vector2.new(1,0) ;
		}):Corner(360)

		local Value = Library:Create("Frame",{
			Parent = ToggleValue ;
			Size = UDim2.new(0,15,0,15) ;
			AnchorPoint = Vector2.new(0,0.5) ;
			Position = UDim2.new(0,5,0.5,0) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
		}):Corner(360)

		local Btn = Library:Create("TextButton",{
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			BackgroundTransparency = 1,
			BorderSizePixel = 0 , 
			Size = UDim2.new(1,0,1,0),
			AutoButtonColor = false,
			Font = Enum.Font.GothamBold,
			TextTransparency = 0.,
			Text = "" ,
			TextColor3 = Color3.fromRGB(255,255,255),
			Parent = ToggleValue
		})
	
		local LockFrame = Library:Create("Frame",{
			Parent = Container ;
			Size = UDim2.new(1,0,1,0) ;
			BackgroundColor3 = Color3.fromRGB(35,35,35) ;
			BackgroundTransparency = 1 ;
		})

		local ImageLock = Library:Create("ImageLabel",{
			Parent = LockFrame.value ; 
			-- Size = UDim2.new(0,25,0,25) ;
			Size = UDim2.new(0,0,0,0) ;
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Position = UDim2.new(0.5,0,0.5,0) ;
			BackgroundTransparency = 1 ;
			Image = "http://www.roblox.com/asset/?id=6031082533"
		})


		local Locked  = false ;

		if #title > 25 then 
			local  Y = 30 ;

			if #title >  25 then
				local S =  #title / 35 
	
				Y = Y * S ; 
			end

			Container.Size = UDim2.new(0.93,0,0,Y)
			FrameText.Size = UDim2.new(0.65,0,0,Y ) ;

			Title.TextYAlignment = Enum.TextYAlignment.Top ; 
			Title.TextWrapped = true ;
			
			Title.Size = UDim2.new(1,0,0,FrameText.Size.Y.Offset - 5 ) ; 
		end

		if ValueToggle then 
			Library:Tween({
				{
					object = Value,
					property = {
						BackgroundColor3 = Color3.fromRGB(254,12,100)  ;
						Position = UDim2.new(1,-5,0.5,0) ; 
						AnchorPoint = Vector2.new(1,0.5) ;
					}
				},
				{
					object = Stroke.value,
					property = {
						Color =  Color3.fromRGB(254,12,100)
					}
				},
			},0.4,Enum.EasingStyle.Quad)
			callback(ValueToggle) ;
		end

		local Set = function()  
			local Pop , Pop2 ; 
			if not ValueToggle then 
				Pop = {
					BackgroundColor3 = Color3.fromRGB(254,12,100)  ;
					Position = UDim2.new(1,-5,0.5,0) ; 
					AnchorPoint = Vector2.new(1,0.5) ;
				}
				Pop2 = {
					Color =  Color3.fromRGB(254,12,100)
				}
			else
				Pop = {
					AnchorPoint = Vector2.new(0,0.5) ;
					Position = UDim2.new(0,5,0.5,0) ;
					BackgroundColor3 = Color3.fromRGB(255,255,255) ;
				}
				Pop2 = {
					Color =  Color3.fromRGB(255,255,255)
				}
			end
			Library:Tween({
				{
					object = Value,
					property = Pop ; 
				},
				{
					object = Stroke.value,
					property = Pop2 ; 
				},
			},0.4,Enum.EasingStyle.Quad)
			ValueToggle = not ValueToggle ;
			callback(ValueToggle) ;
		end

		Btn.value.MouseButton1Click:Connect(function()
			if Library.OpenedDropdown or Locked then return end ;
			return Set() ;
		end)

		return {
			Stuts =  false ;
			IFLock = function(self)

				Locked = self.Stuts ;
				if self.Stuts then 
					Library:Tween({
						{
							object = LockFrame.value,
							property = {
								BackgroundTransparency = 0.3 ;
							}
						},
						{
							object = ImageLock.value,
							property = {
								Size = UDim2.new(0,25,0,25) ;
							}
						},
					},0.4,Enum.EasingStyle.Quad)
				else
					Library:Tween({
						{
							object = LockFrame.value,
							property = {
								BackgroundTransparency = 1 ;
							}
						},
						{
							object = ImageLock.value,
							property = {
								Size = UDim2.new(0,0,0,0) ;
							}
						},
					},0.4,Enum.EasingStyle.Quad)
				end ;

			end ;
			SetLock = function(self,v)
				self.Stuts = v ;
				return self:IFLock() ;
			end ;
			IsLock = function(self,v)
				return self.Stuts ; 
			end; 
		}
	end

	function Func:AddLine(color)
		local Frame = Library:Create("Frame",{
			Parent = self.Container ; 
			Size = UDim2.new(0.95,0,0,10) ;
			BackgroundTransparency = 1 ;
		}):Corner(15)

		local FrameLine = Library:Create("Frame",{
			Parent = Frame ;
			Size = UDim2.new(1,0,0,3) ;
			Position = UDim2.new(0,0,0.5,0);
			AnchorPoint = Vector2.new(0,0.5) ;
			BackgroundColor3 = Color3.fromRGB(254,12,100)
		}):Corner(6)

		if color then 
			FrameLine.BackgroundColor3 = color ;
		end
	end

	function Func:AddSlider(title,min,max,default,callback) 
		local FrameSlider = Library:Create("Frame",{
			Parent = self.Container ;
			Size = UDim2.new(0.93,0,0,50) ;
			BackgroundTransparency = 1 ;
		}):Corner(15 )

		local Container = Library:Create("Frame",{
			Parent = FrameSlider ;
			Size = UDim2.new(1,0,1,0) ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(5) 
		

		local Stroke = Library:Create("UIStroke",{
			Parent = Container ; 
			Thickness = 1 ;
			Color = Color3.fromRGB(254,12,100)
		})
		
		local Title = Library:CreateTextLabel(title,Container,
			{	
				TextSize = 12 ;
			},"TopCenter")

		Title.Position = UDim2.new(0,5,0,0) ;

		local FrameValue = Library:Create("Frame",{
			Parent = Container ;
			AnchorPoint = Vector2.new(0,1) ;
			Position = UDim2.new(0,5,1,-5) ;
			Size = UDim2.new(0.95,0,0,20) ;
			BackgroundTransparency = 1 ; 
		})

		local ValueFrame = Library:Create("Frame",{
			Parent = FrameValue.value ;
			AnchorPoint = Vector2.new(0.5,0.5);
			Position = UDim2.new(0.5,0,0.5,0) ;
			Size = UDim2.new(1,0,0.3,0) ;
		}):Corner(360)


		local Valuef = Library:Create("Frame",{
			Parent = ValueFrame , 
			Size =  UDim2.fromScale(((default - min) / (max - min)), 1),
			BackgroundColor3 = Color3.fromRGB(254,12,100)
		}):Corner(360)

		local TextValue = Library:CreateTextLabel(title,FrameSlider,
			{	
				TextSize = 12 ;
				Text = default or 0 ;
				AnchorPoint = Vector2.new(1,0) ;
				Position = UDim2.new(1,-10,0,0) ;

			},"TopLeft")

		local BtnClick = Library:Create("TextButton",{
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			BackgroundTransparency = 1,
			BorderSizePixel = 0 , 
			Size = UDim2.new(1,0,1.3,0),
			AutoButtonColor = false,
			Font = Enum.Font.GothamBold,
			TextTransparency = 0.,
			Text = "" ,
			TextColor3 = Color3.fromRGB(255,255,255),
			Parent = ValueFrame
		})

		local dragging = false 
		local Value = default ;

		local function move(input)
			local pos1 =  UDim2.new(  math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1), 0,  1,   0   )

			local pos = UDim2.new( math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1), 0, 0, 0 )

			Valuef:TweenSize(pos1, "Out", "Sine", 0.2, true)

			Value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)

			TextValue.Text = tostring(Value)

			callback(tonumber(Value))
		end

		Library:Hold(BtnClick.value,"InputBegan",function(input)
			if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 ) then
				dragging = true
			end
		end)

		Library:Hold(BtnClick.value,"InputEnded",function(input)
			if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1	 ) then
				dragging = false
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if Library.OpenedDropdown then return end ;
			if dragging then --and( input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1	 )  then
				-- print("work")
				move(input)
			end
		end)


	end

	function Func:AddDropdown(title,default,multi,tabledata,callback)
		local Value  ;
		local onoff = false ;

		local Container = Library:Create("Frame",{
			Parent = self.Container ; 
			Size = UDim2.new(0.93,0,0,45) ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(5)
		
		local Stroke = Library:Create("UIStroke",{
			Parent = Container ; 
			Thickness = 1 ;
			Color = Color3.fromRGB(254,12,100)
		})
		
		local TextValue = Library:CreateTextLabel(title,Container,
			{	
				TextSize = 12 ;
				Text = title.." : " ;
				Position = UDim2.new(0,10,0,0) ;
				TextXAlignment = Enum.TextXAlignment.Left,
			},"TopLeft")

		local FrameBtn = Library:Create("Frame",{
			Parent = Container ;
			Size = UDim2.new(0.95,0,0,15);
			AnchorPoint = Vector2.new(0.5,1);
			Position = UDim2.new(0.5,0,1,-5);
			--BackgroundTransparency = 1 ;
			BackgroundColor3 = Color3.fromRGB(254,12,100)
		}):Corner(5)

		local BtnClick = Library:Create("TextButton",{
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			BackgroundTransparency = 1,
			BorderSizePixel = 0 , 
			Size = UDim2.new(1,0,1,0),
			AutoButtonColor = false,
			Font = Enum.Font.GothamBold,
			TextSize = 12 ;
			TextTransparency = 0.,
			Text = "OPEN" ,
			TextColor3 = Color3.fromRGB(255,255,255),
			Parent = FrameBtn
		})

		local ContainerItem = Library:Create("Frame",{
			Parent = self.ContainerPage ; 
			Size = UDim2.new(0,0,0,0) ; 
			AnchorPoint = Vector2.new(0.5,0) ;
			Position = UDim2.new(0.5,0,0,0) ;
			BackgroundColor3 = Color3.fromRGB(15,15,15) ;
			BackgroundTransparency = 0.05 ;
		}):Corner(7)

		local Exit = Library:Create("TextButton",{
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			BackgroundTransparency = 1,
			BorderSizePixel = 0 , 
			Position = UDim2.new(1,-3,0,5); 
			AnchorPoint = Vector2.new(1,0);
			Size = UDim2.new(0,0,0,0),
			AutoButtonColor = false,
			Font = Enum.Font.GothamBold,
			TextScaled = true ;
			TextTransparency = 0.,
			Text = "X" ,
			TextColor3 = Color3.fromRGB(255,255,255),
			Parent = ContainerItem
		})

		local FrameList = Library:Create("Frame",{
			Parent = ContainerItem ;
			Size = UDim2.new(0.85,0,0.75,0) ;
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Position = UDim2.new(0.5,0,0.5,0) ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(7)

		local ScrollingTab = Library:Create("ScrollingFrame",{
			Parent = FrameList ; 
			Position = UDim2.new(0.5,0,0.5,0);
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Size = UDim2.new(1,0,1,0) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
			ScrollBarThickness = 0 ;
			BackgroundTransparency = 1.9;
		})

		local PageList = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center ;
			Padding = UDim.new(0, 5),   
			Parent = ScrollingTab.value
		})

		Library:Create("UIPadding",{
			--PaddingTop = UDim.new(0, 10) ,
			Parent =  ScrollingTab.value
		})

		local Dropdown = {} ;

		function Dropdown:Display() 
			if multi then
				local st = ""
				for i ,v in pairs(Value) do
					st = st..v..",";
				end	
				TextValue.Text = title.." : "..st

				if #TextValue.Text > 50 then
					TextValue.Text = TextValue.Text:sub(1,50).."..." ;
				end
				callback(Value)
				return 
			end
			TextValue.Text = title.." : "..Value

			if #TextValue.Text > 50 then
				TextValue.Text = TextValue.Text:sub(1,50).."..." ;
			end
			callback(Value)
		end

		function Dropdown:Add(v)
			if v then 
				table.insert(tabledata,v) ;
			end
			for i ,v in pairs(tabledata) do 

				local Frame = Library:Create("Frame",{
					Parent = ScrollingTab.value ; 
					Size = UDim2.new(0.95,0,0,15) ;
					BackgroundColor3 = Color3.fromRGB(45,45,45) ; -- Color3.fromRGB(254,12,100) ;
					Name = v ;
				}):Corner(3)

				local BtnClick = Library:Create("TextButton",{
					BackgroundColor3 = Color3.fromRGB(45,45,45),
					BackgroundTransparency = 1,
					BorderSizePixel = 0 , 
					Size = UDim2.new(1,0,1,0),
					AutoButtonColor = false,
					Font = Enum.Font.GothamBold,
					TextSize = 12 ;
					TextTransparency = 0.,
					Text = v ,
					TextColor3 = Color3.fromRGB(255,255,255),
					Parent = Frame
				})

				BtnClick.value.MouseButton1Click:Connect(function()
					if not multi then
						Value = Frame.Name ;
						for i ,v in pairs(ScrollingTab.value:GetChildren()) do 
							if v:IsA('Frame') then 
								if v.Name == Frame.Name then
									Library:Tween({
										{
											object = Frame,
											property = {
												BackgroundColor3 = Color3.fromRGB(254,12,100) ; 
											}
										},
									},0.4,Enum.EasingStyle.Quad)
								else
									Library:Tween({
										{
											object = v,
											property = {
												BackgroundColor3 = Color3.fromRGB(45,45,45)
											}
										},
									},0.4,Enum.EasingStyle.Quad)
								end
							end
						end
					else
						for i ,v in pairs(ScrollingTab.value:GetChildren()) do 
							if not v:IsA("Frame") or v.Name ~= Frame.Name  then continue end ;

							if table.find(Value,v.Name) then
								Library:Tween({
									{
										object = v,
										property = {
											BackgroundColor3 = Color3.fromRGB(45,45,45)
										}
									},
								},0.4,Enum.EasingStyle.Quad)
								table.remove(Value,table.find(Value,v.Name))
								break
							end
							Library:Tween({
								{
									object = v,
									property = {
										BackgroundColor3 = Color3.fromRGB(254,12,100) ; 
									}
								},
							},0.4,Enum.EasingStyle.Quad)
							table.insert(Value,v.Name)

						end
					end
					Dropdown:Display()
				end)

				if multi then
					if type(Value) ~= "table" then Value = {} end ;
					for i2 ,v2 in pairs(default) do 
						if v2 == v then
							Library:Tween({
								{
									object = Frame,
									property = {
										BackgroundColor3 = Color3.fromRGB(254,12,100) ; 
									}
								},
							},0.4,Enum.EasingStyle.Quad)
							table.insert(Value,v) ;
						end
					end
				else
					if v == default then
						Library:Tween({
							{
								object = Frame,
								property = {
									BackgroundColor3 = Color3.fromRGB(254,12,100) ; 
								}
							},
						},0.4,Enum.EasingStyle.Quad)
						Value = v ;
					end
				end

			end
		end

		function Dropdown:Clear() 
			if multi then 
				Value = {} ;
			else
				Value = nil ;
			end
			for i ,v in pairs(ScrollingTab.value:GetChildren()) do 
				if not v:IsA("Frame") then 
					continue
				end

				v:Destory() ;
			end
		end

		Dropdown:Add()

		Dropdown:Display()

		PageList.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingTab.value.CanvasSize = UDim2.fromOffset(0,PageList.value.AbsoluteContentSize.Y)
		end)

		BtnClick.value.MouseButton1Click:Connect(function()
			if Library.OpenedDropdown then return end ;
			if not onoff then
				Library.OpenedDropdown = true ;
				Library:Tween({
					{
						object = ContainerItem,
						property = {
							Size = UDim2.new(1,0,1,0) ;
						}
					},
					{
						object = Exit.value ,
						property = {
							Size = UDim2.new(0,25,0,25),
						}
					}
				},0.4,Enum.EasingStyle.Back)
			else
				Library.OpenedDropdown = false ;
				Library:Tween({
					{
						object = ContainerItem,
						property = {
							Size = UDim2.new(0,0,0,0) ;
						}
					},
					{
						object = Exit.value ,
						property = {
							Size = UDim2.new(0,0,0,0),
						}
					}
				},0.2,Enum.EasingStyle.Back)
			end

			onoff = not onoff 
		end)

		Exit.value.MouseButton1Click:Connect(function()
			Library:Tween({
				{
					object = ContainerItem,
					property = {
						Size = UDim2.new(0,0,0,0) ;
					}
				},
				{
					object = Exit.value ,
					property = {
						Size = UDim2.new(0,0,0,0),
					}
				}
			},0.2,Enum.EasingStyle.Quad)
			onoff = false ;
			Library.OpenedDropdown = false ;
		end)

		return Dropdown
	end

	function Func:AddTextbox(title,value,callback)
		local Frame = Library:Create("Frame",{
			Parent = self.Container ;
			Size = UDim2.new(0.93,0,0,70) ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(7)
		
		local Stroke = Library:Create("UIStroke",{
			Parent = Frame ; 
			Thickness = 1 ;
			Color = Color3.fromRGB(254,12,100)
		})
		
		local TextValue = Library:CreateTextLabel(title,Frame,
			{	
				TextSize = 12 ;
				Text = title;
				Position = UDim2.new(0.5,0,0,5) ;
				AnchorPoint = Vector2.new(0.5,0) ;
				TextXAlignment = Enum.TextXAlignment.Center,
			},"TopLeft")

		local TextValue = Library:Create("TextBox",{
			Name = "TextValue" , 
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			BackgroundTransparency = 0,
			Position = UDim2.new(0.5,0, 1,-5),
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.new(0.95,0,0, 25),
			Font = Enum.Font.GothamBold,
			Text =  tostring(value),
			TextColor3 = Color3.fromRGB(255,255,255) ;
			TextTransparency = 0.5,
			TextSize = 11,
			BorderSizePixel = 0 ,
			TextXAlignment = Enum.TextXAlignment.Center,
			Parent = Frame,
		})

		local Value= value ;

		callback(Value) ;
		TextValue.value.FocusLost:Connect(function()
			if #TextValue.value.Text > 0 then
				Value = TextValue.value.Text ; 
				callback(TextValue.value.Text)
			end
		end)


	end

	function Func:AddSeperator(title)
		local Label = Library:Create("Frame",{
			Parent = self.Container ; 
			Size = UDim2.new(0.95,0,0,30) ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
			BackgroundTransparency = 1 ;
		}):Corner(7)


		local LabelFrame = Library:Create("Frame",{
			Size = UDim2.new(0.9,0,0,2),
			Position = UDim2.new(0.5, 0, 0.5, 0) ,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255,11,97),
			Name = "Label",
			ClipsDescendants = true,
			Parent = Label
		}):Corner(5) ;

		local TextName = Library:Create("TextLabel",{
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
			BackgroundTransparency = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0.5,0, 0.5,0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Font = Enum.Font.GothamBold,
			Text =  tostring(title),
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 12,
			BorderSizePixel = 0 ;
			Parent = Label,
		})

		Library:FrameText("1",{
			object = TextName.value,
			min = 100
		})

		local OldSize = TextName.value.Size.X.Offset
		TextName.value.Size = UDim2.new(0,OldSize + 25 ,1,0)

	end

	function Func:AddLabel(title)

		local Text = Library:CreateTextLabel(title,self.Container,{
			TextXAlignment = Enum.TextXAlignment.Center,	
			TextYAlignment = Enum.TextYAlignment.Top ; 
			TextWrapped  = true ;
			BackgroundTransparency = 1 ;
		}) ;

		local  Y = 15 ;

		if #title >  50 then
			local S =  #title / 60 

			Y = Y * S ; 
		end

		Text.Size = UDim2.new(0.95,0,0,Y) ; 

		return Text ; 
	end

	Library.TabFunc.__index = Func  

end

Library.Pages = {} ;
do 	-- Create Page ;
	local Pages = {} ;

	function Pages:GroupPage(page) 

		local Left = self.Left.Container
		local Right = self.Right.Container
	
		local Container = nil ;

		if page == 1 then 
			Container = Left;
		else
			Container = Right
		end ;

		local Group = {
			Size = 1;
			Count = 0 ;
			Select = nil ;
			Data ={};
			News = {} ;
			Start = false ;
		} ;

		local OutLine = Library:Create("Frame",{
			Parent = Container ;
			Size = UDim2.new(0.95,0,0,100) ;
			BackgroundTransparency = 1 ;
		}):Corner(7)

		local Stroke = Library:Create("UIStroke",{
			Parent = OutLine ; 
			Thickness = 1.5 ;
			Transparency = 0.8 ;
			-- Color =  Color3.fromRGB(254,12,100)
			Color =  Color3.fromRGB(255,255,255)
		})

		local TabsItem = Library:Create("Frame",{
			Parent = OutLine ;
			Size = UDim2.new(0.95,0,0,20) ;
			AnchorPoint = Vector2.new(0.5,0) ;
			Position = UDim2.new(0.5,0,0,5) ;
			BackgroundColor3 = Color3.fromRGB(45,45,45);
		}):Corner(7)

		local Listlayout = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center ,
			Padding = UDim.new(0, 5),   
			Parent = TabsItem
		})

		function Group:Hide() 
			for i ,v in pairs(self.Data) do 
				Library:Tween({
					{
						object = v.uuid,
						property = {
							BackgroundTransparency = 0.7 ;
						}
					},
				},0.4,Enum.EasingStyle.Quad)
				v.Item.Visible = false ;
				-- if v.Layout then 
				-- 	v.Layout:Disconnect() ;
				-- end ;
			end ;
		end ;

		function Group:Add(Title) 

			self.Count += 1 

			if self.Count >= 2  then 
				for i ,v in pairs(self.Data) do 
					v.uuid.Size = UDim2.new(0.5,-5,1,0) ;
				end ;
				self.Size = 0.5 ;
			end ;

			local FakeFrame = Library:Create("Frame",{
				Parent = TabsItem ; 
				Size = UDim2.new(self.Size,0,1,0) ;
				BackgroundColor3 = Color3.fromRGB(254,12,100) ;
				Name = Title ;
			}):Corner(7)
			
			local TextButton = Library:Create("TextButton",{
				Parent = FakeFrame ;
				Size = UDim2.new(self.Size,0,1,0) ;
				Text = "" ;
				BackgroundTransparency = 1
			})

			local Text = Library:CreateTextLabel(Name or "Title",FakeFrame,{
				TextYAlignment = Enum.TextYAlignment.Center ; 
				TextXAlignment = Enum.TextXAlignment.Center,	
				TextWrapped  = true ;
				-- Position = UDim2.new(0,5,0,5) ;
				-- AnchorPoint = Vector2.new(0,0);
				TextColor3 = Color3.fromRGB(255,255,255) ;
				BackgroundTransparency = 1 ;
			}) ;

				
			local FrameItems = Library:Create("Frame",{
				Parent = OutLine ; 
				Size = UDim2.new(0.95,0,0.4,0) ;
				AnchorPoint = Vector2.new(0.5,0) ;
				Position = UDim2.new(0.5,0,0,30) ;
				BackgroundTransparency = 1 ;
				Visible = true ;
			})

			local Listlayout = Library:Create("UIListLayout",{
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center ,
				Padding = UDim.new(0, 10),   
				Parent = FrameItems.value
			})

			table.insert(self.Data,{
				uuid = FakeFrame ;
				Item = FrameItems.value ;
				Name = Title ;
				Layout = Listlayout.value ;
			})

			Library:Create("UIPadding",{
				PaddingTop = UDim.new(0, 5) ,
				-- PaddingLeft = UDim.new(0,5) ;
				Parent =  FrameItems.value
			})

			TextButton.value.MouseButton1Click:Connect(function()
				Group:Hide()
				Library:Tween({
					{
						object = FakeFrame,
						property = {
							BackgroundTransparency = 0.
						}
					},
				},0.4,Enum.EasingStyle.Quad)
				FrameItems.value.Visible = true ;
				OutLine.Size = UDim2.new(0.95,0,0,Listlayout.value.AbsoluteContentSize.Y + 50)
			end)
			
			if not self.Start then 
				self.Start = true ;
				
				Listlayout.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					OutLine.Size = UDim2.new(0.95,0,0,Listlayout.value.AbsoluteContentSize.Y + 50)
				end)
			else
				FrameItems.value.Visible = false ;
				FakeFrame.BackgroundTransparency = 0.7
			end;	
			
			return setmetatable({
				Container = FrameItems.value ; 
			},Library.TabFunc) ;

		end ;

		return Group
	end ;

	function Pages:CreatePage(Title,page) 
		
		local Left = self.Left.Container
		local Right = self.Right.Container
	
		local Container = nil ;

		if page == 1 then 
			Container = Left;
		else
			Container = Right
		end ;

		local OutLine = Library:Create("Frame",{
			Parent = Container ;
			Size = UDim2.new(0.95,0,0,100) ;
			BackgroundTransparency = 1 ;
		}):Corner(7)

		local Stroke = Library:Create("UIStroke",{
			Parent = OutLine ; 
			Thickness = 1.5 ;
			Transparency = 0.8 ;
			-- Color =  Color3.fromRGB(254,12,100)
			Color =  Color3.fromRGB(255,255,255)
		})
		
		local Text = Library:CreateTextLabel(Title or "Title",OutLine,{
			TextYAlignment = Enum.TextYAlignment.Top ; 
			TextXAlignment = Enum.TextXAlignment.Left,	
			TextWrapped  = true ;
			Position = UDim2.new(0,5,0,5) ;
			AnchorPoint = Vector2.new(0,0);
			TextColor3 = Color3.fromRGB(254,12,100) ;
			BackgroundTransparency = 1 ;
		}) ;

		local FrameItems = Library:Create("Frame",{
			Parent = OutLine ; 
			Size = UDim2.new(0.95,0,0.75,0) ;
			AnchorPoint = Vector2.new(0.5,0) ;
			Position = UDim2.new(0.5,0,0,20) ;
			BackgroundTransparency = 10 ;
		})

		local Listlayout = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center ,
			Padding = UDim.new(0, 10),   
			Parent = FrameItems.value
		})

		Library:Create("UIPadding",{
			PaddingTop = UDim.new(0, 5) ,
			-- PaddingLeft = UDim.new(0,5) ;
			Parent =  FrameItems.value
		})

		Listlayout.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			OutLine.Size = UDim2.new(0.95,0,0,Listlayout.value.AbsoluteContentSize.Y + 50)
		end)

		return setmetatable({
			Container = FrameItems.value ; 
			ContainerPage = LeftContainer ; 
		},Library.TabFunc) ;


	end ;

	Library.Pages.__index = Pages ;

end ;

do -- Create Tab ;
	local Tab = {
		Data = {} ;
		Start = false ;	
		Layout = 0 ;
	} ;

	function Tab:TabClick(id,parent)
		return self.PageLayout:JumpToIndex(id) 
	end

	function Tab:TabOnClick(btn) 
		for i, v in pairs(self.Data) do 
			if v.Name == btn then 
				Library:Tween({
					{
						object = v,
						property = {
							TextColor3 = Color3.fromRGB(254,12,100) ;
						}
					},
				},0.4,Enum.EasingStyle.Quad)
			else
				Library:Tween({
					{
						object = v,
						property = {
							TextColor3 =  Color3.fromRGB(255,255,255) ;
						}
					},
				},0.4,Enum.EasingStyle.Quad)
			end
		end
	end

	function Tab:CreateTab(title,page,icon,popicon) 

		local image = icon 
		
		if not icon then 
			image = "6022668884" ;
		end

		--http://www.roblox.com/asset/?id=

		local MainTab = Library:Create("Frame",{
			Parent = self.ContainerTab ; 
			Size = UDim2.new(0,30,0,30) ;
			BackgroundTransparency = 1 ;
			Name = title ; 
		})


		local Text = Library:CreateTextLabel(title,MainTab.value,{
			TextXAlignment = Enum.TextXAlignment.Left,	
			Name = title ; 
		}) ;

		MainTab.value.Size = UDim2.new(0,Text.Size.X.Offset,0,30) ;

		local Btn = Library:Create("TextButton",{
			BackgroundColor3 = Color3.fromRGB(45,45,45),
			Name = "" ,
			BackgroundTransparency = 1,
			BorderSizePixel = 0 , 
			Size = UDim2.new(1,0,1,0),
			AutoButtonColor = false,
			Font = Enum.Font.GothamBold,
			TextTransparency = 0.,
			Text = "" ,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = 12,
			Parent = MainTab.value
		})

		local PageContainer = Library:Create("Frame",{
			Parent = self.ContainerPage ;
			Size = UDim2.new(1,0,1,0) ;
			Position = UDim2.new(0.5,0,1,-5) ;
			AnchorPoint = Vector2.new(0.5,1) ;
			BackgroundColor3 = Color3.fromRGB(35,35,35) ;
			LayoutOrder = self.Layout ; 
		}):Corner(7)

		local LeftContainer = Library:Create("Frame",{
			Parent = PageContainer ; 
			Size = UDim2.new(0.5,-10,0.95,0) ;
			Position = UDim2.new(0,5,0.5,0) ;
			AnchorPoint = Vector2.new(0,0.5) ;
			--BackgroundTransparency = 1 ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(7)

		local RightContainer = Library:Create("Frame",{
			Parent = PageContainer ; 
			Size = UDim2.new(0.5,-10,0.95,0) ;
			Position = UDim2.new(1,-5,0.5,0) ;
			AnchorPoint = Vector2.new(1,0.5) ;
			--BackgroundTransparency = 1 ;
			BackgroundColor3 = Color3.fromRGB(25,25,25) ;
		}):Corner(7)

		local ScrollingPageLeft = Library:Create("ScrollingFrame",{
			Parent = LeftContainer ; 
			Position = UDim2.new(0.5,0,0.5,0);
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Size = UDim2.new(1,0,1,0) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
			ScrollBarThickness = 0 ;
			BackgroundTransparency = 1.9;
		})

		local TabListLayoutLeftPage = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center ,
			Padding = UDim.new(0, 10),   
			Parent = ScrollingPageLeft.value
		})

		Library:Create("UIPadding",{
			PaddingTop = UDim.new(0, 5) ,
			PaddingLeft = UDim.new(0,5) ;
			Parent =  ScrollingPageLeft.value
		})

		TabListLayoutLeftPage.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingPageLeft.value.CanvasSize = UDim2.fromOffset(0,TabListLayoutLeftPage.value.AbsoluteContentSize.Y + 30)
		end)

		local ScrollingPageRight = Library:Create("ScrollingFrame",{
			Parent = RightContainer ; 
			Position = UDim2.new(0.5,0,0.5,0);
			AnchorPoint = Vector2.new(0.5,0.5) ;
			Size = UDim2.new(1,0,1,0) ;
			BackgroundColor3 = Color3.fromRGB(255,255,255) ;
			ScrollBarThickness = 0 ;
			BackgroundTransparency = 1.9;
		})

		local TabListLayoutRightPage = Library:Create("UIListLayout",{
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center ,
			Padding = UDim.new(0,10),   
			Parent = ScrollingPageRight.value
		})

		Library:Create("UIPadding",{
			PaddingTop = UDim.new(0, 5) ,
			PaddingLeft = UDim.new(0,10) ;
			Parent =  ScrollingPageRight.value
		})

		TabListLayoutRightPage.value:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			ScrollingPageRight.value.CanvasSize = UDim2.fromOffset(0,TabListLayoutRightPage.value.AbsoluteContentSize.Y + 30)
		end)

		self.Layout += 1 


		Btn.value.MouseButton1Click:Connect(function()
			self:TabOnClick(MainTab.value.Name) ; 
			return self:TabClick(PageContainer.LayoutOrder) ;
		end)

		self.Data[Text] = Text ;

		if not self.Start then 
			self:TabOnClick(title) ;
			self.Start = true ;
		end


		-- if page == 1 then 
		-- 	return setmetatable({
		-- 		Container = ScrollingPageLeft.value ; 
		-- 		ContainerPage = LeftContainer ; 
		-- 	},Library.TabFunc) ;

		-- else
		-- 	return setmetatable({
		-- 		Container = ScrollingPageRight.value ; 
		-- 		ContainerPage = RightContainer ;
		-- 	},Library.TabFunc) ;

		-- end

		return setmetatable({
			Left = {
				Container = ScrollingPageLeft.value ; 
				ContainerPage = LeftContainer ; 
			};
			Right = {
				Container = ScrollingPageRight.value ; 
				ContainerPage = RightContainer ;
			}
		},Library.Pages);

		-- if page == 1 then 
		-- 	return setmetatable({
		-- 		Container = ScrollingPageLeft.value ; 
		-- 		ContainerPage = LeftContainer ; 
		-- 	},Library.Pages) ;

		-- else
		-- 	return setmetatable({
		-- 		Container = ScrollingPageRight.value ; 
		-- 		ContainerPage = RightContainer ;
		-- 	},Library.Pages) ;

		-- end
	end

	Library.Items.__index = Tab ;
end

return Library

