---@class CGOActor
CUnitTank = Core.declare_class()

function CUnitTank:ctor(id)
    self._id            = id
    self._row           = 1
    self._col           = 1
    self._raw_object    = nil
end

function CUnitTank:dtor()
    
end

function CUnitTank:SetCoord(row,col)
    self._row = row
    self._col = col
end

function CUnitTank:Create()
    local _prefab       = CS.watchfish.ResLoaderExt.LoadPrefab("unit/unit_tank.prefab");
    self._raw_object    = CS.UnityEngine.GameObject.Instantiate(_prefab)
    self:Update()
end

function CUnitTank:Update()
    self:_UpdatePosition()
end

function CUnitTank:_UpdatePosition()
    local _x,_y = gp_utils.GetCoordPosWithAnchorType(self._row,self._col,ETileAnchorType.LEFT_TOP)
    self._raw_object.transform.position = CS.UnityEngine.Vector3(_x,0,_y)
end
