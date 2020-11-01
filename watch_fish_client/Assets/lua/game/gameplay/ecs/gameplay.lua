---@class CGameplay
CGameplay = Core.declare_class()

function CGameplay:ctor()
    self._frame_timer   = nil
    ---@type CWorld
    self._world         = nil
end

function CGameplay:dtor()
    if self._frame_timer ~= nil then
        g_game.timer:Clear(self._frame_timer)
        self._frame_timer = nil
    end
    if self._world ~= nil then
        Core.delete(self._world)
        self._world = nil
    end
end

function CGameplay:Start()
    self._world = CWorld.new()
    self._world:Init({
        rows_cnt = 50,
        cols_cnt = 40,
        
        spawn_row = 3,
        spawn_col = 4,
    })
    g_game.timer:FrameLoop(1,self,self._Update)
end

function CGameplay:_Update()
    local _dt = g_game.timer:DeltaTime()
    self._world:Update(_dt)
end
