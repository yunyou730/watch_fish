
CGameplay = Core.declare_class()

function CGameplay:ctor()
    self._frame_timer   = nil
end

function CGameplay:dtor()
    if self._frame_timer ~= nil then
        g_game.timer:Clear(self._frame_timer)
        self._frame_timer = nil
    end
end

function CGameplay:Start()
    g_game.timer:FrameLoop(1,self,self._Update)
end

function CGameplay:_Update()
    local _dt = g_game.timer:DeltaTime()
end
