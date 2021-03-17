function love.load()
  global = {}
  global.dev = Dev:new("bottom", "right")
  global.view_manager = ViewManager:new("menu")
  global.view_manager:load()
end
