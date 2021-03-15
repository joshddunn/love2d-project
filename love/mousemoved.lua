function love.mousemoved(x, y, dx, dy, is_touch)
  global.view_manager:send_event('mousemoved', x, y, dx, dy, is_touch)
end
