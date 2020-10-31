---@class CSystemInitialize
CSystemInitialize = Core.declare_class(CSystemBase)

function CSystemInitialize:ctor(world)
    -- self._map               = world.singleton_map
    -- self._spawn             = world.singleton_unit_spawn
end

function CSystemInitialize:Tick()
    if self._world:GetFrame() == 0 then
        
    end
end
