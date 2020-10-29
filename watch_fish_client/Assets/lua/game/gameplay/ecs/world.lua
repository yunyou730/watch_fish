
CWorld = Core.declare_class()

function CWorld:ctor()
    self._elapsed               = 0
    self._gen_entity_id_seed    = 0

    self._entity_map            = {}
    self._system_array          = {}
    self._singleton_map         = {}
    self._group                 = {}
end

function CWorld:Init()

end

function CWorld:Update(dt)
    self._elapsed = self._elapsed + dt
    while self._elapsed > gameplay_const.kFrameDuration do
        self._elapsed = self._elapsed - gameplay_const.kFrameDuration
        self:_Tick()
    end
end

function CWorld:_Tick()
    for i,sys in ipairs(self._system_array) do
        sys:Tick()
    end
end

function CWorld:AddEntity(entity)

end

function CWorld:AddSystem(system)
    table.insert(self._system_array,system)
end

function CWorld:AddSingleton(singleton)
    
end
