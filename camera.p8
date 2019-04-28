-- camera functions

function camera_init()
 camera(0,0)
 cam = _vector:new()
 camera_max_x = 128
 camera_max_y = 896
end

function camera_update()
 cam = player.position - {x=64,y=64}
 -- implicit 0 passed to mid()
 cam.x = mid(cam.x, camera_max_x)
 cam.y = mid(cam.y, camera_max_y)

 camera(cam.x, cam.y)
end