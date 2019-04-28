function _init()
 map_generate()
end

function _update60()
end

function _draw()
 cls()

 map_draw()

 _debug_draw()
 _debug_clear()
end