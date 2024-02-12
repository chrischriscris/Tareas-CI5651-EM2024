function parseinstance(filename)
    M = []
    open(filename) do file
        for line in eachline(file)
            x, y = split(line)
            push!(M, (parse(Int, x), parse(Int, y)))
        end
    end

    return M
end

function ryanair(M)
    n = length(M)
    p = repeat([-1], 1 << n)

    return ryanairDP(0, M, p, n)
end


# parejaDP(C: Conjunto, d: funcion, p: Arreglo):
#     if C==M:
#         return p[s]
#
#     if p[C] != -1:
#         return p[C]
#
#     min = inf
#     for el_i in M-C:
#         for el_j in M-S:
#             dist = d(0, el_i) + d(el_i, el_j) + d(el_j, 0)
#             if dist < min:
#                 min_el_j = el_j
#                 min = dist
#
#    p[C] = parejaDP(C U {el_i, el_j}, d, p) + mejor
#    return p[C]

function contains(c, i)
    return (c & (1 << (i - 1))) != 0
end

function dist(A, B)
    x1, y1 = A
    x2, y2 = B
    return (x2 - x1)^2 + (y2 - y1)^2
end

function ryanairDP(c, M, p, n)
    if c == (1 << n) - 1
        return 0
    end

    if p[c+1] != -1
        return p[c+1]
    end

    min = Inf64
    min_A = 0
    min_B = 0
    O = (0, 0)
    for A in 1:n
        if !contains(c, A)
            for B in 1:n
                if !contains(c, B)
                    distOABO = dist(O, M[A]) + dist(M[A], M[B]) + dist(M[B], O)
                    if distOABO < min
                        min = distOABO
                        min_A = A
                        min_B = B
                    end
                end
            end
        end
    end

    p[c+1] = ryanairDP(c | (1 << (min_A-1)) | (1 << (min_B-1)), M, p, n) + min
    return p[c+1]
end

function main()
    if length(ARGS) < 1
        println("Usage: main.jl filename")
        exit(1)
    end

    filename = ARGS[1]
    M = parseinstance(filename)

    print(ryanair(M))
end

main()

