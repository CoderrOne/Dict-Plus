### Functions

As you are aware this module comes with lots of functions that can be used from any script as you can require it.

This is the basic table we will be using:
```lua
local d = require(game.ReplicatedStorage.DictModule) -- This can be you requiring the module

local a  = {    -- This is a test table that we will use
	['Lol'] = {
		['Hi'] = 1,
		['Bruh'] = 2,
	}
}

```
## module.find
In order to find a spefic Key in this table you should do:
```lua
print(d.find(a.Lol, 'Hi'))   -- 1
```
d.find can be used on a regular table to do this
```lua
print(d.find(a), 'Lol')
```
The first argument must be the dict you are looking in and the second argument being the string Key Name
## module.remove
You can also Remove Key's in a dict. The way to do this is to use ``d.remove``
```lua
print(d.remove(a.Lol, 'Hi')) 
```
The first arg must be the dict and the second arg must be the string name of what you are removing. Hence any refrences to ``a.Lol.Hi`` will be nil as it's gone from the table.
## module.encode & decode
Another feature is to encode and decode dict. This will be useful if you plan to encode and decode many Dict's.
```lua
print(d.encode(a)) -- {"Lol":{"Hi":1,"Bruh":2}}
print(d.decode(a)) -- This would return its memory address 
```
## module.getn
Another feature is to get the amount of keys in a dict by running this:
```lua
print(d.getn(a))
```
This would return 2

## module.changed
Lastly the a feature called ``d.changed(a)`` This behaves like a ``RBXScriptSignal``. All you need to do is call on it with a dict and connect it, like this:
```lua
d.changed(a):Connect(function(key, value)
	print(key)
	print(value)
end)



a.Lol.Hi = 3 -- Changing the value to spur the .Changed
```
The arguments it returns is the key that changes and its value. In this case it prints:
```lua
Hi
3
```
As it detects the change. This can be also used for deep tables that have tables nested inside of it. This allows you quickly set up .changed for your dict's and see when it changes.

## module.unpack
This will return a tuple with a dict. This may have many caveats to it but works simply.

```lua
local b,l,u = d.unpack({Hi = 1, Bye = 2, Lol =  2})

print(b,l,u)
```
This will be in pairs with its Key and Value so this returns 
``[Hi, 1], [Bye, 2], [Lol, 2]``
But they are still in table format in their isolated pairs.


## Caveats 
This may only work with Dict's an not tables in the future i may add support for tables for the ``.changed`` event. Since listening for changes was done for the intent of dict use it may not work with a regular array.