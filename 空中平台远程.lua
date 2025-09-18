local hidingPlace
local atHidingPlace = false
local originalPosition

local function createHidingPlace()
    if workspace:FindFirstChild("空中平台") then return workspace:FindFirstChild("空中平台") end
    local baseplate = Instance.new("Part")
    baseplate.Name = "空中平台"
    baseplate.Size = Vector3.new(7500, 1, 7500)
    baseplate.Position = Vector3.new(0, 700, 0)
    baseplate.Anchored = true
    baseplate.CanCollide = true
    baseplate.Material = Enum.Material.Metal
    baseplate.Parent = workspace
    
    local houseSpacing = 60
    for i = 1, 5 do
        local house = Instance.new("Part")
        house.Size = Vector3.new(20, 20, 20)
        house.Position = baseplate.Position + Vector3.new(-250 + i * houseSpacing, 10, -250)
        house.Anchored = true
        house.BrickColor = BrickColor.new("Light orange")
        house.Material = Enum.Material.Brick
        house.Parent = baseplate

        for j = -1, 1, 2 do
            local window = Instance.new("Part")
            window.Size = Vector3.new(4, 6, 0.5)
            window.Position = house.Position + Vector3.new(j * 7, 5, -1)
            window.Anchored = true
            window.BrickColor = BrickColor.new("Institutional white")
            window.Material = Enum.Material.Glass
            window.Transparency = 0.5
            window.Parent = baseplate
        end

        local door = Instance.new("Part")
        door.Size = Vector3.new(4, 10, 0.5)
        door.Position = house.Position + Vector3.new(0, 5, -1)
        door.Anchored = true
        door.BrickColor = BrickColor.new("Brown")
        door.Material = Enum.Material.Wood
        door.Parent = baseplate

        local bed = Instance.new("Part")
        bed.Size = Vector3.new(8, 2, 4)
        bed.Position = house.Position + Vector3.new(0, 1, -1)
        bed.Anchored = true
        bed.BrickColor = BrickColor.new("Really red")
        bed.Parent = baseplate
        local table = Instance.new("Part")
        table.Size = Vector3.new(4, 1, 4)
        table.Position = house.Position + Vector3.new(0, 1, 5)
        table.Anchored = true
        table.BrickColor = BrickColor.new("Brown")
        table.Parent = baseplate
        local chair = Instance.new("Part")
        chair.Size = Vector3.new(2, 2, 2)
        chair.Position = house.Position + Vector3.new(3, 1, 5)
        chair.Anchored = true
        chair.BrickColor = BrickColor.new("Reddish brown")
        chair.Parent = baseplate
    end

    local towerSpacing = 100
    for i = 1, 3 do
        local tower = Instance.new("Part")
        tower.Size = Vector3.new(20, 100, 20)
        tower.Position = baseplate.Position + Vector3.new(-250 + i * towerSpacing, 50, 200)
        tower.Anchored = true
        tower.BrickColor = BrickColor.new("Institutional white")
        tower.Material = Enum.Material.Concrete
        tower.Parent = baseplate

        for y = 10, 90, 20 do
            local window = Instance.new("Part")
            window.Size = Vector3.new(8, 8, 0.5)
            window.Position = tower.Position + Vector3.new(0, y, -10)
            window.Anchored = true
            window.BrickColor = BrickColor.new("Institutional white")
            window.Material = Enum.Material.Glass
            window.Transparency = 0.5
            window.Parent = baseplate
        end
    end

    local road = Instance.new("Part")
    road.Size = Vector3.new(10, 1, 300)
    road.Position = baseplate.Position + Vector3.new(0, 0.5, -250)
    road.Anchored = true
    road.BrickColor = BrickColor.new("Really black")
    road.Material = Enum.Material.Asphalt
    road.Parent = baseplate

    for i = 1, 15 do
        local trunk = Instance.new("Part")
        trunk.Size = Vector3.new(5, 20, 5)
        trunk.Position = baseplate.Position + Vector3.new(math.random(-400, 400), 10, math.random(-400, 400))
        trunk.Anchored = true
        trunk.BrickColor = BrickColor.new("Reddish brown")
        trunk.Material = Enum.Material.Wood
        trunk.Parent = baseplate
        local leaves = Instance.new("Part")
        leaves.Size = Vector3.new(12, 10, 12)
        leaves.Position = trunk.Position + Vector3.new(0, 15, 0)
        leaves.Anchored = true
        leaves.BrickColor = BrickColor.new("Bright green")
        leaves.Material = Enum.Material.Grass
        leaves.Parent = baseplate
    end

    for i = 1, 20 do
        local grassPatch = Instance.new("Part")
        grassPatch.Size = Vector3.new(math.random(10, 20), 1, math.random(10, 20))
        grassPatch.Position = baseplate.Position + Vector3.new(math.random(-700, 700), 0.5, math.random(-700, 700))
        grassPatch.Anchored = true
        grassPatch.BrickColor = BrickColor.new("Bright green")
        grassPatch.Material = Enum.Material.Grass
        grassPatch.Parent = baseplate
    end

    for i = 1, 100 do
        local raindrop = Instance.new("Part")
        raindrop.Size = Vector3.new(0.2, 1, 0.2)
        raindrop.Position = baseplate.Position + Vector3.new(math.random(-700, 700), math.random(20, 100), math.random(-700, 700))
        raindrop.Anchored = false
        raindrop.CanCollide = false
        raindrop.BrickColor = BrickColor.new("Really blue")
        raindrop.Material = Enum.Material.SmoothPlastic
        raindrop.Velocity = Vector3.new(0, -50, 0)
        raindrop.Parent = baseplate
    end

    for i = 1, 5 do
        local bench = Instance.new("Part")
        bench.Size = Vector3.new(5, 1, 2)
        bench.Position = baseplate.Position + Vector3.new(math.random(-700, 700), 1, math.random(-700, 700))
        bench.Anchored = true
        bench.BrickColor = BrickColor.new("Reddish brown")
        bench.Material = Enum.Material.Wood
        bench.Parent = baseplate
        local lightPole = Instance.new("Part")
        lightPole.Size = Vector3.new(1, 15, 1)
        lightPole.Position = bench.Position + Vector3.new(2, 7.5, 0)
        lightPole.Anchored = true
        lightPole.BrickColor = BrickColor.new("Dark stone grey")
        lightPole.Material = Enum.Material.Metal
        lightPole.Parent = baseplate
        local light = Instance.new("PointLight")
        light.Color = Color3.fromRGB(255, 255, 224)
        light.Brightness = 2
        light.Range = 20
        light.Parent = lightPole
    end

    return baseplate
