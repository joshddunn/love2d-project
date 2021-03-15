function love.update(dt)
  if dt < 1 / 60 then
    love.timer.sleep(1 / 60 - dt)
  end

  global.view_manager:update(dt)
end
