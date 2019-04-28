-- player class

_player = _actor:new()
_player.sprite = 1

function _player:update()
 get_input()
 self.velocity.x += input_x / 5
 -- self.velocity.y += 0.2

 self.s_flip_x = self.velocity.x < 0 and true or false 

 _actor.update(self)
end

function _player:draw()
 self.sprite = 1 + (10*time() + rnd() % 3 ) % 2

 _actor.draw(self)
end