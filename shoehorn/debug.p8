-- functions to easily and painlessly debug stuff

_debug_buf = {}

function printf(s)
 add(_debug_buf, s)
end

function _debug_draw()
 local y = 0

 printf("cpu: "..stat(1))

 for s in all(_debug_buf) do
  print(s, 0, y)
  y += 6
 end
end

function _debug_clear()
 _debug_buf = {}
end