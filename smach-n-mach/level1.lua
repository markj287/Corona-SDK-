-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- Level 1.lua
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

-- Game constants
local centerX = display.contentWidth * .5 
local centerY = display.contentHeight * .5

-- Level functions
local function hitBackButton(event)
	if event.phase == "release" then
		storyboard.gotoScene("mainmenu", "fade", 300)
	end
end

local function hitPauseButton(event)
	if event.phase == "release" then
		storyboard.showOverlay("pause-screen", {"fade", 300, isModal = true} )
	end
end

-- This will be called when the scene view does not exist 
function scene:createScene(event)
	local levelGroup = self.view
	
	-- insert background image
	background = display.newImageRect("bg-new.png", 320, 480)
	background.x = centerX
	background.y = centerY
	levelGroup:insert(background)

	-- Test text to make sure am on the right level
	levelText = display.newText("level 1", 0, 0, native.systemFontBold, 24)
	levelText:setTextColor(255)
	levelText:setReferencePoint(display.CenterReferencePoint)
	levelText.x = centerX
	levelText.y = centerY
	levelGroup:insert(levelText)

	backBtn = widget.newButton {
		id = "001_id",
		default = "back-btn.png",
		over = "back-btn.png",
		width = 48,
		height = 48,
		onEvent = hitBackButton
	}
	levelGroup:insert(backBtn)
	backBtn.x = display.screenOriginX + 35
	backBtn.y = display.screenOriginY + 35
	
	pauseBtn = widget.newButton {
	 	id = "001_id",
	 	default = "pause-btn.png",
	 	over = "pause-btn.png",
	 	width = 48,
	 	height = 48,
	 	onEvent = hitPauseButton
	}
	--pauseBtn:setReferencePoint(bottomRightReferencePoint)
	levelGroup:insert(pauseBtn)
	pauseBtn.x = display.viewableContentWidth - 35
	pauseBtn.y = display.viewableContentHeight * .5
	
end

-- Called when after scene has moved onscreen
function scene:enterScene(event)
	-- Removes previous scene
	storyboard.purgeScene("mainmenu")
	
end

-- Called when scene is about to move offscreen
function scene:exitScene(event)
	
	

end

-- Called prior to the removal of scene's "view" (display group)
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
