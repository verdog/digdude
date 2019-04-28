-- base class for an actor
-- dependencies:
--  vector.p8
--  map.p8

_actor = {
 position = nil,
 velocity = nil,
 friction = 0.95,

 -- hitbox: {offsetx, offsety, width, height}
 hitbox = {0, 0, 8, 8},

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
 
 printf(self.position:str())
 printf(self.velocity:str())

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

function _actor:mapcollide()
 return map_rectcollide(
  self.position.x+self.hitbox[1], 
  self.position.y+self.hitbox[2],
  self.hitbox[3], self.hitbox[4])
end