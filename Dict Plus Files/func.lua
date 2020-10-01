local func = {}


function func.recurse(t)
	assert(type(t) == 'table', 'bad argument #1 expected a table got a: ' .. type(t))
	
	local a = 0
	
	for _ in pairs(t) do
		a += 1
	end
	
	-- Changed the old code has sometimes it would return 0  :) Fairly simple

	return a
end


function func.listenToDeepChanges(t, onChange)
	-- Credit: Thanks for Stack overflow and Devforum for helping me with this :)
	assert(type(t) == 'table', 'bad argument #1 expected a table got a: ' .. type(t))
	
	local mt = {
		__index = t,
		__newindex = function (self, k, v)
			if type(v) == "table" then
				rawset(t, k, func.listenToDeepChanges(v, onChange))
			else
				rawset(t, k, v)
			end
			onChange(t, k, v)
		end
	}
	for k, v in pairs(t) do
		if type(v) == "table" then
			t[k] = func.listenToDeepChanges(v, onChange)
		end
	end
	return setmetatable({}, mt)
end


return func
