
g_game.event:Register(EGameEvent.ENTER_HOME,nil,function()
    g_game.event:Dispatch(EGameEvent.SHOW_MENU,EMenuType.HOME)
end)
