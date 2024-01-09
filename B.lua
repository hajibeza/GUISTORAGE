local Player = game.Players
local Local_Player = Player.LocalPlayer
local Char = Local_Player.Character
local Root = Char.HumanoidRootPart
Players = game.Players

local placeId = game.PlaceId
if placeId == 2753915549 then
	FirstSea = true
elseif placeId == 4442272183 then
	SecondSea = true
elseif placeId == 7449423635 then
	ThirdSea = true
end

SeaIndex = ThirdSea and 3 or SecondSea and 2 or FirstSea and 1 or Local_Player:Kick("Didn't update this Sea")

Teleport_Island = true

CanTeleport = {
    {
        ["Sky3"] = Vector3.new(-7894, 5547, -380),
        ["Sky3Exit"] = Vector3.new(-4607, 874, -1667),
        ["UnderWater"] = Vector3.new(61163, 11, 1819),
        ["UnderwaterExit"] = Vector3.new(4050, -1, -1814),
    },
    {
        ["Swan Mansion"] = Vector3.new(-390, 332, 673),
        ["Swan Room"] = Vector3.new(2285, 15, 905),
        ["Cursed Ship"] = Vector3.new(923, 126, 32852),
    },
    {
        ["Floating Turtle"] = Vector3.new(-12462, 375, -7552),
        ["Hydra Island"] = Vector3.new(5745, 610, -267),
        ["Mansion"] = Vector3.new(-12462, 375, -7552),
        ["Castle"] = Vector3.new(-5036, 315, -3179),
    }
}

dist = function(Position_a,Position_b,noHeight)
    local pa,pb = pcall(function()
        if not Position_b then
            if Local_Player.Character:FindFirstChild("HumanoidRootPart") then
                Position_b = Local_Player.Character.HumanoidRootPart.Position
            end
        end
    end)
    if not pa then warn(pb) end
    return (Vector3.new(Position_a.X,not noHeight and Position_a.Y,Position_a.Z) - Vector3.new(Position_b.X,not noHeight and Position_b.Y,Position_b.Z)).magnitude
end

InArea = function(Pos,Location)
    local nearest,scale = nil,0
    if Location then
        if dist(Pos,Location.Position,true) <= (Location.Mesh.Scale.X/2)+500 then
            return Location
        end
    end
    for i,v in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
        if dist(Pos,v.Position,true) <= (v.Mesh.Scale.X/2)+500 then
            if scale < v.Mesh.Scale.X then
                scale = v.Mesh.Scale.X
                nearest = v
            end
        end
    end
    return nearest
end

function Use_Remote(a,b)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(a,b)
end

function TP(...)
    local target = ...
    pcall(function()
        if Teleport_Island then
            local Dista,distm,middle = dist(target,nil,true),1/0
            if Local_Player.Character and Local_Player.Character.HumanoidRootPart and Dista >= 2000 and tick() - recentlySpawn > 5 then
                for i,v in pairs(CanTeleport[SeaIndex]) do
                    local distance = dist(v,target,true)
                    if distance < dist(target,nil,true) and distance < distm then
                        distm,middle = distance,v
                    end
                end
                if middle and InArea(Local_Player.Character.HumanoidRootPart.Position) ~= InArea(middle) then
                    -- print(Root.Position,"\n",target.p)
                    -- print(Dista,distm,CurrentArea,InArea(middle))
                    Use_Remote("requestEntrance",middle)
                end
            end
        end
        if not disableIslandSkip and Bypass_Tp then
            if Local_Player.Character.HumanoidRootPart and not Raiding() then
                local Area = InArea(target.p)
                local MyArea = InArea(Local_Player.Character.HumanoidRootPart.Position)
                local SpawnPoint = workspace["_WorldOrigin"].PlayerSpawns[Local_Player.Team.Name]:GetChildren()
                local dista,distm,charDist,nearest = 2000,9000
                for i,v in pairs(SpawnPoint) do
                    local Position = v:GetPivot().p
                    local distance = dist(target.p,Position,true)
                    if distance <= dista then
                        charDist = dist(Position,nil,true)
                        dista,nearest = distance,v
                    end
                end 
                if nearest and (charDist <= 8700) then
                    if not Local_Player.Character:FindFirstChild("Humanoid") then return end
                    if not Local_Player.Character:FindFirstChild("HumanoidRootPart") then return end
                    if Local_Player.Character.HumanoidRootPart:FindFirstChild("Died") then
                        Local_Player.Character.HumanoidRootPart.Died:Destroy()
                    end
                    repeat wait()
                        pcall(task.spawn,Use_Remote,"SetLastSpawnPoint",nearest.Name)
                    until Local_Player.Data.LastSpawnPoint.Value == nearest.Name
                    pcall(function()
                        Local_Player.Character.Humanoid:ChangeState(15)
                    end)
                    repeat wait(.1) until Local_Player.Character.HumanoidRootPart.Parent
                end
            end
        end
        if tweenActive and lastTweenTarget and (dist(target, lastTweenTarget) < 10 or dist(lastTweenTarget) >= 10) then
            return
        end
        tweenid = (tweenid or 0) + 1 
        lastTweenTarget = target
        local Char = Local_Player.Character
        local Root = Char.HumanoidRootPart
        thisId = tweenid
        Util = require(game:GetService("ReplicatedStorage").Util)
        if Util.FPSTracker.FPS > 60 then
            setfpscap(60)
        end
        task.spawn(pcall,function()
            lastPos = {tick(),target}
            local currentDistance = dist(Root.Position, target, true)
            local oldDistance = currentDistance
            Char.Humanoid:SetStateEnabled(13,false)
            while Root and currentDistance > 75 and thisId == tweenid and Char.Humanoid.Health > 0 do
                local Percent = (58/math.clamp(Util.FPSTracker.FPS,0,60))
                local Speed = 6*Percent
                local Current = Root.Position
                local Dift = Vector3.new(target.X,0,target.Z) - Vector3.new(Current.X,0,Current.Z)
                local Sx =  (Dift.X < 0 and -1 or 1)*Speed
                local Sz =  (Dift.Z < 0 and -1 or 1)*Speed
                local SpeedX = math.abs(Dift.X) < Sx and Dift.X or Sx
                local SpeedZ = math.abs(Dift.Z) < Sz and Dift.Z or Sz
                task.spawn(function()
                    currentDistance = dist(Root.Position, target, true)
                    if currentDistance > oldDistance+10 then
                        tweenid = -1
                        tweenPause = true
                        Root.Anchored = true
                        wait(1)
                        tweenPause = false
                        Root.Anchored = false
                    end
                    oldDistance = currentDistance
                end)
                Root.CFrame = Root.CFrame + Vector3.new(math.abs(SpeedZ) < (5*Percent) and SpeedX or SpeedX/1.5, 0, math.abs(SpeedX) < (5*Percent) and SpeedZ or SpeedZ/1.5)
                Root.CFrame = CFrame.new(Root.CFrame.X,target.Y,Root.CFrame.Z)
                tweenActive = true
                task.wait(0.001)
            end
            Char.Humanoid:SetStateEnabled(13,true)
            tweenActive = false
            if currentDistance <= 100 and thisId == tweenid then
                Root.CFrame = target
            end
        end)
    end)
end

TP(CFrame.new(-12462, 375, -7552))
