function _init()
 p = _player:new()
end

function _update60()
 p:update()
end

function _draw()
 cls()

 p:draw()

 _debug_draw()
 _debug_clear()
end