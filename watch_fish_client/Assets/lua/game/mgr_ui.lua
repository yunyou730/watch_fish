require "game.view.view_include"

---@class CMgrUI
CMgrUI = Core.declare_class()

function CMgrUI:ctor()
    self._menu_stack                = {}
    self._popup_stack               = {}
    self._menu_type_map             = {}
end

function CMgrUI:_RegisterMenu()
    self._menu_type_map[EMenuType.LOGIN]    = CMenuLogin.new()
    self._menu_type_map[EMenuType.HOME]     = CMenuHome.new()
end

---ShowMenu
---@param menu_type EMenuType
---@param enter_arg table
function CMgrUI:ShowMenu(menu_type,enter_arg)
    
end

---CloseMenu
---@param menu_type EMenuType
function CMgrUI:CloseMenu(menu_type)

end

function CMgrUI:ShowPopup()

end

function CMgrUI:ClosePopup()

end

