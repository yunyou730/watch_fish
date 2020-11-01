print("this is f3")

if _G.test_go == nil then
    local _prefab   = CS.watchfish.ResLoaderExt.LoadPrefab("test/test_point.prefab");
    local _go       = CS.UnityEngine.GameObject.Instantiate(_prefab)
    _go.name        = "test"
    _G.test_go      = _go
end

local _go = _G.test_go
--local _x,_y = gp_utils.GetCoordPosWithAnchorType(0,0,ETileAnchorType.CENTER)
--local _x,_y = gp_utils.GetCoordPosWithAnchorType(1,1,ETileAnchorType.LEFT_TOP)
--local _x,_y = gp_utils.GetCoordPosWithAnchorType(1,1,ETileAnchorType.LEFT_DOWN)
local _x,_y = gp_utils.GetCoordPosWithAnchorType(1,1,ETileAnchorType.RIGHT_TOP)
_go.transform.position = CS.UnityEngine.Vector3(_x,0,_y)
