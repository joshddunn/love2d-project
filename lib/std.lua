std = {}

std.each = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v)
  end
end

std.each_with_index = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

std.any = function(arr, fn)
  for i, v in ipairs(arr) do
    if fn(v) then
      return true
    end
  end
  return false
end

std.push = function(arr, val)
  table.insert(arr, val)
end
