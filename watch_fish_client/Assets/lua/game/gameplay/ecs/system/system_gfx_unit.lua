---@class CSystemGfxUnit
CSystemGfxUnit = Core.declare_class(CSystemBase)

function CSystemGfxUnit:ctor(world)
    self._gfx           = world.singleton_gfx

    self._gen_id        = 0
    --self._unit_hash     = {}
end

function CSystemGfxUnit:Tick()
    self:_HandleCreate()
end

local _create_func_map = {
    [EUnitType.TANK] = function(row,col)
        -- local _x,_y = gp_utils.GetCoordPosWithAnchorType(5,3,ETileAnchorType.RIGHT_TOP)
        -- _go.transform.position = CS.UnityEngine.Vector3(_x,0,_y)
        
        local tank = CUnitTank.new(1)
        tank:SetCoord(10,5)
        tank:Create()

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
