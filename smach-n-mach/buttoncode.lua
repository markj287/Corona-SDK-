-- Button Code
-- Project: Froggy Went A Hoppin'
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
-- Copyright 2012 J. A. Whye. All Rights Reserved.
-- 

local rButton = {}

-----------------------------------------------------------------------------------------------------------------------
--###################################################################################################################--
--##################################  Check If File Exists Function   ###############################################--
--###################################################################################################################--
-----------------------------------------------------------------------------------------------------------------------
	function doesFileExist(theFile)
		
		--print("theFile: " .. theFile)
		
		local filePath = system.pathForFile(theFile, system.ResourceDirectory)
		local results = false
	        
		if filePath ~= nil then
			local file = io.open(filePath, "r")
		    
		    --If the file exists, return true
		    if file then
				io.close( file )
		        results = true
		    end
		end
	 
	    return results
	end

--====================================================================================
-- make buttons, add event listeners, put in display group, etc.
-- use it like this:
-- 	buttonReset = makeButton("btn-reset2.png", 100, 120, actionReset [, localGroup])
-- 	buttonReset = makeButtonRect("btn-reset2.png", w, h, x, y, actionReset [, localGroup])
-- makeButton(<#fName#>, <#xloc#>, <#yloc#>, <#actionFunc#>, <#parm#>, <#grp#>)
-- makeButtonRect(<#fName#>, <#width#>, <#height#>, <#xloc#>, <#yloc#>, <#actionFunc#>, <#parm#>, <#grp#>)


local buttonName
local iWidth
local iHeight
local actionFunc
local passParm
local xloc
local yloc
local grp

local function makeTheButton()
	-- utility function for the event listener below
	-- pass in an object and X,Y coords and it will 
	-- tell you if the X,Y is inside the object.
	local function ptInsideC(obj, x, y)
		local inside = false
		local objx = obj.x - (obj.width / 2)
		local objy = obj.y - (obj.height / 2)
		if (x >= objx) and 
			(x <= (objx + obj.width)) and 
			(y >= objy) and
			(y <= (objy + obj.height)) then
			inside = true
		end
		return inside
	end
	
	-- the event listener for when the button is touched
	local dBtn
	local buttonIsGraphic = false
	local function buttonTouched(e)
		--print(table.show(e.target))
		local t = e.target
		if e.phase == "began" then
			t.alpha = .5
			t.active = true
			-- see if we should display a pressed button
			-- print("t.pressed " .. tostring(t.pressed))
			if t.pressed then
				-- set the position in case the button was moved before being tapped
				t.pressed.x = t.x
				t.pressed.y = t.y
				t.pressed.alpha = 1
			end
			display.getCurrentStage():setFocus(t)
		elseif e.phase == "moved" and t.active then
			if ptInsideC(t, e.x, e.y) then
				t.alpha = .5
				if t.pressed then
					t.pressed.alpha = 1
				end
			else
				t.alpha = 1
				if t.pressed then
					t.pressed.alpha = 0
				end
			end
		else
			display.getCurrentStage():setFocus(nil)
		end
		if e.phase == "ended" and t.active then
			t.active = false
			if ptInsideC(t, e.x, e.y) then
				t.alpha = 1
				-- get rid of the pressed button
				if t.pressed then
					t.pressed.alpha = 0
					--t.pressed:removeSelf()
					--t.pressed = nil
				end
				if t.action ~= nil then
					--print(table.show(e.target), "foo")
					t.action(t.parm)
				end
				return true
			end
			return true
		end
	end

	-- this is where the button is actually created
	local revStr = buttonName:reverse()
	local button
	if revStr:sub(4, 4) == "." and doesFileExist(buttonName) then
		if iWidth ~= nil then
			button = display.newImageRect(buttonName, iWidth, iHeight)
			--print ("newImageRect")
		else
			button = display.newImage(buttonName)
		end

		--print("--==> " .. buttonName:gsub("[.]", "_pressed."))
		--print(tostring(doesFileExist(buttonName:gsub("[.]", "_pressed."))))
		
		if doesFileExist(buttonName:gsub("[.]", "_pressed.")) then
			if iWidth == nil then
				button.pressed = display.newImage(buttonName:gsub("[.]", "_pressed.", 1))
			else
				button.pressed = display.newImageRect(buttonName:gsub("[.]", "_pressed.", 1), iWidth, iHeight)
				-- print("inside -- " .. buttonName:gsub("[.]", "_pressed."), iWidth, iHeight)
			end
			button.pressed.alpha = 0
			button.pressed.x = xloc
			button.pressed.y = yloc
	
			if grp ~= nil then
				grp:insert(button.pressed)
			end
		else
			button.pressed = nil
		end
		
	else
		-- in here if no button graphic -- just use text
		button = display.newText( buttonName, 0, 0, "Helvetica", 20 )
		button.pressed = nil
	end
	button.x = xloc
	button.y = yloc
	button.height = iHeight
	button.width = iWidth
	--print(buttonName:gsub("[.]", "_pressed.", 1))
	--if doesFileExist(buttonName:gsub("[.]", "_pressed.", 1)) then
		button.name = buttonName
	--else
	--	button.name = nil
	--end
	--print(buttonName)
	button.action = actionFunc
	button.active = false
	button.parm = passParm
	button:addEventListener( "touch", buttonTouched )
	if grp ~= nil then
		print("grp")
		grp:insert(button)
	end
	return button
end

function makeButton(fName, x, y, aFunc, parm, g)
	buttonName = fName
	iWidth = nil
	iHeight = nil
	xloc = x
	yloc = y
	actionFunc = aFunc
	passParm = parm
	grp = g
	return makeTheButton()
end

function makeButtonRect(fName, w, h, x, y, aFunc, parm, g)
	buttonName = fName
	iWidth = w
	iHeight = h
	xloc = x
	yloc = y
	actionFunc = aFunc
	passParm = parm
	grp = g
	return makeTheButton()
end


return rButton

--[[
	
	if a pressed button is indicated, then create that at the same time
		as the main button, but set the alpha to 0.
		Create a property in that button set to the pressed button object.
		This way we can show the dsepressed button right on top of the 
		normal button instead creating it on top of the z-order.
		

	--]]

	