------------------------------------------------------------------------------
-- 
-- Team Class 
--
------------------------------------------------------------------------------
module(..., package.seeall) -- enables the content from this to be seen by other modules

local person = require "person"


function newTeam()
	local object = {}

	object.members = {}

	function object:addMember( p,q )
		object.members[table.getn(object.members) + 1] = person.newPerson(n,a)
	end

	function object:rollCall()
		for i = 1, table.getn(object.members), 1 do
			print (object.members[i]:sayName())
		end
	end

	return object
end


