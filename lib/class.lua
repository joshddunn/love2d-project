function class(name, parent)
  if parent and not _G[parent] then
    require(table.concat({ "models", tostring(tosnake(parent)) }, "."))
  end

  _G[name] = {}
  _G[name].__index = _G[name]
  _G[name]._type = name
  _G[name]._parent = parent

  _G[name].init_func = function(self, name, callbacks, ...)
    local parent = _G[name]._parent
    if parent then
      lume.push(callbacks, _G[parent].init)
      _G[parent].init_func(self, parent, callbacks, ...)
    else
      for _, callback in lume.ripairs(callbacks) do
        callback(self, ...)
      end
      self:init(...)
    end
  end

  _G[name].new = function(self, ...)
    local self = {}
    setmetatable(self, _G[name])

    self._type = name
    self._parent = parent
    self:init_func(name, {}, ...)

    return self
  end

  if parent then
    setmetatable(_G[name], { __index = _G[parent] })
  end

  return _G[name]
end
