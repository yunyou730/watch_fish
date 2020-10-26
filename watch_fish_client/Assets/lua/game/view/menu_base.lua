---@class CMenuBase
CMenuBase =  Core.declare_class()

function CMenuBase:ctor()
    self._prefab_path   = nil
    self._is_open       = false
    self._root_go       = nil
end

function CMenuBase:dtor()

end

function CMenuBase:EnterWithArg(enter_arg)
    self._is_open = true
    local _prefab = CS.watchfish.ResLoaderExt.LoadPrefab(self._prefab_path)
    self._root_go = CS.UnityEngine.GameObject.Instantiate(_prefab)
end

function CMenuBase:Exit()
    self._is_open = false
    CS.UnityEngine.GameObject.Destroy(self._root_go)
    self._root_go = nil
end

function CMenuBase:IsOpen()
    return self._is_open
end
