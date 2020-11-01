
---@class CSingletonEnterArg
CSingletonEnterArg = Core.declare_class()
function CSingletonEnterArg:ctor(init_param)
    self.spawn_row = init_param.spawn_row
    self.spawn_col = init_param.spawn_col
end

---@class CSingletonMap
CSingletonMap = Core.declare_class()
function CSingletonMap:ctor(init_param)
    self.rows_cnt                   = init_param.rows_cnt
    self.cols_cnt                   = init_param.cols_cnt
    self.shall_create_ground_object = true

    -- 哪个格子上有什么东西 
    self.tile_map                       = {}
end

---@class CSingletonUnitSpawn
CSingletonUnitSpawn = Core.declare_class()
function CSingletonUnitSpawn:ctor()
    self.spawn_list             = nil
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

---@class CSingletonGFX
CSingletonGFX = Core.declare_class()

function CSingletonGFX:ctor()
    self.spawn_data_list = nil
end

function CSingletonGFX:AddData(unit_type,row,col)
    if self.spawn_data_list == nil then
        table.insert(self.spawn_data_list,{
            unit_type = unit_type,
            row = row,
            col = col,
        })
    end
end

