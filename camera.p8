-- camera functions

function camera_init()
 camera(0,0)
 cam = _vector:new()
 camera_max_x = 128
 camera_max_y = 896
end

function camera_update()
 if (btn(0)) cam.x -= 3
 if (btn(1)) cam.x += 3
 if (btn(2)) cam.y -= 3
 if (btn(3)) cam.y += 3

 -- implicit 0 passed to mid()
 cam.x = mid(cam.x, camera_max_x)
 cam.y = mid(cam.y, camera_max_y)

 camera(cam.x, cam.y)
end