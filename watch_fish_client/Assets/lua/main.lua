print("xxx")

local util = require 'xlua.util'
require "module.enter"

print("This is main.lua")

function Start()
    print("[Lua Start()]")

    local _go = CS.UnityEngine.GameObject();
    _go.name = "ayy"

    --local _testmono = CS.TestMono.Add(_go);
    local _testmono = CS.watchfish.TestMono.Add(_go);
    _testmono:TestFunc("[xxx]")

    local _t2 = _go:GetComponent("TestMono")
    _t2:TestFunc("[t2]!")
    
    local _menu_prefab = CS.UnityEngine.Resources.Load("menu_test")
    local _menu = CS.UnityEngine.GameObject.Instantiate(_menu_prefab)
    print("xxx")

    local _btn = _menu.transform:Find("Canvas"):Find("Button")
    _btn.name = "button kkkk"

    local _btn_comp = _btn.gameObject:GetComponent("Button")
    _btn_comp.onClick:AddListener(function()
        print("clicked!!")
    end)
end

function Update()
    -- print("[Lua Update()]")
end

function OnDestroy()
    print("[Lua OnDestroy()]")
    util.print_func_ref_by_csharp()
end
