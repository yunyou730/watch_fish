---@class CGOGround
CGOGround = Core.declare_class()

function CGOGround:ctor()
    self._cols          = 0
    self._rows          = 0
    self._root_go       = nil
    self._tile_go_map   = {}
end

function CGOGround:dtor()
    for k,v in pairs(self._tile_go_map) do
        CS.UnityEngine.GameObject.Destroy(v)
    end
    self._tile_go_map = nil
    CS.UnityEngine.GameObject.Destroy(self._root_go)
    self._root_go = nil
end

function CGOGround:Create(rows,cols,tile_set_map)
    self._root_go = CS.UnityEngine.GameObject()
    self._root_go.name = "[gameplay_root]"

    self._cols = cols
    self._rows = rows
    self._tile_go_map = {}

    self:_CreateTiles()
end

function CGOGround:_CreateTiles()
    print(self._rows,self._cols)
    for row = 1,self._rows do
        for col = 1,self._cols do
            self:_CreateOneTile(row,col)
        end
    end
end

function CGOGround:_CreateOneTile(row,col)
    local _prefab = CS.watchfish.ResLoaderExt.LoadPrefab("grid_tile/grid_tile.prefab");
    local _tile_go = CS.UnityEngine.GameObject.Instantiate(_prefab)
    _tile_go.transform.parent = self._root_go.transform
    _tile_go.name = _tile_go.name .. " [" .. row .. "," .. col .. "]"

    -- tile color
    local _color_type = CS.watchfish.GridTile.ETileColor.Even
    if math.fmod(row + col,2) == 0 then
        _color_type = CS.watchfish.GridTile.ETileColor.Odd
    end
    _tile_go:GetComponent("GridTile"):SetTileColor(_color_type)

    -- hold 
    self._tile_go_map[self:_GetCoordKey(row,col)] = _tile_go

    -- pos 
    local _x,_y = gp_utils.GetCoordPos(row,col)
    _tile_go.transform.position = CS.UnityEngine.Vector3(_x,0,_y)
end

function CGOGround:_GetCoordKey(row,col)
    return row .. "_" .. col
end
