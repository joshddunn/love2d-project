function love.load()
  push:setupScreen(480, 270, love.graphics.getWidth(), love.graphics.getHeight(), { fullscreen = false })

  global = {}
  global.dev = Dev:new("bottom", "right")
  global.view_manager = ViewManager:new("menu")
  global.view_manager:load()
end
