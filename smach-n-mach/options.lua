-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- options.lua
--
-------------------------------------------------------------------------
local widget = require "widget"
local storyboard = require "storyboard"
local scene = storyboard.newScene()

local isMscOn = true 
local isSfxOn
audio.reserveChannels(1) -- reserves two audio channels 

soundChanMusic = 1 -- reserve audio for channel 1, sfx will automatically play on the next channel

local soundPop = audio.loadSound("loudPopSfx.mp3")
local soundMusic = audio.loadStream("SneakySnitchST.mp3")

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


---------- This will be called when the scene view does not exist ----------
function scene:createScene(event)
	local group = self.view

	background = display.newImageRect("images/iphonebg.png", 320, 570)
	group:insert(background)
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local playMusicBtn = widget.newButton {
		label = "Play Music",
		width = 120,
		height = 68,
		onRelease = playAudio
	}
	playMusicBtn.x = display.contentCenterX
	playMusicBtn.y = 160

	local stopMusicBtn = widget.newButton {
		label = "Stop Music",
		width = 120,
		height = 68,
		onRelease = stopAudio
	}
	stopMusicBtn.x = display.contentCenterX
	stopMusicBtn.y = display.contentCenterY

	local popSoundBtn = widget.newButton {
		label = "Pop",
		width = 120,
		height = 68,
		onEvent = playPopSound
	}
	popSoundBtn.x = display.contentCenterX
	popSoundBtn.y = 320

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

