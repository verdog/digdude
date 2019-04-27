-- game state stack

_statestack = {}

function _statestack:new(o)
 self.__index = self
 return setmetatable(o or {}, self)
end

function _statestack:push(s)
 add(self, s)
 s:enter()
 return s
end

function _statestack:top()
 return self[#self]
end

function _statestack:pop()
 local s = self[#self]
 self[#self]:exit()
 self[#self] = nil
 return s
end