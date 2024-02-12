# Origin
O = (0, 0)

# Given a list of coordinates of suitcases, returns the minimum travel distance
# to pick them all up and return to the origin.
#
# At most 2 suitcases can be picked up at the same time.
function ryanair(S::Array{Tuple{Int, Int}})
    n = length(S)
    memo = repeat([-1], 1 << n)

    return ryanairDP(0, S, memo, n)
end

# Solves the problem using Dynamic Programming
#
# Arguments:
# R: A bitmask representing the suitcases that remain to be picked up
# S: The list of coordinates of the suitcases
# memo: A memoization table
# n: The number of suitcases
function ryanairDP(R::Int, S::Array{Tuple{Int, Int}}, memo::Array{Int}, n::Int)
    if isfull(R, n)
        return 0
    end

    if memo[R+1] != -1
        return memo[R+1]
    end

    min2suitcases = Inf64
    min2suitcasesi = 0
    min2suitcasesj = 0
    for i in 1:n-1
        if !contains(R, i)
            for j in i+1:n
                if !contains(R, j)
                    time = squaredist(O, S[i]) + squaredist(S[i], S[j]) + squaredist(S[j], O)
                    if time < min2suitcases
                        min2suitcases = time
                        min2suitcasesi = i
                        min2suitcasesj = j
                    end
                end
            end
        end
    end

    min1suitcase = Inf64
    min1suitcasei = 0
    for i in 1:n
        if !contains(R, i)
            time = 2 * squaredist(O, S[i])
            if time < min1suitcase
                min1suitcase = time
                min1suitcasei = i
            end
        end
    end

    case1 = ryanairDP(union(R, min1suitcasei), S, memo, n) + min1suitcase

    # There's only one suitcase left, pick it up
    if min2suitcases == Inf64
        return memo[R+1] = case1
    end

    case2 = ryanairDP(union(R, min2suitcasesi, min2suitcasesj), S, memo, n) + min2suitcases

    # Store the most optimal case
    return memo[R+1] = min(case1, case2)
end
