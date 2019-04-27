-- base class for an actor
-- dependancies:
--  vector.p8

_actor = {
 position = _vector:new(0,0),
 velocity = _vector:new(0,0),
 friction = 0.95,

 sprite=0,
 s_flip_x = false,
 s_flip_y = false,
 s_width = 1,
 s_height = 1
}

function _actor:new(a)
 self.__index = self
 return setmetatable(a or {}, self)
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