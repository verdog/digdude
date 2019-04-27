-- game state base class

_state = {
 name = "default_state",
 actors = {}
}

function _state:new(o)
 self.__index = self
 return setmetatable(o or {}, self)
end

function _state:enter()
 print("Entering _state: "..self.name)
end

function _state:exit()
 print("Exiting _state: "..self.name)
end

function _state:update()
 for a in all(self.actors) do
  a:update()
 end
end

function _state:draw()
 for a in all(self.actors) do
  a:draw()
 end
end
