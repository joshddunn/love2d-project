function love.mousepressed(x, y, button, is_touch, presses)
  global.view_manager:send_event('mousepressed', x, y, button, is_touch, presses)
end
