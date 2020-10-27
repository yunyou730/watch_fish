print("this is f1")

local _prefab = CS.watchfish.ResLoaderExt.LoadPrefab("grid_tile/grid_tile.prefab");
local _tile_go = CS.UnityEngine.GameObject.Instantiate(_prefab)
_tile_go:GetComponent("GridTile"):SetTileColor(CS.watchfish.GridTile.ETileColor.Even)


