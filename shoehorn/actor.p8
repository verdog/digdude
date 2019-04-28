-- base class for an actor
-- dependencies:
--  vector.p8

_actor = {
 position = nil,
 velocity = nil,
 friction = 0.95,

 sprite=0,
 s_flip_x = false,
 s_flip_y = false,
 s_width = 1,
 s_height = 1
}

function _actor:new(a)
 local a = a or {}
 a.position = _vector:new()
 a.velocity = _vector:new()
 self.__index = self
 return setmetatable(a, self)
end

function _actor:update()
 self.velocity = self.velocity:scale(self.friction)
 self.position += self.velocity
end

function _actor:draw()
 spr(self.sprite, 
  self.position.x, 
  self.position.y, 
  self.s_width,
  self.s_height,
  self.s_flip_x,
  self.s_flip_y);
end

function _actor:force(v)
 self.xvel += v.x
 self.yvel += v.y
end