end

local function teleportToHidingPlace()
    if not hidingPlace then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "错误";
            Text = "平台未创建";
            Icon = "rbxthumb://type=Asset&id=120611289434746&w=150&h=150"})
            Duration = 5;
            local audioId = 3398620867  local sound = Instance.new("Sound")  sound.SoundId = "rbxassetid://" .. audioId  sound.Volume = 3  sound.Pitch = 3   sound.Parent = game.Workspace  sound:Play()
        return
    end
    if not atHidingPlace then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        originalPosition = character.HumanoidRootPart.Position
        local hidingPlacePosition = CFrame.new(hidingPlace.Position) * CFrame.new(0, 5, 0)
        character.HumanoidRootPart.CFrame = hidingPlacePosition
        atHidingPlace = true
    end
end

local function returnToOriginalPosition()
    if atHidingPlace then
        local player = game.Players.LocalPlayer
        local character = player.Character
        character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
        atHidingPlace = false
    end
end

_G.SkyPlatform = {
    Create = function()
        if not workspace:FindFirstChild("空中平台") then
            hidingPlace = createHidingPlace()
        end
    end,
    Destroy = function()
        local p = workspace:FindFirstChild("空中平台")
        if p then p:Destroy() end
        hidingPlace = nil
        atHidingPlace = false
        originalPosition = nil
    end,
    Teleport = function()
        teleportToHidingPlace()
    end,
    Back = function()
        returnToOriginalPosition()
    end
}