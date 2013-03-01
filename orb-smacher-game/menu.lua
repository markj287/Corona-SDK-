---------------------------------------------------------------------------------
-- Smach the Orb 
-- Created by Mark Johnson
-- Menu file 
--
---------------------------------------------------------------------------------

local storyboard = require("storyboard")
local scene = storyboard.newScene()

local widget = require "widget"

display.setStatusBar(display.HiddenStatusBar)

-- Local forward references should go here -
local background = display.newImageRect("images/background4.png", 640, 1200)

-- Play button function
local function hitPlayButton (event)
	if event .phase == "release" then 
		storyboard.gotoScene("level1", { effect="slideLeft", time=700})
	end
	print("play button has been hit")
end

-- Sound files
local soundtrack = audio.loadStream( "audio/soundtrack.mp3" )
local popSound = audio.loadSound( "audio/orb-smach.wav" )
local winSound = audio.loadSound( "audio/winSound.wav" )
local loseSound = audio.loadSound( "audio/loseSound.wav" )



-- Called when the scene's view does not exist:
function scene:createScene(event)
	local group = self.view

	-- CREATE display objects and add the to 'group' here
	-- Example use-case: Restore 'group' from previously saved state

	-- Play button GUI
	local playBtn = widget.newButton{
		id = "001_id",
		label = "Play",
		font = "Verdana",
		width = 200, height = 40,
		font = "Verdana",
		strokeWidth = 2,
    		strokeColor = {255, 255, 255},
    		defaultColor = {227,209,9},
    		overColor = {201,187,28},
		fontSize = 22,
    		cornerRadius = 4,
    		onEvent = hitPlayButton
	}
	group:insert(playBtn)
	playBtn.x = display.contentWidth/2
	playBtn.y = display.contentHeight/2
end

-- Called immediately after scene has moved onscreen
function scene:enterScene(event)
	local group = self.view
	
	-- INSERT code here(e.g. start timers, load audio, start listeners, etc.)

	local audioIsPlaying = true 

	-- Audio Channels 
	audio.reserveChannels( 2 ) -- reserve 2 different chanels 
	soundChanMusic = 1
	soundChanSFX = 2 

	

	local allSFX = { popSound, winSound, loseSound } -- Table with all sound affects 

	-- Play music 
	--audio.play(soundtrack)

	

	

	
  
  	-- Options button function
  	local function hitOptionsButton (event)
		if event .phase == "release" then 
			storyboard.gotoScene("options", "slideLeft")
		end
		print("options button has been hit")
	end

	-- Options button GUI
	local optionsBtn = widget.newButton{
		id = "002_id",
		label = "Options",
		font = "Verdana",
		width = 200, height = 40,
		strokeWidth = 2,
    		strokeColor = {255, 255, 255},
    		defaultColor = {247,227,0},
    		overColor = {201,187,28},
		font = "Verdana",
		fontSize = 22,
    		cornerRadius = 4,
    		onEvent = hitOptionsButton
	}
	group:insert(optionsBtn)
	optionsBtn.x = display.contentWidth/2 
	optionsBtn.y = display.contentHeight/2 +  60

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
