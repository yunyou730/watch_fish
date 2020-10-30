
---@class CSingletonEnterArg
CSingletonEnterArg = Core.declare_class()

function CSingletonEnterArg:ctor()
    self.player_spawn_x = 0
    self.player_spawn_y = 0
end

function CSingletonEnterArg:Init()

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

-- ---@class CSingletonUnitHolder
-- CSingletonUnitHolder = Core.declare_class()

-- function CSingletonUnitHolder:ctor()

-- end
