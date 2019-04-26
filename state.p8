-- game state base class

_state = {
 name = "default_state"
}

function _state:new(o)
 o = o or {}
 self.__index = self
 setmetatable(o, self)
 return o
end

function _state:enter()
 print("Entering _state: "..self.name)
end

function _state:exit()
 print("Exiting _state: "..self.name)
end

function _state:update()
 print("Updating _state: "..self.name)
end

function _state:draw()
 print("Drawing _state: "..self.name)
end
