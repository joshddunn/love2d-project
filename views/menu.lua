view = View:new("menu")

view.draw = function(self)
  love.graphics.print("Hello world!")
end

global.view_manager:add_view(view)
