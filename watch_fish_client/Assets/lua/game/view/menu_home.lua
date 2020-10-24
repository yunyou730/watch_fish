
CMenuHome = Core.declare_class(CMenuBase)

function CMenuHome:ctor()
    self._prefab_path = "menu/menu_home.prefab"
end

function CMenuHome:dtor()
    
end

function CMenuHome:EnterWithArg(enter_arg)
    self.__super.EnterWithArg(enter_arg)
end
