function tosnake(str)
  return str:gsub("%u", function(s)
    return "_" .. s:lower()
  end):gsub("^_", "")
end
