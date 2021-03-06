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
    g_game.event:Register(EGameEvent.CLOSE_MENU,self,self.CloseMenu)
end

function CMgrUI:_UnMapEvent()
    g_game.event:UnRegister(EGameEvent.SHOW_MENU,self,self.ShowMenu)
    g_game.event:UnRegister(EGameEvent.CLOSE_MENU,self,self.CloseMenu)
end

---ShowMenu
---@param menu_type EMenuType
---@param enter_arg table
function CMgrUI:ShowMenu(menu_type,enter_arg)
    local _menu_instance = self._menu_type_map[menu_type]
    if _menu_instance ~= nil and not _menu_instance:IsOpen() then
        _menu_instance:EnterWithArg(enter_arg)
    end
end

---CloseMenu
---@param menu_type EMenuType
function CMgrUI:CloseMenu(menu_type)
    local _menu_instance = self._menu_type_map[menu_type]
    if _menu_instance ~= nil and _menu_instance:IsOpen() then
        _menu_instance:Exit()
    end
end

function CMgrUI:ShowPopup()

end

function CMgrUI:ClosePopup()

end

