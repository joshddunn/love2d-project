function love.keypressed(key)
  if key == "q" then
    love.event.quit()
  end

  global.view_manager:keypressed(key)
end
