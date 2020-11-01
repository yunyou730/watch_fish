---@class CGOActor
CGOTank = Core.declare_class()

function CGOTank:ctor(row,col)
    self._row = row
    self._col = col

    self._raw_object = nil
end

function CGOTank:dtor()
    
end

function CGOTank:_Create()

end
