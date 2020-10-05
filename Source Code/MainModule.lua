--Dict+ Functions
--If you do not know how to use, read the Documentation module script

local Dict = {}


-- // Modules \\ --
local func  = require(script.internal.func)
local signal  = require(script.internal.signal)


function Dict.getn(t)
	assert(type(t) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t)
	)
	
	for _, v in pairs(t) do   
		if type(v) == 'table' then  
			return func.recurse(t)
		else
			return 0
		end
	end
end


function Dict.changed(t)
	assert(type(t) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t)
	)
	
	for _, v in pairs(t) do   
		if type(v) == 'table' then  
			
			local Event = signal:new()
			
			func.listenToDeepChanges(t, function(__t , __k, __v)
				Event:Fire(__k , __v)
			end)
			

			return Event
		else
			return nil
		end
	end
end

 -- // THIS IS A BETA FEATURE USE AT YOUR OWN ADVISORY \\

function Dict.add(t1, t2)
	assert(type(t1) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t1)
	)
	assert(type(t2) == 'table',
		'bad argument #2: expected a dictionary, got a ' .. type(t2)
	)
	
	return func.concat(t1, t2)
end



return Dict
