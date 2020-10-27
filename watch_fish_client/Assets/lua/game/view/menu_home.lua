
CMenuHome = Core.declare_class(CMenuBase)

function CMenuHome:ctor()
    self._prefab_path = "menu/menu_home.prefab"
    self._menu_type             = EMenuType.HOME
end

function CMenuHome:dtor()
    
end

function CMenuHome:EnterWithArg(enter_arg)
    self.__super.EnterWithArg(self,enter_arg)
end
