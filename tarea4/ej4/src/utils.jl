# Given a path to a file with the following format:
# x1 y1
# x2 y2
# ...
# xn yn
#
# Returns an Array of tuples of integers contained in the file
function parseinstance(path::String)
    S::Array{Tuple{Int,Int}} = []

    open(path) do file
        for line in eachline(file)
            x, y = split(line)
            push!(S, (parse(Int, x), parse(Int, y)))
        end
    end

    return S
end

# Given two points A and B, returns the square of the euclidean distance
function squaredist(A::Tuple{Int,Int}, B::Tuple{Int,Int})
    return (B[1] - A[1])^2 + (B[2] - A[2])^2
end

# ===== Set operations using bit manipulation =====

function isfull(c::Int, n::Int)
    return c == (1 << n) - 1
end

# These substract 1 because Julia is 1-indexed

function contains(c::Int, i::Int)
    return (c & (1 << (i - 1))) != 0
end

function union(c::Int, args::Int...)
    for i in args
        c = c | (1 << (i - 1))
    end
    return c
end
