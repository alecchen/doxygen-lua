---------------------------------
--! @file
--! @brief a Doxygen::Lua example
---------------------------------

PARAMETER = {
    --! table is supported
    a = 1,
    b = 2, --! end of line comment is also supported
    c = 3,
}

--! my name
AUTHOR = 'Alec Chen'

--! my email
EMAIL = 'alec@cpan.org'

--! @brief The factorial is an example of a recursive function
--! @param n a positive integer
--! @return return the product of all positive integers less than or equal to n

function factorial(n)
    x = 10
    y = 20
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

--! @brief a simple function declared local
local function localFunction()
end

--! a function namespace
luaCharacter = inheritsFrom( nil, "luaCharacter" )

--! @brief luaCharacter:reset
function luaCharacter:reset()
end 

--! @brief luaCharacter:destroy
function luaCharacter:destroy()
end 

--! @brief luaCharacter:entry_point
function luaCharacter:entry_point()
end 
