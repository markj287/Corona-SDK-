-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- Level 2.lua
--
-------------------------------------------------------------------------
local widget = require "widget"
local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- Start implemention 
-- Define all my functions here along with all game images, sounds, etc..
local background 
local gameTitle 
local playBtn 
local backBtn 
local levelText
local pauseBtn

---------- Game constants ----------
local centerX = display.contentWidth * .5 
local centerY = display.contentHeight * .5

---------- Game functions ----------
local function hitPauseButton(event)
	if event.phase == "release" then
		storyboard.showOverlay("pause-screen", {"fade", 300, isModal = true} )
	end
end

---------- Called when scene view does not exist ----------
function scene:createScene(event)
	local group = self.view

	-- insert background image
	background = display.newImageRect("images/iphonebg.png", 320, 570)
	background.x = centerX
	background.y = centerY
	group:insert(background)

	-- Test text to make sure am on the right level
	levelText = display.newText("level 2", 0, 0, native.systemFontBold, 24)
	levelText:setTextColor(255)
	levelText:setReferencePoint(display.CenterReferencePoint)
	levelText.x = centerX
	levelText.y = centerY
	group:insert(levelText)

	pauseBtn = widget.newButton {
	 	id = "001_id",
	 	default = "images/pause-btn.png",
	 	over = "images/pause-btn.png",
	 	width = 48,
	 	height = 48,
	 	onEvent = hitPauseButton
	}
	--pauseBtn:setReferencePoint(bottomRightReferencePoint)
	group:insert(pauseBtn)
	pauseBtn.x = display.viewableContentWidth - 35
	pauseBtn.y = display.viewableContentHeight * .06

end

function scene:enterScene(event)

end

function scene:exitScene(event)

end

function scene:destroyScene(event)

end

-- END OF YOUR IMPLEMENTATION

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene