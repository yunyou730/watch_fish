
print("watchfish launched! This is main")

function GameUpdate(delta_time)
    if g_game ~= nil then
        g_game:OnUpdate(delta_time)
    end
end

require "core.core"
require "game.game_enum"
require "game.game_const"
require "game.game"

g_game = CGame.new()
g_game:Init()

require "game.command.command_start_login_workflow"

g_game.event:Dispatch(EGameEvent.START_LOGIN_WORKFLOW)


