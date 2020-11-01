
CWorld = Core.declare_class()

function CWorld:ctor()
    self._elapsed               = 0
    self._gen_entity_id_seed    = 0
    self._frame_index           = 0

    self._entity_map            = {}
    self._system_array          = {}
    self._group                 = {}
end

function CWorld:Init(init_param)
    self._frame_index           = 0
    self._gen_entity_id_seed    = 0

    self.singleton_enter_arg    = CSingletonEnterArg.new(self,init_param)
    self.singleton_map          = CSingletonMap.new(50,30,nil)
    self.singleton_unit_spawn   = CSingletonUnitSpawn.new()
    self.singelton_gfx          = CSingletonGFX.new()
    
    self:AddSystem(CSystemInitialize.new(self))
    self:AddSystem(CSystemUnitSpawn.new(self))
    self:AddSystem(CSystemGfxGround.new(self))    
    self:AddSystem(CSystemGfxUnit.new(self))
end

function CWorld:Update(dt)
    self._elapsed = self._elapsed + dt
    while self._elapsed > gameplay_const.kFrameDuration do
        self._elapsed = self._elapsed - gameplay_const.kFrameDuration
        self:_Tick()
    end
end

function CWorld:_Tick()
    self._frame_index = self._frame_index + 1
    for i,sys in ipairs(self._system_array) do
        sys:Tick()
    end
end

function CWorld:AddEntity(entity)
    self._gen_entity_id_seed                    = self._gen_entity_id_seed + 1
    self._entity_map[self._gen_entity_id_seed]  = entity
end

function CWorld:AddSystem(system)
    table.insert(self._system_array,system)
end

function CWorld:GetFrame()
    return self._frame_index
end
