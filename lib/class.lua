function class(name, parent)
  _G[name] = {}
  _G[name].__index = _G[name]

  _G[name].init = function(self, ...) end

  _G[name].new = function(self, ...)
    local self = {}
    setmetatable(self, _G[name])

    self._type = name

    _G[name].init(self, ...)

    return self
  end

  if parent then
    setmetatable(_G[name], { __index = _G[parent] })
  end

  return _G[name]
end
