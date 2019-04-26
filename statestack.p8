-- game state stack

_statestack = {}

function _statestack:new(o)
 o = o or {}
 self.__index = self
 setmetatable(o, self)
 return o
end

function _statestack:push(s)
 add(self, s)
 return s
end

function _statestack:top()
 return self[#self]
end

function _statestack:pop()
 local s = self[#self]
 self[#self] = nil
 return s
end