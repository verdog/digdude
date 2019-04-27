function _init()
 players = {}
 for i=0,8 do
  local p = _player:new()
  p.position.x = rnd() * 128
  add(players, p)
 end
end

function _update60()
 for p in all(players) do
  p:update()
 end
end

function _draw()
 cls()
 
 for p in all(players) do
  p:draw()
  -- printf(p.position.x)
 end

 _debug_draw()
 _debug_clear()
end