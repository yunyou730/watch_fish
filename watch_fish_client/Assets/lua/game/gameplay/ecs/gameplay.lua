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
    self._world:Init()
    g_game.timer:FrameLoop(1,self,self._Update)
end

function CGameplay:_Update()
    local _dt = g_game.timer:DeltaTime()
    self._world:Update(_dt)
end
