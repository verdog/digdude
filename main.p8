function _init()
 camera_init()
 map_generate()

 player = _player:new()
 player.pos = _vector:new(16,44)
end

function _update60()
 camera_update()

 player:update()
end

function _draw()
 cls()

 map_draw()
 player:draw()

 _debug_draw()
 _debug_clear()
end