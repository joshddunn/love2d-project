function love.keypressed(key)
  if key == "q" then
    love.event.quit()
  end

  if key == "x" then
    global.dev:toggle()
  end

  global.view_manager:send_event('keypressed', key)
end
