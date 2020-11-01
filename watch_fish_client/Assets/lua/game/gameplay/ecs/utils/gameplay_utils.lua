gp_utils = gp_utils or {}

local _tile_pos_offset_map = {
    [ETileAnchorType.CENTER]        = { 0,0},
    [ETileAnchorType.LEFT_TOP]      = {-gameplay_const.kGfxTileSizeHalf, gameplay_const.kGfxTileSizeHalf},
    [ETileAnchorType.RIGHT_TOP]     = { gameplay_const.kGfxTileSizeHalf, gameplay_const.kGfxTileSizeHalf},
    [ETileAnchorType.LEFT_DOWN]     = {-gameplay_const.kGfxTileSizeHalf,-gameplay_const.kGfxTileSizeHalf},
    [ETileAnchorType.RIGHT_DOWN]    = { gameplay_const.kGfxTileSizeHalf,-gameplay_const.kGfxTileSizeHalf},
}

---GetCoordPosWithAnchorType
---@param row int
---@param col int
function gp_utils.GetCoordPos(row,col)
    local _x = (col - 1) * gameplay_const.kGfxTileSize + gameplay_const.kGfxOriginX
    local _y = (row - 1) * gameplay_const.kGfxTileSize + gameplay_const.kGfxOriginY
    return _x,_y
end

---GetCoordPosWithAnchorType
---@param row int
---@param col int
---@param anchor_type ETileAnchorType
function gp_utils.GetCoordPosWithAnchorType(row,col,anchor_type)
    local _cx,_cy = gp_utils.GetCoordPos(row,col)
    local _ox,_oy = _tile_pos_offset_map[anchor_type][1],_tile_pos_offset_map[anchor_type][2]
    return _cx + _ox,_cy + _oy
end

function gp_utils.CreateTank(world_spawn,row,col)
    local _spawn_param = {
        unit_type = EUnitType.TANK,
        row = row,
        col = col,
    }
    wrold_spawn:SpawnUnit(_spawn_param)
end
