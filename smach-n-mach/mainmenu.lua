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
local isMscOn = true 
local isSfxOn
audio.reserveChannels(1) -- reserves two audio channels 

soundChanMusic = 1

local soundPop = audio.loadSound("audio/loudPopSfx.mp3")
local soundMusic = audio.loadStream("audio/SneakySnitchST.mp3")


---------- Game constants ----------
local centerX = display.contentWidth * .5 
local centerY = display.contentHeight * .5

---------- Level functions ----------
local function hitPlayButton(event)
	if event.phase == "release" then
		storyboard.gotoScene("level1", "fade", 300)
	end
end

local function hitOptionsButton(event)
	if event.phase == "release" then
		storyboard.gotoScene("options", "fade", 300)
	end
end

--- Music Sections ---
	local function playSfx (event)
		if isMscOn then
			audio.play(soundMusic)
		end
	end

	local function playAudio()
		playSfx()
	end

	local function stopAudio()
		audio.stop()
		audio.rewind(soundMusic)
	end

	local function playPopSound()
		audio.play(soundPop)
	end

-- Title screen options table
local titleScreenOpts = {
	delay = 1000,
	time= 800,
	x= centerX,
	y= centerY - 210,
	transition= easing.inOutExpo
}

-- Make title screen appear	
local function titleAppear()
	transition.to(gameTitle, titleScreenOpts)
end


---------- This will be called when the scene view does not exist ----------
function scene:createScene(event)
	local mainMenuGroup = self.view

	background = display.newImageRect("images/iphonebg.png", 320, 570)
	mainMenuGroup:insert(background)
	background.x = centerX
	background.y = centerY

	gameTitle = display.newImageRect("images/game-title.png", 310, 100)
	mainMenuGroup:insert(gameTitle)
	gameTitle.x = centerX 
	gameTitle.y = centerY + 340
	
	-- Calls game functions
	titleAppear()
	playAudio()
	--stopAudio()
	--playPopSound()
	
	playBtn = widget.newButton {
	 	id = "001_id",
	 	default = "images/play-btn.png",
	 	over = "images/play-btn.png",
	 	width = 100,
	 	height = 100,
	 	onEvent = hitPlayButton
	}
	mainMenuGroup:insert(playBtn)
	playBtn.x = centerX
	playBtn.y = centerY + 340
	
	transition.to(playBtn, {time=1000, x= centerX, y= centerY, transition= easing.inOutExpo})

	settingsBtn = widget.newButton {
	 	id = "001_id",
	 	default = "images/settings-btn.png",
	 	over = "images/settings-btn.png",
	 	width = 48,
	 	height = 48,
	 	onEvent = hitOptionsButton
	}
	mainMenuGroup:insert(settingsBtn)
	settingsBtn.x = 40
	settingsBtn.y = display.contentHeight - settingsBtn.contentHeight + 10	

end

---------- Called when after scene has moved onscreen ----------
function scene:enterScene(event)
	-- Remove previous scene
	
	
end

---------- Called when scene is about to move offscreen ----------
function scene:exitScene(event)
	

end

---------- Called prior to the removal of scene's "view" (display group) ----------
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









