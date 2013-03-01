---------------------------------------------------------------------------------
-- Smach the Orb 
-- Created by Mark Johnson
-- Main file 
---------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

-- require controller module
local storyboard = require ( "storyboard" )
--storyboard.purgeOnSceneChange = true

-- load first screen
storyboard.gotoScene( "menu" )

local myVar = 10



