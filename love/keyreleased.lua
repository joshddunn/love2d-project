function love.keyreleased(key)
  global.view_manager:send_event('keyreleased', key)
end
