-- Dict Plus
local Dependencies = script.Dependencies

local Signal = require(Dependencies.Signal)
local Task = require(Dependencies.Task)

local Dict = {}
Dict.__index = Dict


function Dict.getn(Dict)
	assert(type(Dict) == 'table')

	for Index, Value in pairs(Dict) do
		if type(Value) == 'table' then
			return Task.GetKeys(Dict)
		else
			return 0
		end
	end
end
Dict.getn = Dict.Getn

function Dict.changed(Dict)
	assert(type(Dict) == 'table')

	for Index , Value in pairs(Dict) do   
		if type(Value) == 'table' then  

			local Prompt = Signal:new()

			Task.OnChange(Dict , function(Dict, Key, Value)
				Prompt:Fire(Key, Value)
			end)


			return Prompt
		end
	end

	return nil
end
Dict.changed = Dict.Changed

-- Beta Functions

function Dict.add(Dict_One, Dict_Two)
	assert(type(Dict_One) == 'table')
	assert(type(Dict_Two) == 'table')

	return Task.Add(Dict_One, Dict_Two)
end
Dict.add = Dict.Add

return Dict