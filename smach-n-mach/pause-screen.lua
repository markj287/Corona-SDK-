-------------------------------------------------------------------------
--
-- Mark Johnson
-- Smach and Mash v 0.1 alpha
-- pause screen.lua 
--
-------------------------------------------------------------------------
local widget = require "widget"
local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- Next button on win/pause screen
local function hitNextBtn(event)
	if event.phase == "release" then
		storyboard.gotoScene("level2", "fade", 300)
	end
end

local function hitUnpauseBtn(event)
	if event.phase == "release" then
		storyboard.hideOverlay()
	end
end


-- Called when scene view does not exist 
function scene:createScene(event)
	local group = self.view

	local bg = display.newImage("images/pause-menu.png")
	bg.x = display.contentWidth * .5
	bg.y = display.contentHeight * .5
	group:insert(bg)

	local pauseText = display.newText("Pause", 0,0, native.systemFont, 48)
	pauseText.x = display.contentWidth * .5 
	pauseText.y = display.contentHeight * .5 - 30
	group:insert(pauseText)

	local nextBtn = widget.newButton{
		id = "001_id",
		label = "next",
		width = 44,
		height = 44,
		onRelease = hitNextBtn
	}
	nextBtn.x = display.contentWidth * .5 + 70
	nextBtn.y = display.contentHeight * .5 + 30
	group:insert(nextBtn)

	local unPauseBtn = widget.newButton{
		id = "001_id",
		label = "back",
		width = 44,
		height = 44,
		onRelease = hitUnpauseBtn
	}
	unPauseBtn.x = display.contentWidth * .5 - 70
	unPauseBtn.y = display.contentHeight * .5 + 30
	group:insert(unPauseBtn)

end

function scene:enterScene(event)

end

function scene:exitScene(event)

end

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





