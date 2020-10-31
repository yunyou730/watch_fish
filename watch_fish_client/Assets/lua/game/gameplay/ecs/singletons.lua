
---@class CSingletonEnterArg
CSingletonEnterArg = Core.declare_class()
function CSingletonEnterArg:ctor()
    self.player_spawn_x = 0
    self.player_spawn_y = 0
end

---@class CSingletonMap
CSingletonMap = Core.declare_class()
function CSingletonMap:ctor(rows_cnt,cols_cnt,terrain_map)
    self.rows_cnt                   = rows_cnt
    self.cols_cnt                   = cols_cnt
    self.shall_create_ground_object = true

    -- 哪个格子上有什么东西 
    self.tile_map                       = {}
end

---@class CSingletonUnitSpawn
CSingletonUnitSpawn = Core.declare_class()
function CSingletonUnitSpawn:ctor()
    self.spawn_list = nil
end

function CSingletonUnitSpawn:SpawnUnit(unit_type,row,col)
    if self.spawn_list == nil then
        self.spawn_list = {}
    end
    table.insert(self.spawn_list,{
        unit_type = unit_type,
        row = row,
        col = col,
    })
end
