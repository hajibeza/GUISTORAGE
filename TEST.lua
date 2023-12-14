local placeId = game.PlaceId
if placeId == 2753915549 then
	World1 = true
elseif placeId == 4442272183 then
	World2 = true
elseif placeId == 7449423635 then
	World3 = true
end

function import_CheckQuest()
    local CheckQ = loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/Module/main/CheckQuest_Module.lua'))()
    CheckQuest()
end

function TP(P)
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        local Speed = 350
    elseif Distance < 1000 then
        local Speed = 350
    elseif Distance >= 1000 then
        local Speed = 250
    end
    local tween = game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P}
    ):Play()

    function cancelTween()
        tween:Cancel()
    end
end

import_CheckQuest()

function Check_Near_Mon(Monster)
    local Table_Monster = Monster
    if type(Monster) == "string" then Table_Monster = {Monster} end
    for i,v in pairs(workspace.Enemies:GetChildren()) do
        if table.find(Table_Monster,v.Name) then
            return v
        end
    end
    for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
        if table.find(Table_Monster,v.Name) then    
            return v
        end
    end
    return nil
end

local MIDN = loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/RIPPER/main/TESTGUI.lua'))();

local MIDN = MIDN:Window("RIPPER HUB Mobile Script")

local MIDNServer = MIDN:Server("Blox Fruit",7040391851)

local page1 = MIDNServer:Channel("Main")

page1:Toggle("Auto Farm Level",false,function(value)
	Auto_Farm_Level = value
end)

spawn(function() 
    while wait() do
        pcall(function()
            if Auto_Farm_Level then
                print("AutoFarm")
            end
        end)
    end
end)
