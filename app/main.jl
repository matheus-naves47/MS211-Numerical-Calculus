# Dependencies
# include("../src/machine_epsilon.jl")
include("../src/functions_zeroes.jl")

using .FunctionZeroes
using Printf
using Latexify

# Definition of parameters and functions
functions_display = ["exp(1.0)^(-(x^2)) - cos(x)", "x^3 - x - 1", "4 * sin(x) - exp(1)^x", "x * log10(x) - 1"]

functions = [x -> exp(1.0)^(-(x^2)) - cos(x), x -> x^3 - x - 1, x -> 4 * sin(x) - exp(1)^x, x -> x * log10(x) - 1]
derivatives = [x -> -(2 * x) * exp(1.0)^(-(x^2)) + sin(x), x -> 3x^2 - 1, x -> 4 * cos(x) - exp(1)^x, x -> (log(x) + 1) / log(10)]
fpi_functions = [x -> cos(x) - exp(1.0)^(-(x^2)) + x, x -> cbrt(x + 1), x -> x - 2 * sin(x) + 0.5 * exp(1)^x, x -> x - 1.3 * (x * log10(x) - 1)]

intervals = [[1, 2], [1, 2], [0, 1], [2, 3]]

initial_guesses_fpi = [1.5, 1, 0.5, 2.5] # For Fixed Point Iteration Method
initial_guesses_newton = [1.5, 0, 0.5, 2.5] # For Newton's Method
initial_guesses_secant = [[1, 2], [0, 0.5], [0, 1], [2.3, 2.7]] # For Secant Method

tols = [1e-4, 1e-6, 1e-5, 1e-7] # Tolerances
exponents = [4, 6, 5, 7] # Exponents for tolerances
maxits = 1000

# Initialize global varibles for program control
global prog = 1
global methd = 1

# Program Selection
println("MS211 - Numerical Calculus Project\n")

