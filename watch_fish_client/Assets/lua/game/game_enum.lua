---@class EGameState
EGameState = {}
EGameState.NONE             = 0
EGameState.LOGIN            = 1
EGameState.UI               = 2
EGameState.GAMEPLAY         = 3

---@class EMenuType
EMenuType = {}
EMenuType.NONE              = 0
EMenuType.LOGIN             = 1
EMenuType.HOME              = 2

---@class EGameEvent
EGameEvent = {}
EGameEvent.SHOW_MENU                = 1
EGameEvent.CLOSE_MENU               = 2
EGameEvent.START_LOGIN_WORKFLOW     = 3
EGameEvent.ENTER_HOME               = 4
EGameEvent.ENTER_BATTLE             = 5


---@class ETileAnchorType
ETileAnchorType = {}
ETileAnchorType.CENTER          = 1
ETileAnchorType.LEFT_TOP        = 2
ETileAnchorType.RIGHT_TOP       = 3
ETileAnchorType.LEFT_DOWN       = 4
ETileAnchorType.RIGHT_DOWN      = 5
