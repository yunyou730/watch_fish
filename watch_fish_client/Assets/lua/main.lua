print("xxx")

local util = require 'xlua.util'
require "module.enter"

print("This is main.lua")

function Start()
    print("[Lua Start()]")
end

function Update()
    print("[Lua Update()]")
end

function OnDestroy()
    print("[Lua OnDestroy()]")
    util.print_func_ref_by_csharp()
end
