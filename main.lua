-- submodules
for _, module in ipairs(love.filesystem.getDirectoryItems("modules")) do
  _G[module] = require("modules." .. module .. "." .. module)
end

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

lume.each({ "models", "love" }, function(dir)
  lume.each(love.filesystem.getDirectoryItems(dir), function(file)
    require(dir .. "." .. file:gsub(".lua", ""))
  end)
end)
