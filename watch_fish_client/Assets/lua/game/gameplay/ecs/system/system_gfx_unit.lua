---@class CSystemGfxUnit
CSystemGfxUnit = Core.declare_class(CSystemBase)

function CSystemGfxUnit:ctor(world)
    self._gfx   = world.singleton_gfx
end

function CSystemGfxUnit:Tick()
    self:_HandleCreate()
end

local _create_func_map = {
    [EUnitType.TANK] = function(row,col)
        -- @miao @todo

        local _x,_y = gp_utils.GetCoordPosWithAnchorType(5,3,ETileAnchorType.RIGHT_TOP)
        _go.transform.position = CS.UnityEngine.Vector3(_x,0,_y)
    end
}

function CSystemGfxUnit:_HandleCreate()
    if self._gfx.spawn_data_list ~= nil then
        for i,v in ipairs(self._gfx.spawn_data_list) do
            if _create_func_map[v.unit_type] ~= nil then
                _create_func_map[v.unit_type](v.row,v.col)
            end
        end
        self._gfx.spawn_data_list = nil
    end
end
