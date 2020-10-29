require "game.gameplay.gameplay_include"

g_game.event:Register(EGameEvent.ENTER_HOME,nil,function()
    local _gameplay = CGameplay.new();
    _gameplay:Start()
end)
