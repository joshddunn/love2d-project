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

function ViewManager:load(views)
  lume.each(views, function(view)
    require("views." .. view)
    self.views[view]:load_func()
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
