require "game.view.view_include"

---@class CMgrUI
CMgrUI = Core.declare_class()

function CMgrUI:ctor()
    self._menu_stack                = {}
    self._popup_stack               = {}
    self._menu_type_map             = {}
end

function CMgrUI:dtor()
    self:_UnMapEvent()
end

function CMgrUI:Init()
    self:_RegisterMenu()
    self:_MapEvent()
end

function CMgrUI:_RegisterMenu()
    self._menu_type_map[EMenuType.LOGIN]    = CMenuLogin.new()
    self._menu_type_map[EMenuType.HOME]     = CMenuHome.new()
end

function CMgrUI:_MapEvent()
    g_game.event:Register(EGameEvent.SHOW_MENU,self,self.ShowMenu)
end

function CMgrUI:_UnMapEvent()
    g_game.event:UnRegister(EGameEvent.SHOW_MENU,self,self.ShowMenu)
end

---ShowMenu
---@param menu_type EMenuType
---@param enter_arg table
function CMgrUI:ShowMenu(menu_type,enter_arg)
    print("[CMgrUI:ShowMenu]")
end

---CloseMenu
---@param menu_type EMenuType
function CMgrUI:CloseMenu(menu_type)
    print("[CMgrUI:CloseMenu]")
end

function CMgrUI:ShowPopup()

end

function CMgrUI:ClosePopup()

end

