-- base class for an actor

_actor = {
 x=0,
 y=0,
 xvel=0,
 yvel=0,
 spr=0
}

function _actor:new(a)
 self.__index = self
 return setmetatable(a or {}, self)
end

function _actor:update()
 self.x += self.xvel
 self.y += self.yvel
end

function _actor:draw()
 spr(self.spr, self.x, self.y);
end