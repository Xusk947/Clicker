require("core.displayGroup")

local Ui = {}

function Ui:new(x,y,image,width,height)

	local ui = display.newImageRect( UiGroup, image, width, height )
	ui.x = x
	ui.y = y


	function ui.newLine(image)

	ui.line = display.newImageRect( UiGroup, image, ui.width, ui.height)
	ui.line.x = ui.x
	ui.line.y = ui.y

	return ui.line
	end

	function ui.newText(text)
		ui.text = display.newText( UiGroup, text, ui.x + (ui.width / 2.7), ui.y + (ui.height / 2.7),ui.width ,ui.height )

		function ui.fillColor(r,g,b,a)
			ui.text:setFillColor(r,g,b,a)
		end

		return ui.text

	end

	return ui

end

return Ui