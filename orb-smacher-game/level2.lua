---------------------------------------------------------------------------------
-- Smach the Orb 
-- Created by Mark Johnson
-- Level2 file 
---------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local storyboard = require("storyboard")
scene = storyboard.newScene()

local widget = require "widget"

-- Local forward references should go here --
local background = display.newImageRect("images/background3.png", 640, 1200)




-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- CREATE display objects and add the to 'group' here
	-- Example use-case: Restore 'group' from previously saved state

	storyboard.removeScene("mainmenu")
	display.remove(worldText)

end

-- Called immediately after scene has moved onscreen
function scene:enterScene( event )
	local group = self.view

	-- INSERT code here(e.g. start timers, load audio, start listeners, etc.)

	local function buttonHit ( event )
		if event .phase == "release" then 
			storyboard.gotoScene("mainmenu", "slideLeft")
		end
		print("Bt has been hit")
	end

	local backBtn = widget.newButton{
		id = "001",
		label = "Back",
		font = "Verdana",
		width = 60, height = 40,
    		cornerRadius = 4,
    		onEvent = buttonHit
	}
	group:insert(backBtn)
	backBtn.x = display.contentWidth - 280
	backBtn.y = display.contentHeight - 440

end

-- Called whenscene is about tp move offscreen:
function scene:exitScene( event )
	local group = self.view

	-- INSERT code here(e.g stop timers, remove listeners, unload sounds, etc.)
	display.remove(worldText)


end

-- Called prior to the removal of the scene's view ( display group )
function scene:destroyScene( event )
	local group = self.view

	-- INSERT code here(e.g remove timers, remove widgets, saved state, etc.)
		display.remove(worldText)
end


----------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
----------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener("createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener("enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins 
scene:addEventListener("exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

return scene