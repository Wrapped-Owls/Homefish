local Seaweed = require "models.actors.Seaweed"
local EntityController = {}

EntityController.__index = EntityController

function EntityController:new()
    local this = {
        entities = {}
    }

    return setmetatable(this, EntityController)
end

function EntityController:createAnimation()
    return gameDirector:configureSpriteSheet("Seaweed.json", "assets/sprites/seaweed/", true, 0.1, 1, 1, true)
end

function EntityController:generateEntities(world)
    local x, y = 40, 640
    for count = 1, 20 do
        table.insert(self.entities, Seaweed:new(self:createAnimation(), world, x, y))
        x = x + 80
    end
end

function EntityController:getEntityByFixture(fixture)
    for _, entity in pairs(self.entities) do
        if entity:compareFixture(fixture) then
            return entity
        end
    end
    return nil
end

function EntityController:draw()
    for _, entity in pairs(self.entities) do
        entity:draw()
    end
end

return EntityController