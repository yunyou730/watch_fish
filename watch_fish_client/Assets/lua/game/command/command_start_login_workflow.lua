
g_game.event:Register(EGameEvent.START_LOGIN_WORKFLOW,nil,function()
    g_game.event:Dispatch(EGameEvent.SHOW_MENU,EMenuType.LOGIN)
end)
