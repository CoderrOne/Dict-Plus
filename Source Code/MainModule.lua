--     Allows you to have greater precision with dictionaries
--@    Documentation https://coderrone.github.io/Dict-Plus/

--/ Libraries
local func    = require(script.internal.func)
local signal  = require(script.internal.signal)


function getn (t)
	assert(type(t) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t))
	
	for _, v in pairs(t) do   
		if type(v) == 'table' then  
			return func.recurse(t)
		else
			return 0
		end
	end
end

function changed (t)
	assert(type(t) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t))
	
	for index , value in pairs(t) do   
		if type(v) == 'table' then  
			
			local CustomSignal = signal:new()
			
			func.listenToDeepChanges(t, function(__t , __k, __v)
				Event:Fire(__k , __v)
			end)
			

			return CustomSignal
		end
	end

	return nil
end
--@   BETA - use at your own risk
function add (t1, t2)
	assert(type(t1) == 'table',
		'bad argument #1: expected a dictionary, got a ' .. type(t1))
	assert(type(t2) == 'table',
		'bad argument #2: expected a dictionary, got a ' .. type(t2))
	
	return func.concat(t1, t2)
end

return {
	getn = getn;
	changed = changed;
	add = add;
}
