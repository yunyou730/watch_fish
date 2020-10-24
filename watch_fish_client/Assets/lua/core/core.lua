
Core = {}

function Core.declare_class(super_class)
    local _class = {}
    if super_class ~= nil then
        setmetatable(_class,{_index = super_class})
        _class.__super = super_class
    end

    function _class.construct(new_obj,...)
        local _tbl_ctor = {}
        local _cur_class = _class
        while _cur_class ~= nil do
            local _ctor = rawget(_cur_class,"ctor")            
            if _ctor ~= nil then
                table.insert(_tbl_ctor,1,_ctor)
            end
            _cur_class = rawget(_cur_class,"__super")
        end
        for i,v in ipairs(_tbl_ctor) do
            v(new_obj,...)
        end
    end

    function _class.new(...)
        local _obj = {}
        setmetatable(_obj,{__index = _class})
        _class.construct(_obj,...)
        return _obj
    end

    return _class
end

function Core.delete(obj)
    local _class = getmetatable(obj).__index
    while _class do
        local _dtor = rawget(_class,"dtor")
        if _dtor ~= nil then
            _dtor(obj)
        end
        _class = _class.__super
    end
end


