local Task = {}
Task.__index = Task

function Task.Add(Dict_One, Dict_Two)
	assert(type(Dict_One) == 'table')
	assert(type(Dict_Two) == 'table')

	for Index , Value in pairs(Dict_Two) do
		if type(Value) == 'table' then
			if type(Dict_One[Index] or false) == 'table' then
				Task.Add(Dict_One[Index] or {}, Dict_Two[Index] or {})
			else
				Dict_One[Index] = Value
			end
		else
			Dict_One[Index] = Value
		end
	end

	return Dict_One
end

function Task.GetKeys(Dict)
	assert(type(Dict) == 'table')

	local Int = 0

	for Index in pairs(Dict) do
		Int += 1
	end

	return Int
end

function Task.OnChange(Dict, OnChange)
	assert(type(Dict) == 'table')
	assert(type(OnChange) == 'function')

	local Meta = {
		__index = Dict,
		__newindex = function (self, Key, Value)
			if type(Value) == 'table' then
				rawset(Dict, Key, Task.OnChange(Value, OnChange))
			else
				rawset(Dict, Key, Value)
			end
			OnChange(Dict, Key, Value)
		end
	}
	
	for Key, Value in pairs(Dict) do
		if type(Value) == 'table' then
			Dict[Key] = Task.OnChange(Value, OnChange)
		end
	end
	
	return setmetatable({}, Meta)
end

return Task