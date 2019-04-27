function _init()
 v = _vector:new(2,0)
end

function _update()
 printf(v:mag())
 printf(v:str())
 printf(v:norm():str())
end

function _draw()
 cls()
 _debug_draw()
 _debug_clear()
end