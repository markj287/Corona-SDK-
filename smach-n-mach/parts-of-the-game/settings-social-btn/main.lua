--------------------------------------------
-- Settings and social icons button effects
--------------------------------------------
display.setStausBar(display.HiddenStatusBar)
local widget = require "widget"

local centerX = display.contentWidth * .5
local centerY = display.contentHeight * .5 

local function optsAppear(event)
	if event.phase == "release" then 
		transition.to(musicBtn, {time = 400} )
	end
end

local musicBtn = widget.newButton {
	id = 001,
	label = "music",
	width = 44,
	height = 44
}
musicBtn.x = centerX
musicBtn.y = centerY

local settingBtn = widget.newButton {
	id = 001,
	default = "settings-btn.png",
	over = "settings-btn.png",
	width = 44,
	height = 44,
	onRelease = optsAppear
}
settingBtn.x = centerX 
settingBtn.y = centerY - 40








