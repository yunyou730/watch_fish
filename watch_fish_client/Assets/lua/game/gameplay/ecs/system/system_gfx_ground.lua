---@class CSystemGfxGround
CSystemGfxGround = Core.declare_class(CSystemBase)

function CSystemGfxGround:ctor(world)
    self._map               = world.singleton_map
    self._ground_object     = nil
end

function CSystemGfxGround:Tick()
    self:_HandleCreateGround()
end

function CSystemGfxGround:_HandleCreateGround()
    if self._map.shall_create_ground_object then
        self._map.shall_create_ground_object = false
        _ground_object = CGOGround.new()
        _ground_object:Create(self._map.rows_cnt,self._map.cols_cnt,nil)
    end
end
