function _init()
 camera_init()
 map_generate()

 player = _player:new()
 player.position = _vector:new(8,8)
end

function _update60()
 camera_update()

 player:update()
end

function _draw()
 cls()

 player:draw()
 map_draw()

 _debug_draw()
 _debug_clear()
end