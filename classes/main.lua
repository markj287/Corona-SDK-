------------------------------------------------------------------------------
-- 
-- Main.lua
--
------------------------------------------------------------------------------
local team = require ("team")

--[[
-- A table 
local myTable = {}

myTable.name = "mark" 
myTable.age = 25

-- Different syntax to access the table 
-- myTable["name"] = "mark"

-- Can also use functions 
function myTable:sayHello()	
	print(myTable.name)
end

myTable:sayHello() -- prints "mark"

-- If i want to create a new table i would have to do it all over again. This is the power of classes
--]]


-- creates a new object of new class
local mark = person.newPerson("Mark", 26)
local danika = person.newPerson("Danika", 22)

print(mark.age)
danika:sayName()


local team1 = team.newTeam()
team1:addMember("Mark", 25)
team1:addMember("Danika", 22)

team1:rollCall()








