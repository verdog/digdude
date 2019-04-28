function _init()
 camera_init()
 map_generate()
end


function _update60()
 camera_update()
end

function _draw()
 cls(1)

 map_draw()

 _debug_draw()
 _debug_clear()
end