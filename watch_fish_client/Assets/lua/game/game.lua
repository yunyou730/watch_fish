require "game.mgr_timer"
require "game.mgr_event"
require "game.mgr_ui"

CGame = Core.declare_class()

function CGame:ctor()
    self._current_state     =   EGameState.NONE
    
    self._mgrs              = {}
    self._mgrs_need_update  = {}

    self:_RegisterManagers()
end

function CGame:_RegisterManagers()
    self.timer          = self:_AddManager(CMgrTimer.new())
    self.ui             = self:_AddManager(CMgrUI.new())
end

function CGame:_AddManager(mgr)
    table.insert(self._mgrs,mgr)
    if mgr.OnUpdate ~= nil then
        table.insert(self._mgrs_need_update,mgr)
    end
    return mgr
end

function CGame:OnUpdate(delta_time)
    for i,mgr in ipairs(self._mgrs_need_update) do
        mgr:OnUpdate(delta_time)
    end
end
