function love.draw()
  push:start()
  global.view_manager:send_event('draw')
  global.dev:draw()
  push:finish()
end
