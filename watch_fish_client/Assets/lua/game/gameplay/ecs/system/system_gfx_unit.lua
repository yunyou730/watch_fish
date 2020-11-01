---@class CSystemGfxUnit
CSystemGfxUnit = Core.declare_class(CSystemBase)

function CSystemGfxUnit:ctor(world)
    self._gfx   = world.singleton_gfx
end

function CSystemGfxUnit:Tick()
    self:_HandleCreate()
end

function CSystemGfxUnit:_HandleCreate()
    if self._gfx.spawn_data_list ~= nil then
        for i,v in ipairs(self._gfx.spawn_data_list) do
            
        end
        self._gfx.spawn_data_list = nil
    end
end
