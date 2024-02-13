# Given a list of coordinates of suitcases, returns the minimum travel distance
# to pick them all up and return them to the origin.
#
# At most 2 suitcases can be picked up at the same time.
function ryanair(S::Array{Tuple{Int,Int}})
    n = length(S)
    memo = repeat([-1], 1 << n)

    # Precalculates distances between all pairs and from the origin
    tO = [squaredist((0, 0), S[i]) for i in 1:n]
    t = zeros(Int, n, n)
    for i in 1:n
        for j in i+1:n
            t[i, j] = squaredist(S[i], S[j])
            t[j, i] = t[i, j]
        end
    end

    return ryanairDP(0, S, memo, tO, t)
end

# Solves the problem using Dynamic Programming
#
# Arguments:
# R: A bitmask representing the suitcases that remain to be picked up
# S: The list of coordinates of the suitcases
# memo: A memoization table
# tO: The distances from the origin to each suitcase
# t: The distances between each pair of suitcases
function ryanairDP(R::Int, S::Array{Tuple{Int,Int}}, memo::Array{Int}, tO::Array{Int}, t::Matrix{Int})
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

    mintime = ryanairDP(union(R, i), S, memo, tO, t) + 2 * tO[i]
    for j in i+1:n
        if contains(R, j)
            continue
        end

        time = ryanairDP(union(R, i, j), S, memo, tO, t) + tO[i] + t[i, j] + tO[j]
        if time < mintime
            mintime = time
        end
    end

    return memo[R+1] = mintime
end
