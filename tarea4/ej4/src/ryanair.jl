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

    min1 = Inf64
    min1_P = (0, 0)
    for i in 1:n
        if !contains(R, i)
            for j in i+1:n
                if !contains(R, j)
                    distOABO = squaredist(O, S[i]) + squaredist(S[i], S[j]) + squaredist(S[j], O)
                    if distOABO < min1
                        min1 = distOABO
                        min1_P = (i, j)
                    end
                end
            end
        end
    end

    min2 = Inf64
    min2_i = 0
    for i in 1:n
        if !contains(R, i)
            distOAO = 2 * squaredist(O, S[i])
            if distOAO < min2
                min2 = distOAO
                min2_i = i
            end
        end
    end

    if min1_P == (0, 0)
        memo[R+1] = ryanairDP(union(R, min2_i), S, memo, n) + min2
        return memo[R+1]
    end

    rec1 = ryanairDP(union(R, min1_P[1], min1_P[2]), S, memo, n) + min1
    rec2 = ryanairDP(R | (1 << (min2_i - 1)), S, memo, n) + min2

    memo[R+1] = min(rec1, rec2)
    return memo[R+1]
end
