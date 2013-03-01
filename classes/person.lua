------------------------------------------------------------------------------
-- 
-- person.lua class 
--
------------------------------------------------------------------------------
module(..., package.seeall) -- enables the content from this to be seen by other modules


-- Function must be global 
function newPerson(n, a) -- name and age 

	local object = {} -- creates a table 
	object.name = n 
	object.age = a 

	function object:sayName( ... )
		return object.name  
	end

	function object:sayAge( ... )
		print(object.age)
	end

	return object

end