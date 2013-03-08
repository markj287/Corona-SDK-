--
-- Created by IntelliJ IDEA.
-- User: markjohnson
-- Date: 3/7/13
-- Time: 2:28 AM
-- To change this template use File | Settings | File Templates.
--

local physics = require "physics"
physics.start()

local square = display.newRect(20,20,20,20)
physics.addBody(square, "dynamic")