-- player class

_player = _actor:new()
_player.sprite = 1

function _player:update()
 get_input()
 self.velocity.x += input_x / 2
 if (input_yp < 0) self.velocity.y = -4
 self.velocity.y += 0.2

 self.s_flip_x = self.velocity.x < 0 and true or false 

 _actor.update(self)

 if (self.position.y > 128 - 8) self.position.y = 128 - 8

 if (self.position.x > 128 + 8) self.position.x = 0 - 16
 if (self.position.x < 0 - 16) self.position.x = 128 + 8
end

function _player:draw()
 self.sprite = 1 + 10*time() % 2

 _actor.draw(self)
end