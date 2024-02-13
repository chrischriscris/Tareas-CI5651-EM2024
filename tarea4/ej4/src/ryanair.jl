# Given a list of coordinates of suitcases, returns the minimum travel distance
# to pick them all up and return them to the origin.
#
# At most 2 suitcases can be picked up at the same time.
function ryanair(S::Array{Tuple{Int,Int}})
    n = length(S)
    memo = repeat([-1], 1 << n)

    # Precalculates distances between all pairs and from the origin
    timeO = [squaredist((0, 0), S[i]) for i in 1:n]
    time = [squaredist(S[i], S[j]) for i in 1:n, j in 1:n]

    return ryanairDP(0, S, memo, timeO, time)
end

# Solves the problem using Dynamic Programming
#
# Arguments:
# R: A bitmask representing the suitcases that remain to be picked up
# S: The list of coordinates of the suitcases
# memo: A memoization table
# n: The number of suitcases
function ryanairDP(R::Int, S::Array{Tuple{Int,Int}}, memo::Array{Int}, timeO::Array{Int}, time::Matrix{Int})
    n = length(S)
    if isfull(R, n)
        return 0
    end

    if memo[R+1] != -1
        return memo[R+1]
    end

    i = 1
    while contains(R, i)
        i += 1
    end

    mintime = ryanairDP(union(R, i), S, memo, timeO, time) + 2 * timeO[i]
    for j in i+1:n
        if contains(R, j)
            continue
        end

        cost = ryanairDP(union(R, i, j), S, memo, timeO, time) + timeO[i] + time[i, j] + timeO[j]
        if cost < mintime
            mintime = cost
        end
    end

    return memo[R+1] = mintime
end
