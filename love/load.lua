function love.load()
  global = {}
  global.view_manager = ViewManager:new("menu")
  global.view_manager:load()
end
