-- functions to painlessly debug stuff

_debug_buf = {}

function printf(s)
 add(_debug_buf, s)
end

function _debug_draw()
 camera(0,0)
 local y = 1

 printf("cpu: "..stat(1))

 for s in all(_debug_buf) do
  print(s, 1, y, 6)
  y += 6
 end
 camera(cam.x, cam.y)
end

function _debug_clear()
 _debug_buf = {}
end