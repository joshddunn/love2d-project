print(_VERSION)

for _, module in ipairs(love.filesystem.getDirectoryItems("modules")) do
  _G[module] = require(table.concat({ "modules", module, module }, "."))
end

for _, dir in ipairs({ "lib", "models", "love" }) do
  for _, lib in ipairs(love.filesystem.getDirectoryItems(dir)) do
    require(table.concat({ dir, tostring(lib:gsub(".lua", "")) }, "."))
  end
end
