
CMgrTimer = Core.declare_class()

function CMgrTimer:ctor()
    self._gen_id                = 0
    self._frame_timers          = {}
    self._time_timers           = {}
end

function CMgrTimer:FrameOnce(delay,caller,func,...)
    local _new_timer = self:_GenTimer(false,delay,caller,func,...)
    self._frame_handles[_new_timer.id] = _new_timer
end

function CMgrTimer:FrameLoop(delay,caller,func,...)
    local _new_timer = self:_GenTimer(true,delay,caller,func,...)
    self._frame_handles[_new_timer.id] = _new_timer
end

function CMgrTimer:Once(delay,caller,func,...)
    local _new_timer = self:_GenTimer(false,delay,caller,func,...)
    self._time_timers[_new_timer.id] = _new_timer
end

function CMgrTimer:Loop(delay,caller,func,...)
    local _new_timer = self:_GenTimer(true,delay,caller,func,...)
    self._time_timers[_new_timer.id] = _new_timer
end

function CMgrTimer:Clear(timer)
    if self._frame_handles[timer.id] ~= nil then
        self._frame_handles[timer.id] = nil
    end
    if self._time_timers[timer.id] ~= nil then
        self._time_timers[timer.id] = nil
    end
end

function CMgrTimer:_GenTimer(is_loop,delay,caller,func,...)
    self._gen_id        = self._gen_id + 1
    local _timer        = {}
    _timer.id           = self._gen_id
    _timer.caller       = caller
    _timer.func         = func
    _timer.is_loop      = is_loop
    _timer.delay        = delay
    _timer.elapsed      = 0
    _timer.disposed     = false
    return _timer
end

function CMgrTimer:OnUpdate(delta_time)
    self:_UpdateTimers(self._frame_timers,1)
    self:_UpdateTimers(self._time_timers,delta_time)
end

function CMgrTimer:_UpdateTimers(timers_map,delta)
    local _to_delete = nil
    for id,timer in pairs(timers_map) do
        if not timer.disposed then
            timer.elapsed = timer.elapsed + delta
            if timer.elapsed >= timer.delay then
                if timer.caller ~= nil then
                    timer.func(timer.caller,table.unpack(timer.args))
                else
                    timer.func(table.unpack(timer.args))
                end
                if timer.is_loop then
                    timer.elapsed = timer.elapsed - timer.delay
                else
                    timer.disposed = true
                end
            end
        else
            if _to_delete == nil then
                _to_delete = {}
            end
            table.insert(_to_delete,timer.id)
        end
    end
    if _to_delete ~= nil then
        for i,timer_id in ipairs(_to_delete) do
            timers_map[timer_id] = nil
        end
    end
end
