---@class CMenuBase
CMenuBase =  Core.declare_class()

function CMenuBase:ctor()
    self._prefab_path   = nil
    self._is_open       = false
end

function CMenuBase:dtor()

end

function CMenuBase:EnterWithArg(enter_arg)
    self._is_open = true
end

function CMenuBase:Exit()
    self._is_open = false
end

function CMenuBase:IsOpen()
    return self._is_open
end
