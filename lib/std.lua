std = {}

std.each = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

std.each_with_index = function(arr, fn)
  for i, v in ipairs(arr) do
    fn(v, i)
  end
end

std.any = function(arr, fn)
  for i, v in ipairs(arr) do
    if fn(v, i) then
      return true
    end
  end
  return false
end

std.push = function(arr, v)
  table.insert(arr, v)
end

std.map = function(arr, fn)
  local map = {}
  std.each(arr, function(v, i)
    std.push(map, fn(v, i))
  end)
  return map
end

std.filter = function(arr, fn)
  local filter = {}
  std.each(arr, function(v, i)
    if fn(v, i) then
      std.push(filter, v)
    end
  end)
  return filter
end

std.clone = function(arr)
  return std.map(arr, function(v)
    return v
  end)
end

std.clamp = function(val, min, max)
  if val < min then
    return min
  elseif val > max then
    return max
  else
    return val
  end
end

std.last = function(arr)
  return arr[#arr]
end
