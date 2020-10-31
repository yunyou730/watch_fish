---@class CSystemUnitSpawn
CSystemUnitSpawn = Core.declare_class(CSystemBase)

function CSystemUnitSpawn:ctor(world)
    self._map               = world.singleton_map
    self._spawn             = world.singleton_unit_spawn
end

function CSystemUnitSpawn:Tick()
    if self._spawn.spawn_list ~= nil then
        for i,v in ipairs(self._spawn.spawn_list) do
            self:_HandleCreateUnit(v.unit_type,v.row,v.col)
        end
    end
end

function CSystemUnitSpawn:_HandleCreateUnit(unity_type,row,col)
    
end
