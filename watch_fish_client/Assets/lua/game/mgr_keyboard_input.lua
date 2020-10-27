---@class CMgrKeyboardInput
CMgrKeyboardInput = Core.declare_class()

local _care_keys_map = {
    [CS.UnityEngine.KeyCode.F1] = "debug.dbg_f1",
    [CS.UnityEngine.KeyCode.F2] = "debug.dbg_f2",
    [CS.UnityEngine.KeyCode.F3] = "debug.dbg_f3",
}

function CMgrKeyboardInput:OnUpdate()
    if CS.UnityEngine.Input.anyKey then
        for key_code,lua_file in pairs(_care_keys_map) do
            if CS.UnityEngine.Input.GetKeyDown(key_code) then
                if package.loaded[lua_file] then
                    package.loaded[lua_file] = nil
                end
                require(lua_file)
            end
        end
    end
end
