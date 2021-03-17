function class()
  local klass = {}
  klass.__index = klass

  klass.new = function(self, ...)
    local self = {}
    setmetatable(self, klass)

    klass.init(self, ...)

    return self
  end

  return klass
end
