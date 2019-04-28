-- base class for an actor
-- dependencies:
--  vector.p8
--  map.p8

_actor = {
 pos = nil,
 vel = nil,
 acc = 0.3,
 fri = 0.93,

 in_air = true,

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
 a.pos = _vector:new()
 a.vel = _vector:new()
 self.__index = self
 return setmetatable(a, self)
end

function _actor:update()
 self.vel = self.vel:scale(self.fri)
 
 printf(self.pos:str())
 printf(self.vel:str())

 -- move x
 local newx = self.pos.x + self.vel.x
 if map_rectcollide(newx, self.pos.y, self.hitbox[3], self.hitbox[4]) then
  -- collision
  while (not map_rectcollide(self.pos.x + sgn(self.vel.x)*0.3, self.pos.y, self.hitbox[3], self.hitbox[4])) do
   self.pos.x += sgn(self.vel.x)*0.1
  end
  self.vel.x = 0
 end

 -- move y
 local newy = self.pos.y + self.vel.y
 if map_rectcollide(self.pos.x, newy, self.hitbox[3], self.hitbox[4]) then
  -- collision
  while (not map_rectcollide(self.pos.x, self.pos.y + sgn(self.vel.y)*0.3, self.hitbox[3], self.hitbox[4])) do
   self.pos.y += sgn(self.vel.y)*0.1
  end

  -- update in_air
  if (sgn(self.vel.y) == 1) self.in_air = false

  -- kill y velocity
  self.vel.y = 0
 else
  self.in_air = true
 end

 printf(self.in_air)

 self.pos += self.vel
end

function _actor:draw()
 spr(self.sprite, 
  self.pos.x, 
  self.pos.y, 
  self.s_width,
  self.s_height,
  self.s_flip_x,
  self.s_flip_y);
end