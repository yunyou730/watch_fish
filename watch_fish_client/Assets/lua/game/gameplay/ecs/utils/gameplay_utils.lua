
gp_utils = gp_utils or {}

function gp_utils.GetCoordPos(row,col)
    local _x = (col - 1) * gameplay_const.kGfxTileSize + gameplay_const.kGfxOriginX
    local _y = (row - 1) * gameplay_const.kGfxTileSize + gameplay_const.kGfxOriginY
    return _x,_y
end

function gp_utils.CreateTank(world_spawn,row,col)
    local _spawn_param = {
        unit_type = EUnitType.TANK,
        row = row,
        col = col,
    }
    wrold_spawn:SpawnUnit(_spawn_param)
end
