--Dict+ Functions
--If you do not know how to use, read the Documentation module script

local Dict = {}

-- // Modules \\ --
local func  = require(script.Parent.func)
local signal  = require(script.Parent.signal)


function Dict.getn(Dictionary)
	assert(type(Dictionary) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(Dictionary)
	)
	
	for _, v in pairs(Dictionary) do   
		if type(v) == 'table' then  
			return func.recurse(Dictionary)
		else
			return 0
		end
	end
end


function Dict.changed(Dictionary)
	assert(type(Dictionary) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(Dictionary)
	)
	
	for _, v in pairs(Dictionary) do   
		if type(v) == 'table' then  
			
			local Event = signal:new()
			
			func.listenToDeepChanges(Dictionary, function(__t , __k, __v)
				Event:Fire(__k , __v)
			end)
			

			return Event
		else
			return nil
		end
	end
end


return Dict
