function love.load()
  global = {}
  global.view_manager = ViewManager:new()
  global.view_manager:load({ "menu" })
end
