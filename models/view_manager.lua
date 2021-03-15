ViewManager = {}
ViewManager.__index = ViewManager

function ViewManager:new()
  local self = {}
  setmetatable(self, ViewManager)

  self.mode = nil
  self.previous_mode = nil
  self.views = {}

  return self
end

function ViewManager:draw()
  self.views[self.mode]:draw_func()
end

function ViewManager:mousepressed(x, y, button, is_touch, presses)
  self.views[self.mode]:mousepressed_func(x, y, button, is_touch, presses)
end

function ViewManager:mousereleased(x, y, button, is_touch, presses)
  self.views[self.mode]:mousereleased_func(x, y, button, is_touch, presses)
end

function ViewManager:mousemoved(x, y, dx, dy, is_touch)
  self.views[self.mode]:mousemoved_func(x, y, dx, dy, is_touch)
end

function ViewManager:keypressed(key)
  self.views[self.mode]:keypressed_func(key)
end

function ViewManager:keyreleased(key)
  self.views[self.mode]:keyreleased_func(key)
end

function ViewManager:update(dt)
  self.views[self.mode]:update_func(dt)
end

function ViewManager:wheelmoved(horizontal, vertical)
  self.views[self.mode]:wheelmoved_func(horizontal, vertical)
end

function ViewManager:load(views)
  lume.each(views, function(view)
    require("views." .. view)
  end)

  lume.each(self.views, function(view)
    view:load_func()
  end)
end

function ViewManager:add_view(view)
  if self.mode == nil then
    self.mode = view.mode
  end
  self.views[view.mode] = view
end

function ViewManager:set_view(mode, callback)
  callback = callback or function(x) return nil end
  if self.views[mode] ~= nil then
    self.previous_mode = self.mode
    self.mode = mode
    callback(self.views[mode])
  end
end

function ViewManager:set_previous_view()
  self:set_view(self.previous_mode)
end
