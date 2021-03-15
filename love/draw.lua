function love.draw()
  global.view_manager:send_event('draw')

  -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  -- love.graphics.print("Garbage: "..tostring(collectgarbage("count")*1024), 10, 30)
end
