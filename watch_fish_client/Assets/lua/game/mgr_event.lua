---@class CMgrEvent
CMgrEvent = Core.declare_class()

function CMgrEvent:ctor()
    self._gen_id            = 0
    self._event_call_map    = {}
    self._listeners_map     = {}
end

---Register
---@param evt EGameEvent
function CMgrEvent:Register(evt,caller,func)
    local _listener = self:_GenListener(evt,caller,func)
    self._listeners_map[_listener.id]       = _listener
    self._event_call_map[evt]               = self._event_call_map[evt] or {}
    self._event_call_map[evt][_listener.id] = true
    return _listener.id
end

-- function CMgrEvent:UnRegister(listener_id)
--     local _listener = self._listeners_map[listener_id]
--     if _listener ~= nil then
--         local _evt = _listener.evt
--         self._event_call_map[evt][listener_id]  = nil
--         self._listeners_map[listener_id]        = nil
--     end
-- end

function CMgrEvent:UnRegister(evt,caller,func)
    if self._event_call_map ~= nil and self._event_call_map[evt] ~= nil then
        local _to_remove_listener_id = nil
        for listener_id,_ in pairs(self._event_call_map[evt]) do
            local _check_listener = self._listeners_map[listener_id]
            if _check_listener ~= nil and _check_listener.caller == caller and _check_listener.func == func then
                _to_remove_listener_id = listener_id
                break
            end
        end
        if _to_remove_listener_id ~= nil then
            self._listeners_map[_to_remove_listener_id] = nil
            self._event_call_map[evt][_to_remove_listener_id]  = nil
        end
    end
end

function CMgrEvent:Dispatch(evt,...)
    if self._event_call_map ~=  nil and self._event_call_map[evt] ~= nil then
        for listener_id,_ in pairs(self._event_call_map[evt]) do
            local _listener = self._listeners_map[listener_id]
            assert(_listener ~= nil)
            if _listener.caller ~= nil then
                _listener.func(_listener.caller,...)
            else
                _listener.func(...)
            end
        end
    end
end

function CMgrEvent:_GenListener(evt,caller,func)
    self._gen_id = self._gen_id + 1
    local _listener     = {}
    _listener.id        = self._gen_id
    _listener.evt       = evt
    _listener.caller    = caller
    _listener.func      = func
    -- _listener.disposed  = false
    return _listener
end
