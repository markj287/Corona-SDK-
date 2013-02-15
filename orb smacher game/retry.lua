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

-- Called when the scene's view does not exist:
function scene:createScene(event)
	local group = self.view

	-- CREATE display objects and add the to 'group' here
	-- Example use-case: Restore 'group' from previously saved state
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