while prog != 0
    println("Select Program:")
    println("(1) Machine Epsilon Estimation")
    println("(2) Zeros of Functions")
    println("(0) Exit Program")
    global prog = parse(Int64, readline())

    if prog == 0
        println("Program exited sucessfully.")
        exit
    elseif prog == 1 # Machine Epsilon Program
        print("\033c")
        include("../src/machine_epsilon.jl")

    elseif prog == 2 # Zeros of Functions Program
        print("\033c")

        while methd != 0
            println("Zeros of Functions Program\n")
            println("Select Method:")
            println("(1) Bisection Method")
            println("(2) Regula Falsi Method")
            println("(3) Fixed Point Iteration Method")
            println("(4) Newton-Raphson Method")
            println("(5) Secant Method")
            println("(6) All")
            println("(0) Exit Program")
            global methd = parse(Int64, readline())
            # methd = parse(Int64, methd)
            if methd == 0
                println("\033c")
                break
            end
            if !in(methd, range(0, 6))
                error("Invalid option.")
            elseif methd == 1
                println("\n****** Bisection Method ******\n")

                for i in range(1, 4)
                    results = bisection(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                end
            elseif methd == 2
                println("\n****** Regula Falsi Method ******\n")
                for i in range(1, 4)
                    results = regula_falsi(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")

                end
            elseif methd == 3
                println("\n****** Fixed Point Iteration Method ******\n")
                for i in range(1, 4)
                    results = fixed_point_iteration(functions[i], fpi_functions[i], initial_guesses_fpi[i], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")
                end
            elseif methd == 4
                println("\n****** Newton's Method ******\n")
                for i in range(1, 4)
                    results = newton(functions[i], derivatives[i], initial_guesses_newton[i], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")

                end
            elseif methd == 5
                println("\n****** Secant Method ******\n")
                for i in range(1, 4)
                    results = secant(functions[i], initial_guesses_secant[i][1], initial_guesses_secant[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")

                end
            elseif methd == 6

                println("\n****** Bisection Method ******\n")
                for i in range(1, 4)
                    results = bisection(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")
                end

                println("\n****** Regula Falsi Method ******\n")
                for i in range(1, 4)
                    results = regula_falsi(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")

                    println("")

                end

                println("\n****** Fixed Point Iteration Method ******\n")
                for i in range(1, 4)
                    results = fixed_point_iteration(functions[i], fpi_functions[i], initial_guesses_fpi[i], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")
                    println("")
                end

                println("\n****** Newton's Method ******\n")
                for i in range(1, 4)
                    results = newton(functions[i], derivatives[i], initial_guesses_newton[i], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")
                    println("")
                end

                println("\n****** Secant Method ******\n")
                for i in range(1, 4)
                    results = secant(functions[i], initial_guesses_secant[i][1], initial_guesses_secant[i][2], tols[i], maxits)

                    println("Function: ", functions_display[i])

                    @printf "x = %.*e\n" exponents[i] results[1]
                    @printf "f(x) = %.*e\n" exponents[i] results[2]
                    @printf "Error = %.*e\n" exponents[i] results[3]
                    println("Iterations = ", results[4], "\n")
                    println("")
                end
            end
            print("Clear console (y/n)? ")
            clear_console = readline()

            if clear_console == "y"
                print("\033c")
            else
                println("\n")
            end
        end
    end
end


# while prog != 0



#     if prog == 0
#         break
#     elseif prog == 2
#         println("Zeros of Functions Program\n")
#         println("Select Method:")
#         println("(1) Bisection Method")
#         println("(2) Regula Falsi Method")
#         println("(3) Fixed Point Iteration Method")
#         println("(4) Newton-Raphson Method")
#         println("(5) Secant Method")
#         println("(6) All")
#         println("(0) Exit Program")
#         methd = readline()
#         methd = parse(Int64, methd)
#         while methd != 0
#             if methd == 0
#                 println("Program exited sucessfully.")
#                 break
#             end
#             if !in(methd, range(0, 6))
#                 error("Invalid option.")
#             elseif methd == 1
#                 println("\n****** Bisection Method ******\n")

#                 for i in range(1, 4)
#                     results = bisection(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                 end
#             elseif methd == 2
#                 println("\n****** Regula Falsi Method ******\n")
#                 for i in range(1, 4)
#                     results = regula_falsi(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")

#                 end
#             elseif methd == 3
#                 println("\n****** Fixed Point Iteration Method ******\n")
#                 for i in range(1, 4)
#                     results = fixed_point_iteration(functions[i], fpi_functions[i], initial_guesses_fpi[i], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")
#                 end
#             elseif methd == 4
#                 println("\n****** Newton's Method ******\n")
#                 for i in range(1, 4)
#                     results = newton(functions[i], derivatives[i], initial_guesses_newton[i], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")

#                 end
#             elseif methd == 5
#                 println("\n****** Secant Method ******\n")
#                 for i in range(1, 4)
#                     results = secant(functions[i], initial_guesses_secant[i][1], initial_guesses_secant[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")

#                 end
#             elseif methd == 6

#                 println("\n****** Bisection Method ******\n")
#                 for i in range(1, 4)
#                     results = bisection(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")
#                 end

#                 println("\n****** Regula Falsi Method ******\n")
#                 for i in range(1, 4)
#                     results = regula_falsi(functions[i], intervals[i][1], intervals[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")

#                     println("")

#                 end

#                 println("\n****** Fixed Point Iteration Method ******\n")
#                 for i in range(1, 4)
#                     results = fixed_point_iteration(functions[i], fpi_functions[i], initial_guesses_fpi[i], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")
#                     println("")
#                 end

#                 println("\n****** Newton's Method ******\n")
#                 for i in range(1, 4)
#                     results = newton(functions[i], derivatives[i], initial_guesses_newton[i], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")
#                     println("")
#                 end

#                 println("\n****** Secant Method ******\n")
#                 for i in range(1, 4)
#                     results = secant(functions[i], initial_guesses_secant[i][1], initial_guesses_secant[i][2], tols[i], maxits)

#                     println("Function: ", functions_display[i])

#                     @printf "x = %.*e\n" exponents[i] results[1]
#                     @printf "f(x) = %.*e\n" exponents[i] results[2]
#                     @printf "Error = %.*e\n" exponents[i] results[3]
#                     println("Iterations = ", results[4], "\n")
#                     println("")
#                 end
#             end
#             print("Clear console (y/n)? ")
#             clear_console = readline()
#             if clear_console == "y"
#                 print("\033c")
#             else
#                 println("\n")
#             end
#         end
#     end
# end




