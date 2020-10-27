---@class CMenuLogin
CMenuLogin = Core.declare_class(CMenuBase)

function CMenuLogin:ctor()
    self._prefab_path           = "menu/menu_login.prefab"
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

    self._text_username = self:RootGO().transform:Find("txt_user_name")
    self._text_username.gameObject:GetComponent("Text").text = "username"
end
