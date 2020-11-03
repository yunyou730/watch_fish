---@class CSystemUnitSpawn
CSystemUnitSpawn = Core.declare_class(CSystemBase)

function CSystemUnitSpawn:ctor(world)
    self._map               = world.singleton_map
    self._spawn             = world.singleton_unit_spawn
    self._gfx               = world.singleton_gfx
end

function CSystemUnitSpawn:Tick()
    if self._spawn.spawn_list ~= nil then
        for i,v in ipairs(self._spawn.spawn_list) do
            self:_HandleCreateUnit(v.unit_type,v.row,v.col)
        end
        self._spawn.spawn_list = nil
    end
end

local _unit_spawn_func_map = {
    [EUnitType.TANK] = function(row,col)
        local _entity = self._world:CreatEntity()
        
        -- self._gfx:AddData(EUnitType.TANK,row,col)
    end
}

function CSystemUnitSpawn:_HandleCreateUnit(unit_type,row,col)
    if _unit_spawn_func_map[unit_type] ~= nil then
        _unit_spawn_func_map[unit_type](row,col)
    end
end
