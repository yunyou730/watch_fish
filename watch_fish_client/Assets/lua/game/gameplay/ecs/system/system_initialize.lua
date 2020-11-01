---@class CSystemInitialize
CSystemInitialize = Core.declare_class(CSystemBase)

function CSystemInitialize:ctor(world)
    -- self._map               = world.singleton_map
    self._enter_arg = world.singleton_enter_arg
    self._spawn     = world.singleton_unit_spawn    
end

function CSystemInitialize:Tick()
    if self._world:GetFrame() == 0 then
        self:_DoInit()
    end
end

function CSystemInitialize:_DoInit()
    gp_utils.CreateTank(self._spawn,self._enter_arg.spawn_row,self._enter_arg.spawn_col)
end
