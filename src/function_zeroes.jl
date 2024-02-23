module FunctionZeroes

export bisection, regula_falsi, fixed_point_iteration, newton, secant

# Routines to find function zeroes using iterative methods

# Bisection Method
function bisection(f, a, b, tol, maxits)

    # Initial checks
    if sign(f(a)) == sign(f(b))
        println("Error: the function has the same sign at the interval extremes.")
        exit(1)
    end

    if abs(b - a) < tol
        xbar = (a + b) / 2
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    for k in 1:maxits
        m = f(a)
        x = (a + b) / 2

        if abs(f(x)) < tol
            xbar = x
            fx = f(xbar)
            err = abs(b-a)
            return xbar, fx, err, k            
        end

        if m * f(x) > 0
            a = x

            if abs(b - a) < tol
                xbar = (a + b) / 2
                fx = f(xbar)
                err = abs(b - a)
                return xbar, fx, err, k
            end
        else
            b = x

            if abs(b - a) < tol
                xbar = (a + b) / 2
                fx = f(xbar)
                err = abs(b - a)
                return xbar, fx, err, k
            end
        end
    end
end

# Regula Falsi Method
function regula_falsi(f, a, b, tol, maxits)

    # Initial checks
    if sign(f(a)) == sign(f(b))
        println("Error: the function has the same sign at the interval extremes.")
        exit(1)
    end

    if (b - a) < tol
        xbar = (a + b) / 2
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    if abs(f(a)) < tol
        xbar = a
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    elseif abs(f(b)) < tol
        xbar = b
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    for k in 1:maxits
        m = f(a)
        x = ((a * f(b)) - (b * f(a))) / (f(b) - f(a))

        if abs(f(x)) < tol
            xbar = x
            fx = f(xbar)
            # err = min(abs(x - a), abs(x - b))
            err = abs(b - a)
            return xbar, fx, err, k
        end

        if m * f(x) > 0
            a = x

            if abs(b - a) < tol
                xbar = (a + b) / 2
                fx = f(xbar)
                # err = min(abs(x - a), abs(x - b))
                err = abs(b - a)
                return xbar, fx, err, k
            end
        else
            b = x

            if abs(b - a) < tol
                xbar = (a + b) / 2
                fx = f(xbar)
                # err = min(abs(x - a), abs(x - b))
                err = abs(b - a)
                return xbar, fx, err, k
            end
        end
    end
end

# Fixed Point Iteration Method
function fixed_point_iteration(f, q, x0, tol, maxits)

    # Initial checks
    if abs(f(x0)) < tol
        xbar = x0
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    for k in 1:maxits
        xk = q(x0)

        if abs(f(xk)) < tol || abs(xk - x0) < tol
            xbar = xk
            fx = f(xbar)
            err = abs(xk - x0)
            return xbar, fx, err, k
        end
        
        x0 = xk
    end
end

# Newton-Raphson's Method
function newton(f, fprime, x0, tol, maxits)

    # Initial check
    if abs(f(x0)) < tol
        xbar = x0
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    for k in 1:maxits
        xk = x0 - (f(x0) / fprime(x0))

        if abs(f(xk)) < tol || abs(xk - x0) < tol
            xbar = xk
            fx = f(xk)
            err = abs(xbar - x0)
            return xbar, fx, err, k
        end

        x0 = xk
    end
end

function secant(f, x0, x1, tol, maxits)

    # Initial checks
    if abs(f(x0)) < tol
        xbar = x0
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    if abs(f(x1)) < tol || abs(x1 - x0) < tol
        xbar = x1
        fx = f(xbar)
        err = NaN
        return xbar, fx, err, k
    end

    for k in 1:maxits
        xk = x1 - ((f(x1)) / (f(x1) - f(x0))) * (x1 - x0)

        if abs(f(xk)) < tol || abs(xk - x1) < tol
            xbar = xk
            fx = f(xbar)
            err = abs(xbar - x1)
            return xbar, fx, err, k
        end

        x0 = x1
        x1 = xk

    end
end



end
