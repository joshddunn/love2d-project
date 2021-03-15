-- submodules
lume = require "modules.lume.lume"
inspect = require "modules.inspect.inspect"

lume.each({ "models", "love" }, function(dir)
  lume.each(love.filesystem.getDirectoryItems(dir), function(file)
    require(dir .. "." .. file:gsub(".lua", ""))
  end)
end)
