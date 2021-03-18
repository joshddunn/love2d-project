class("Dev")

function Dev:init(vertical, horizontal)
  self.visible = false
  self.height = 75
  self.width = 170

  local x_coords = {
    left = 0,
    middle = (push:getWidth() - self.width) / 2,
    right = push:getWidth() - self.width
  }

  local y_coords = {
    top = 0,
    middle = (push:getHeight() - self.height) / 2,
    bottom = push:getHeight() - self.height
  }

  self.x = x_coords[horizontal]
  self.y = y_coords[vertical]
  self.font = love.graphics.newFont(11)
end

function Dev:draw()
  if self.visible then
    local font = love.graphics.getFont()
    local r, g, b, a = love.graphics.getColor()

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    love.graphics.print("Current FPS: " .. love.timer.getFPS(), self.x + 10, self.y + 10)
    love.graphics.print("Average Delta: " .. lume.round(love.timer.getAverageDelta(), .00001), self.x + 10, self.y + 30)
    love.graphics.print("Garbage: " .. lume.round(collectgarbage("count") / 1024, .0001) .. " MB", self.x + 10, self.y + 50)

    love.graphics.setFont(font)
    love.graphics.setColor(r, g, b, a)
  end
end

function Dev:toggle()
  self.visible = not self.visible
end
