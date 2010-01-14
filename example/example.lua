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
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end
