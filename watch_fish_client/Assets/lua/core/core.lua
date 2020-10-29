
Core = {}

function Core.declare_class(super_class)
    local _class = {}
    if super_class ~= nil then
        setmetatable(_class,{__index = super_class})
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

local function dump(value, desciption,nesting)
    if type(nesting) ~= "number" then nesting = 6 end

    print("dump from:" .. debug.traceback());

    local lookupTable = {}
    local result = {}
    local function _v(v)
        if type(v) == "string" then
            v = "\"" .. v .. "\""
        end
        return tostring(v)
    end

    local function _dump(value, desciption, indent, nest, keylen)
        desciption = desciption or "<var>"
        spc = ""
        if type(keylen) == "number" then
            spc = string.rep(" ", keylen - string.len(_v(desciption)))
        end
        if type(value) ~= "table" then
            result[#result +1 ] = string.format("%s%s%s = %s", indent, _v(desciption), spc, _v(value))
        elseif lookupTable[value] then
            result[#result +1 ] = string.format("%s%s%s = *REF*", indent, desciption, spc)
        else
            lookupTable[value] = true
            if nest > nesting then
                result[#result +1 ] = string.format("%s%s = *MAX NESTING*", indent, desciption)
            else
                result[#result +1 ] = string.format("%s%s = {", indent, _v(desciption))
                local indent2 = indent.."    "
                local keys = {}
                local keylen = 0
                local values = {}
                for k, v in pairs(value) do
                    keys[#keys + 1] = k
                    local vk = _v(k)
                    local vkl = string.len(vk)
                    if vkl > keylen then keylen = vkl end
                    values[k] = v
                end
                table.sort(keys, function(a, b)
                    if type(a) == "number" and type(b) == "number" then
                        return a < b
                    else
                        return tostring(a) < tostring(b)
                    end
                end)
                for i, k in ipairs(keys) do
                    _dump(values[k], k, indent2, nest + 1, keylen)
                end
                result[#result +1] = string.format("%s}", indent)
            end
        end
    end
    _dump(value, desciption, " -", 1)
    for i, line in ipairs(result) do
        print(line)
    end
end

Core.dump = dump
