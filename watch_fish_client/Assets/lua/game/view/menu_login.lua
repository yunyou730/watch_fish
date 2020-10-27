---@class CMenuLogin
CMenuLogin = Core.declare_class(CMenuBase)

function CMenuLogin:ctor()
    self._prefab_path           = "menu/menu_login.prefab"
    self._menu_type             = EMenuType.LOGIN
    self._btn_login             = nil
    self._text_username         = nil
    self._text_password         = nil
    self._input_username        = nil
    self._input_password        = nil
end

function CMenuLogin:dtor()

end

function CMenuLogin:EnterWithArg(enter_arg)
    self.__super.EnterWithArg(self,enter_arg)

    self._text_username = self:RootGO().transform:Find("txt_user_name").gameObject:GetComponent("Text")
    self._text_password = self:RootGO().transform:Find("txt_password").gameObject:GetComponent("Text")
    self._btn_login     = self:RootGO().transform:Find("btn_login").gameObject:GetComponent("Button")
    self._input_username = self:RootGO().transform:Find("input_field_username"):Find("Text").gameObject:GetComponent("Text")
    self._input_password = self:RootGO().transform:Find("input_field_password"):Find("Text").gameObject:GetComponent("Text")

    self._text_username.text    = "username"
    self._text_password.text    = "password"
    self._btn_login.onClick:AddListener(function()
        self:_OnClickLogin()
    end)
end

function CMenuLogin:_OnClickLogin()
    local _input_username = self._input_username.text
    local _input_password = self._input_password.text
    print("[username] " .. self._input_username.text .. " [pwd] " .. _input_password)
    local _is_login_success = true
    if _is_login_success then
        g_game.event:Dispatch(EGameEvent.ENTER_HOME)
        g_game.event:Dispatch(EGameEvent.CLOSE_MENU,self._menu_type)
    end
end
