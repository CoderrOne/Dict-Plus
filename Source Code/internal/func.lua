
--  Functions neccessary for the functioning of Dict Plus

function concat (t1, t2)
	assert(type(t1), 
		'bad argument #1 expected a table got a: '.. type(t1))
	assert(type(t2), 
		'bad argument #1 expected a table got a: '.. type(t2))
	
	
	for __k , __v in pairs(t2) do
		if type(__v) == 'table' then
			if type(t1[__k] or false) == 'table' then
				func.concat(t1[__k] or {}, t2[__k] or {})
			else
				t1[__k] = __v
			end
		else
			t1[__k] = __v
		end
	end
	
	return t1
end

function recurse (t)
	assert(type(t) == 'table', 'bad argument #1 expected a table got a: ' .. type(t))
	
	local a = 0
	
	for index in pairs(t) do
		a += 1
	end
	
	

	return a
end

function listenToDeepChanges (t, onChange)
	assert(type(t) == 'table', 'bad argument #1 expected a table got a: ' .. type(t))
	assert(type(onChange) == 'function', 'bad argument #2 expected a function got a:  ' .. type(onChange))
	
	local mt = {
		__index = t,
		__newindex = function (self, k, v)
			if type(v) == 'table' then
				rawset(t, k, func.listenToDeepChanges(v, onChange))
			else
				rawset(t, k, v)
			end
			onChange(t, k, v)
		end
	}
	for k, v in pairs(t) do
		if type(v) == 'table' then
			t[k] = func.listenToDeepChanges(v, onChange)
		end
	end
	return setmetatable({}, mt)
end

return {
	recurse = recurse;
	concat = concat;
	listenToDeepChanges = listenToDeepChanges;
}
