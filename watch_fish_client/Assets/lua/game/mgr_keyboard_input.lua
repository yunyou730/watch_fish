---@class CMgrKeyboardInput
CMgrKeyboardInput = Core.declare_class()

local _care_keys_map = {
    [CS.UnityEngine.KeyCode.F1] = function()
        print("this is f1")
    end,

    [CS.UnityEngine.KeyCode.F2] = function()
        print("this is f2")
    end,
    
    [CS.UnityEngine.KeyCode.F3] = function()
        print("this is f3")
    end,    
}

function CMgrKeyboardInput:OnUpdate()
    if CS.UnityEngine.Input.anyKey then
        for key_code,func in pairs(_care_keys_map) do
            if CS.UnityEngine.Input.GetKeyDown(key_code) then
               func()
            end
        end
    end
end
