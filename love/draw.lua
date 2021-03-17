function love.draw()
  global.view_manager:send_event('draw')
  global.dev:draw()
end
