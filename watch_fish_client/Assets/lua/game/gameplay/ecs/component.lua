---@class CCompGFX
CCompGFX = Core.declare_class()

function CCompGFX:ctor()
    self._gfx = nil
end

---@class CCompKeyboardCtrl
CCompKeyboardCtrl = Core.declare_class()

function CCompKeyboardCtrl:ctor()
    self._up_key_pressed        = false
    self._down_key_pressed      = false
    self._left_key_pressed      = false
    self._right_key_pressed     = false
end

