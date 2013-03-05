--------------------------------------------
-- Settings and social icons button effects
--------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
local widget = require "widget"

local centerX = display.contentWidth * .5
local centerY = display.contentHeight * .5 
local button
local newButton

local function buttonTrans()
	transition.to(newButton, { time = 400, x = centerX, y = centerY - 70})
end

local function buttonTransBack()
	transition.to(newButton, { time = 400, x = centerX, y = centerY})
end

newButton = widget.newButton {
	label = "new Button",
	width = 100,
	height = 52,
}
newButton.x = centerX
newButton.y = centerY

button = widget.newButton {
	label = "play",
	width = 100,
	height = 52,
	onRelease = buttonTrans,
	--onEvent = buttonTransBack
}
button.x = centerX
button.y = centerY












