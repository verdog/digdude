-- player class

_player = _actor:new()
_player.sprite = 1

function _player:update()
 get_input()
 self.vel.x += input_x / 5
 self.vel.y += 0.1

 if (btnp(2)) self.vel.y = -5

 self.s_flip_x = self.vel.x < 0 and true or false 

 _actor.update(self)
end

function _player:draw()
 self.sprite = 1 + (10*time() + rnd() % 3 ) % 2

 _actor.draw(self)
end