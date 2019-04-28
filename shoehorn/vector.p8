-- vector stuff

_vector = {}

function _vector:new(x, y)
 self.__index = self
 return setmetatable({x=x or 0, y=y or 0}, _vector)
end

function _vector:mag()
 -- hacks to avoid overflows
 if (self.x >= 128 or self.y >= 128) then
  return sqrt(self.x * 0x0.0001 * self.x + self.y * 0x0.0001 * self.y) * 0x100
 else
  return sqrt(self.x * self.x + self.y * self.y)
 end
end

function _vector:norm()
 return self:scale(1/(self:mag()+0x0.0001)) -- avoid division by 0
end

function _vector:add(v)
 return _vector:new(self.x + v.x, self.y + v.y)
end
_vector.__add = _vector.add

function _vector:subtract(v)
 return _vector:new(self.x - v.y, self.y - v.y)
end
_vector.__sub = _vector.subtract

function _vector:dot(v)
 return self.x*v.x + self.y*v.y
end
_vector.__mult = _vector.dot

function _vector:scale(s)
 return _vector:new(self.x*s, self.y*s)
end

function _vector:str()
 return self.x..","..self.y
end
