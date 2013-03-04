
-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- pause screen.lua 
--
-------------------------------------------------------------------------
local widget = require "widget"
local storyboard = require "storyboard"


-- Called when scene view does not exist 
function scene:createScene(event)
	local group = self.view

	local bg = display.newImage("pause-menu.png")
	bg.x = display.contentWidth * .5
	bg.y = display.contentHeight * .5
	group:insert(bg)

	local pauseText = display.newText()
end

function scene:enterScene(event)

end

function scene:exitScene(event)

end

function scene:destroyScene(event)

end








