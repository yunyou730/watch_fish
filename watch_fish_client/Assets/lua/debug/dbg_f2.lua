print("this is f2")

g_game.timer:FrameLoop(1,nil,function()
    local _dt = g_game.timer:DeltaTime()
    print("[dt] " .. _dt)
end)
