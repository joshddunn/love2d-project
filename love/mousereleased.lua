function love.mousereleased(x, y, button, is_touch, presses)
  global.view_manager:send_event('mousereleased', x, y, button, is_touch, presses)
end
