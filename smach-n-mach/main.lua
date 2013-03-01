-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- main.lua
--
-------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local storyboard = require "storyboard"
local widget = require "widget"

-- load main menu 
storyboard.gotoScene("mainmenu")