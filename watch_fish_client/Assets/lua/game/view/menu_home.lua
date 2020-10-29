
CMenuHome = Core.declare_class(CMenuBase)

function CMenuHome:ctor()
    self._prefab_path = "menu/menu_home.prefab"
    self._menu_type             = EMenuType.HOME
end

function CMenuHome:dtor()
    
end

function CMenuHome:EnterWithArg(enter_arg)
    self.__super.EnterWithArg(self,enter_arg)
    
    self._btn_start     = self:RootGO().transform:Find("btn_start").gameObject:GetComponent("Button")
    self._btn_start.onClick:AddListener(function()
        self:_OnClickStart()
    end)
end

function CMenuHome:_OnClickStart()
    g_game.event:Dispatch(EGameEvent.ENTER_BATTLE)
    g_game.event:Dispatch(EGameEvent.CLOSE_MENU,self._menu_type)
end
