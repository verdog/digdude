-- player class

_player = _actor:new()
_player.sprite = 1

function _player:update()
 get_input()
 self.vel.x += input_x * self.acc
 self.vel.y += 0.2

 if (btnp(2) and not self.in_air) then 
  self.vel.y = -5
  self.in_air = true
 end

 if (btnp(4)) then 
  map_dig(self.pos.x + 7, self.pos.y + 12)
  map_dig(self.pos.x, self.pos.y + 12)
 end

 self.s_flip_x = self.vel.x < 0 and true or false 

 _actor.update(self)
end

function _player:draw()
 self.sprite = 1 + (10*time() + rnd() % 3 ) % 2

 map_highlight_block(self.pos.x, self.pos.y+12)
 map_highlight_block(self.pos.x+7, self.pos.y+12)

 _actor.draw(self)
end