
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

function CSingletonMap:ctor()
    self.shall_create_ground_object     = false
    self.rows_cnt                       = 0
    self.cols_cnt                       = 0

    -- 哪个格子上有什么东西 
    self.tile_map                       = {}
end

function CSingletonMap:Init(row_cnt,col_cnt,terrain_map)
    
end

-- ---@class CSingletonUnitHolder
-- CSingletonUnitHolder = Core.declare_class()

-- function CSingletonUnitHolder:ctor()

-- end
