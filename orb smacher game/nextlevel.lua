---------------------------------------------------------------------------------
-- Smach the Orb 
-- Created by Mark Johnson
-- Level1 file 
---------------------------------------------------------------------------------

local storyboard = require("storyboard")
local scene = storyboard.newScene()

local widget = require "widget"

display.setStatusBar(display.HiddenStatusBar)

-- Local forward references should go here -
local centerX = display.contentWidth/2
local centerY = display.contentHeight/2

local function tapBtn()
	storyboard.gotoScene("Level2", {effect="slideRight"})
	storyboard.hideOverlay("fromTop", {time = 2000})
end

-- Called when the scene's view does not exist:
function scene:createScene(event)
	local group = self.view

	-- CREATE display objects and add the to 'group' here
	-- Example use-case: Restore 'group' from previously saved state

	local bg = display.newRect(0, 0, display.screenOriginX + 220, display.screenOriginY + 190)
	bg:setFillColor(104, 116, 255)
	bg.x = display.contentWidth/2--display.screenOriginX + 45
	bg.y = display.contentHeight/2 --display.screenOriginY + 45
	group:insert(bg)

	local title = display.newText(group, "You Won!", 0, 0,"Verdana", 28)
	title.x = centerX
	title.y = centerY

	local nextLevelBtn = widget.newButton{
		x = x,
		y = y,
		width = 60,
		height = 40,
		label = "Next",
		size = 16,
		font = "Verdana",
		onEvent = tapBtn,
	}
	group:insert(nextLevelBtn)
	nextLevelBtn.x = display.screenOriginX + 220
	nextLevelBtn.y = display.screenOriginY + 350

	local retryLevelBtn = widget.newButton{
		x = x,
		y = y,
		width = 60,
		height = 40,
		label = "Again",
		size = 16,
		font = "Verdana"
		--onRelease = tapBtn,
	}
	group:insert(retryLevelBtn)
	retryLevelBtn.x = display.screenOriginX + 100
	retryLevelBtn.y = display.screenOriginY + 350
end

-- Called immediately after scene has moved onscreen
function scene:enterScene(event)
	local group = self.view
	


end

-- Called whenscene is about tp move offscreen:
function scene:exitScene(event)
	local group = self.view

	-- INSERT code here(e.g stop timers, remove listeners, unload sounds, etc.)

end

-- Called prior to the removal of the scene's view ( display group )
function scene:destroyScene(event)
	local group = self.view

	-- INSERT code here(e.g remove timers, remove widgets, saved state, etc.)
end

----------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
----------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener("createScene", scene)

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener("enterScene", scene)

-- "exitScene" event is dispatched before next scene's transition begins 
scene:addEventListener("exitScene", scene)

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener("destroyScene", scene)

return scene