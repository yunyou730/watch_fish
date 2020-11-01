-- common
require "game.gameplay.gameplay_enum"
require "game.gameplay.gameplay_const"

-- game object 
require "game.gameplay.gameplay_object.go_ground"
require "game.gameplay.gameplay_object.go_tank"

-- ecs
require "game.gameplay.ecs.gameplay"
require "game.gameplay.ecs.world"
require "game.gameplay.ecs.singletons"
require "game.gameplay.ecs.entity"

require "game.gameplay.ecs.system.system_base"
require "game.gameplay.ecs.system.system_unit_spawn"
require "game.gameplay.ecs.system.system_initialize"
require "game.gameplay.ecs.system.system_unit_spawn"
require "game.gameplay.ecs.system.system_gfx_ground"
require "game.gameplay.ecs.system.system_gfx_unit"

-- utils
require "game.gameplay.ecs.utils.gameplay_utils"
