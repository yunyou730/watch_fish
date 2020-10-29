---@class CEntity
CEntity = Core.declare_class()

function CEntity:ctor(id)
    self._id        = id
    self._mask      = 0
end
