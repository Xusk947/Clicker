require("core.displayGroup")

local Button = {}

function Button:new(x, y, image, width, height, func) 
-- func because function not allowed
  local button = display.newImageRect( ButtonGroup, image, width, height )
  button.x = x
  button.y = y
  -- run function when click on button Rect
  button.func = func or function() end

  function button.newLine(image, width, height)
  button.line = display.newImageRect(ButtonGroup,image,width,height)
  button.line.x = button.x
  button.line.y = button.y

  return line 

  end

  function button.newFunction(func)
  	button:removeEventListener("touch", button.func)
  	button.func = func
  	button:addEventListener("touch", button.func)
  end
  button:addEventListener("touch", button.func)

  return button
end

return Button 