-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- main menu.lua
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
local settingsBtn 
local levelText

-- Level functions
local function hitPlayButton(event)
	if event.phase == "release" then
		storyboard.gotoScene("level1", slideDown, 5000)
	end
end

-- Game constants
local centerX = display.contentWidth * .5 
local centerY = display.contentHeight * .5

-- This will be called when the scene view does not exist 
function scene:createScene(event)
	local mainMenuGroup = self.view

	background = display.newImageRect("images/bg.png", 720, 1280)
	mainMenuGroup:insert(background)

	gameTitle = display.newImageRect("images/game-title.png", 310, 100)
	mainMenuGroup:insert(gameTitle)
	gameTitle.x = centerX 
	gameTitle.y = centerY - 190

	playBtn = widget.newButton {
	 	id = "001_id",
	 	default = "images/play-btn.png",
	 	over = "images/play-btn.png",
	 	width = 128,
	 	height = 128,
	 	onEvent = hitPlayButton
	}
	mainMenuGroup:insert(playBtn)
	playBtn.x = centerX
	playBtn.y = centerY

	settingsBtn = display.newImageRect("images/settings-btn.png", 64, 64)
	mainMenuGroup:insert(settingsBtn)
	settingsBtn.x = 40 --display.contentWidth - 280
	settingsBtn.y = display.contentHeight - settingsBtn.contentHeight + 10

end

-- Called when after scene has moved onscreen
function scene:enterScene(event)
	


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









