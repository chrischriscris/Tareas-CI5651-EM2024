# Given a path to a file with the following format:
# x1 y1
# x2 y2
# ...
# xn yn
#
# Returns an Array of tuples of integers contained in the file
function parseinstance(path::String)
    M::Array{Tuple{Int, Int}} = []

    open(path) do file
        for line in eachline(file)
            x, y = split(line)
            push!(M, (parse(Int, x), parse(Int, y)))
        end
    end

    return M
end

# Given two points A and B, returns the square of the euclidean distance
function squaredist(A, B)
    x1, y1 = A
    x2, y2 = B
    return (x2 - x1)^2 + (y2 - y1)^2
end

# ===== Set operations using bit manipulation =====

# All of them substract 1 because Julia is 1-indexed

function contains(c, i)
    return (c & (1 << (i - 1))) != 0
end

function isfull(c, n)
    return c == (1 << n) - 1
end

function union(c, args...)
    for i in args
        c = c | (1 << (i - 1))
    end
    return c
end
