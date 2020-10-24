---@class CMenuLogin
CMenuLogin = Core.declare_class(CMenuBase)

function CMenuLogin:ctor()
    self._prefab_path = "menu/menu_login.prefab"
end

function CMenuLogin:dtor()

end

function CMenuLogin:EnterWithArg(enter_arg)
    self.__super.EnterWithArg(enter_arg)
end
