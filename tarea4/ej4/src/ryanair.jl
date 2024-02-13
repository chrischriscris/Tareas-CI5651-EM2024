# Origin
O = (0, 0)

# Given a list of coordinates of suitcases, returns the minimum travel distance
# to pick them all up and return to the origin.
#
# At most 2 suitcases can be picked up at the same time.
function ryanair(S::Array{Tuple{Int,Int}})
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
function ryanairDP(R::Int, S::Array{Tuple{Int,Int}}, memo::Array{Int}, n::Int)
    if isfull(R, n)
        return 0
    end

    if memo[R+1] != -1
        return memo[R+1]
    end

    i = 1
    while i <= n && contains(R, i)
        i += 1
    end

    min = ryanairDP(union(R, i), S, memo, n) + 2 * squaredist(O, S[i])
    for j in i+1:n
        if contains(R, j)
            continue
        end

        time = ryanairDP(union(R, i, j), S, memo, n) + squaredist(O, S[i]) + squaredist(S[i], S[j]) + squaredist(S[j], O)
        if time < min
            min = time
        end
    end

    return memo[R+1] = min
end
