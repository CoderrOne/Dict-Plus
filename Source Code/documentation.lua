                                                                                                                                                                                                                                                                                                                               --[[
===============================================================

 ______   ___   _______  _______      _    
|      | |   | |       ||       |   _| |_  
|  _    ||   | |       ||_     _|  |_   _| 
| | |   ||   | |       |  |   |      |_|   
| |_|   ||   | |      _|  |   |            
|       ||   | |     |_   |   |            
|______| |___| |_______|  |___|         

           V1.1 :: By Coder_1 | Documentation + Tutorial
   
===============================================================                                                 

     Welcome to Dict+ ~ Coder_1
     
     This is a full module for Dictionaries allowing a user to have full control manipulating
     Dictionaries to their needs. This description will aid you on what methods are available
     and their usage. There is also on a tutorial on how to use this module, Make sure to read it!
     
     ------------------------------------------------------------------------------
     
     What is a Dictionary?
     
     A dictionary is a general-purpose data structure for storing a group of objects. 
     Normally, dictionaries has a set of keys and each key has a single associated value.
     Dictionaries can not be treated as a standard array, the method of dealing with
     dictionaries are diffrent, when compared to an array.
     
     Array:
     
     local Array = {Blue, Yellow, Car, Hi}
     
     Dictionary:
     
     local Dict = {
          ['Foo'] = {
              Bar = {},
              Baz = false
          },
          
          ['Baz'] = {
              Bar = {},
              Foo = true
          }
     }
     
     Dictionaries are more useful for storing a group of objects rather than an array.
     
     ------------------------------------------------------------------------------
     
     Getting Started
     
     To start off you must require the module; This module can be used anywhere either in client or server,
     it is advised to have the module in a container which can be accessed by both client and server.
     A good choice is 'game.ReplicatedStorage'.
     
     How to require the module
     
     Luau has 'require' which can be used to require the module. First off you must know where the module is if
     it is in secondary container for example 'game.ReplicatedStorage.Folder['Dict+']'. Ok now that you have the module
     location you can now require it.
     
     local DictionaryModule = require(game.ReplicatedStorage.Folder['Dict+'])
     
     It is advised to have the module in a variable for ease of use later on.
     
     Thanks for using my module ;) Coder_1
     
     ------------------------------------------------------------------------------
     
     Functions:
     
     DictionaryModule.changed
     DictionaryModule.getn
     
==============================================================================
     
     Function | Changed :: DictionaryModule.changed :: Returns a RBXScriptSignal
     
     DictionaryModule.changed(Dict):Connect(function(NewKey, NewValue)
         print(NewKey .. ", Has changed to:  " .. NewValue)
     end)
     
     -----------------------------------
     
     RBXScriptSignal :: Will fail if you do not connect to it
     
     If the Dictionary is not changed the Event will not fire; if the Dictionary suddenly becomes nil,
     it may error.
     
     If it does fail; It will return nil, instead of RBXScriptSignal
     
     Make sure the argument you are giving the function is a dictionary, otherwise it might fail
     
     -----------------------------------
     
     Function | Getn :: DictionaryModule.getn :: Returns the amount of key's in a Dictionary
     
     print(DictionaryModule.getn(Dict)) -- 2  
     
     -----------------------------------
     
     Int :: Returns a integer of how many keys there are



     -----------------------------------

     BETA FUNCTIONS:
     * WARNING: This beta functions could not work or be very laggy; they are in the middle
     of becoming actual function's so use with caution *

     Function | Add :: DictionaryModule.add :: Returns the keys of two dictionaries together.
     For example

     local t1 = {['Foo'] = 'Bar', ['Baz'] = 'Foo'}
     local t2 = {['Baz2'] = 'Foo1', ['Foo2'] = 'Bar2'}

     DictionaryModule.add(t1, t2) -- Return's ::

    {
     ["Baz"] = "Foo",
   
     ["Foo2"] = "Bar2",
 
     ["Foo"] = "Bar",
  
     ["Baz2"] = "Foo1"
    }


==============================================================================    

     Function Examples ::
     
     local DictPlus = require(script.Parent.Parent)

     local MyDictionary = {
	    ['Foo'] = {
		  Bar = {},
		  Baz = false
	    },
	    ['Baz'] = {
		  Hi = 'lol'
	    }
     }

    DictPlus.changed(MyDictionary):Connect(function(NewKey, NewValue)
	   print(NewKey .. ", changed to: ")
	   print(NewValue)
    end)

    MyDictionary['Foo'].Baz = true

    print(DictPlus.getn(MyDictionary)) 
    
    The getn will return Two because there are two keys in the Dict,
    The changed will return Baz, changed to: true
     
     
==============================================================================    

     If you have any suggestions, errors or any problems you can message my discord: Yum#8442
     Or you could open a new issue on my github page.
 
     Thanks for using my module ;) 
                                                                                                                                                                                                                                                                                                                                 29/09/20 
                                                                                                                                                                                                                                                                                                                                 ]]