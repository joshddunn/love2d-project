ViewManager = {}
ViewManager.__index = ViewManager

function ViewManager:new(mode)
  local self = {}
  setmetatable(self, ViewManager)

  self.mode = mode
  self.previous_mode = nil
  self.views = {}

  return self
end

function ViewManager:send_event(event, args)
  local view = self.views[self.mode]
  view[event .. "_func"](view, args)
end

function ViewManager:load()
  lume.each(love.filesystem.getDirectoryItems("views"), function(view)
    local view_mode = view:gsub(".lua", "")
    self:add_view(require("views." .. view_mode))
    self.views[view_mode]:load_func()
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
