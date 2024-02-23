# Function to estimate the machine precision using the iterative algorithm
# in Ruggiero and Lopes' book Cálculo Numérico.

function estimate_eps(A, s)
    while s > 1
        A = A / 2
        s = 1 + A
    end
    precision = 2 * A
    return precision
end

# Function from another assignment, to estimate the precision with different parameters
function estimate_eps_2(VAL)
    A = 1
    s = VAL + A

    while s > VAL
        A = A / 2
        s = VAL + A
    end
    precision = 2 * A
    return precision
end

# List with test values
# vals = [10, 17, 100, 184, 1000, 1575, 10000, 17893]

# Run all tests from the course assignment (and as a bonus, Julia's Float16 precision)
println("Estimated Precisions:\n")
println("Estimated 16bit machine precision is: ", estimate_eps(Float16(1.0), Float16(2.0))) # A = 1, s = 2
println("Estimated 32bit machine precision is: ", estimate_eps(Float32(1), Float32(2))) # A = 1, s = 2
println("Estimated 64bit machine precision is: ", estimate_eps(Float64(1), Float64(2))) # A = 1, s = 2
println("")


# println("Estimated Precisions using the following values (64bit): ", vals)
# for val in vals
#     println("Machine precision for VAL = ", val, " is: ", estimate_eps_2(val))
    
# end



