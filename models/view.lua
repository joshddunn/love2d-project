View = {}
View.__index = View

function View:new(mode)
  local self = {}
  setmetatable(self, View)

  self.mode = mode
  self.draw = function(self) return nil end
  self.mousepressed = function(self, x, y, button, is_touch, presses) return nil end
  self.mousereleased = function(self, x, y, button, is_touch, presses) return nil end
  self.mousemoved = function(self, x, y, dx, dy, is_touch) return nil end
  self.keypressed = function(self, key) return nil end
  self.keyreleased = function(self, key) return nil end
  self.update = function(self, dt) return nil end
  self.wheelmoved = function(self, horizontal, vertical) return nil end
  self.load = function(self) return nil end
  self.buttons = {}
  self.texts = {}
  self.props = {}
  self.scroll = 0

  return self
end

function View:draw_func()
  self:draw()

  local gx, gy = push:toGame(love.mouse.getX(), love.mouse.getY())

  lume.each(self.buttons, function(button)
    button:draw(gx, gy, self.scroll)
  end)

  lume.each(self.texts, function(text)
    text:draw()
  end)
end

function View:mousepressed_func(x, y, button, is_touch, presses)
  local gx, gy = push:toGame(x, y)

  self:mousepressed(gx, gy, button, is_touch, presses)

  lume.each(self.buttons, function(button)
    button:click(gx, gy)
  end)
end

function View:mousereleased_func(x, y, button, is_touch, presses)
  local gx, gy = push:toGame(x, y)

  self:mousereleased(gx, gy, button, is_touch, presses)
end

function View:mousemoved_func(x, y, dx, dy, is_touch)
  local gx, gy = push:toGame(x, y)
  local gdx, gdy = push:toGame(dx, dy)

  self:mousemoved(gx, gy, gdx, gdy, is_touch)
end

function View:keypressed_func(key)
  self:keypressed(key)
end

function View:keyreleased_func(key)
  self:keyreleased(key)
end

function View:update_func(dt)
  self:update(dt)
end

function View:wheelmoved_func(horizontal, vertical)
  self:wheelmoved(horizontal, vertical)
end

function View:load_func()
  self:load()
end

function View:add_button(button)
  lume.push(self.buttons, button)
end

function View:add_text(text)
  lume.push(self.texts, text)
end
