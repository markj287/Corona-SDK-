---------------------------------------------------------------------------------
-- Smach the Orb 
-- Created by Mark Johnson
-- Level1 file 
---------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth 
centerY = display.contentHeight
mRand = math.random 
local widget = require "widget"
local button = require "buttoncode"

-- Game Variables 
o = 0
timeRemain = 20 -- Time remain for this level
timeUp = false 
totalOrbs = 30 -- Total orbs for this level 
ready = false 

-- Game images 
local background = display.newImageRect("images/background4.jpg", 640, 1200)

-- Wait text
local display_text = display.newText("Wait", 0, 0, "Verdana", 16*2 )
display_text.xScale = .5
display_text.yScale = .5
display_text:setReferencePoint(display.BottomLeftReferencePoint)
display_text.x = 20
display_text.y = centerY - 20


-- Countdown Text
local countdownText = display.newText(timeRemain, 0, 0, "Verdana", 16*2 )
countdownText.xScale = .5
countdownText.yScale = .5
countdownText:setReferencePoint(display.BottomRightReferencePoint)
countdownText.x = centerX - 20
countdownText.y = centerY - 20

local function buttonHit( action )
	if (action == "play") then 
		audio.play(soundtrack)
	elseif( action == "stop" ) then 
		audio.stop()
	end
end

makeButton("images/play-btn.png", centerX/2, 80, buttonHit, "play")
makeButton("Stop", centerX/2, 120, buttonHit, "stop")

local function winLose (condition)
	if (condition == "win") then 
		display_text.text = "Win!"
	elseif (condition == "fail") then 
		display_text.text = "Fail!"
	end
end

--------------------------------------------------------------------------------------
-- Implement score, when user smach a orb. bonus points when time is left. Save high score
-- Implement storyboard with 5 different levels
-- Add drifting text. Use custom text 
--------------------------------------------------------------------------------------

local function youWon()
	local winText = display.newText("You Won!!", 0, 0, "Verdana", 24)
	winText.x = centerX/2
	winText.y = centerY/2
end

-- Track orb function
local function trackOrbs( obj )
	obj:removeSelf()
	o = o - 1

	if( timeUp ~= true ) then
		-- Makes user not able to get a win condition after time is up
		if ( o == 0 ) then
			audio.play(winSound)
			timer.cancel(gameTmr)
			winLose("win")
			audio.stop()
			--youWon()
		end
	end
end 

local function tmrCountDown( e )
	if (timeRemain == 20 ) then
		ready = true
		display_text.text  = "GO!"
		audio.play(soundtrack)
	end

	timeRemain = timeRemain - 1
	countdownText.text = timeRemain

	if (timeRemain == 0 ) then 
		timeUp = true 

		if ( o ~= 0 ) then
			audio.play(loseSound)
			display_text.text = "fail"
			ready = false
		end

	end
end 

-- Spawn orbs
local function spawnOrbs()
	
	local orb = display.newImageRect("images/yellow_orb.png", 48, 48 )
	orb:setReferencePoint(display.CenterReferencePoint)
	orb.x = mRand( 50, centerX-50 )
	orb.y = mRand( 50, centerY -50 )

	function orb:touch ( e )
		if (ready == true) then 
			-- Makes user not able to smach orb after time runs out 
			if( timeUp ~= true ) then
				if (e.phase == "ended") then 
					-- Play orb smach sound 
					audio.play(popSound)

					-- Remove the orbs. Method trackOrbs will keep track of the orbs 
					trackOrbs(self)
				end
			end
		end
		return true 		
	end

	-- Increment o for every orb created 
	o = o + 1

	orb:addEventListener("touch", orb)

	-- Keep track of when all the orb has been spawn to start countdown
	if ( o == totalOrbs ) then
		-- Calls thr timer every second for a total time of 10, will have to change to go to different levels 
		gameTmr = timer.performWithDelay(1000, tmrCountDown, 20) 
	else
		-- This will make absolutely ready is set to false 
		ready = false
	end

end

tmr = timer.performWithDelay( 30, spawnOrbs, totalOrbs )