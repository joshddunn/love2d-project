function love.wheelmoved(horizontal, vertical)
  global.view_manager:send_event('wheelmoved', horizontal, vertical)
end
