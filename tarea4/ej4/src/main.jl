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

function ryanairDP(c, M, p, n)
    println("c: ", c)
    println("p: ", p)
    println("n: ", n)

    if c == (1 << n) - 1
        return 0
    end

    if p[c+1] != -1
        return p[c+1]
    end

    for i in 1:n
        if (c & (1 << i)) == 0
            xi, yi = M[i]
            base = xi^2 + yi^2
            min = 2 * base
            best_j = 0
            for j in i+1:n
                if (c & (1 << j)) == 0
                    xj, yj = M[j]
                    dist = base + xj^2 + yj^2 + (xi - xj)^2 + (yi - yj)^2
                    if dist < min
                        min = dist
                        best_j = j
                    end
                end
            end

            if best_j == 0
                p[c+1] = ryanairDP(c | (1 << i), M, p, n) + min
            else
                p[c+1] = ryanairDP(c | (1 << i) | (1 << best_j), M, p, n) + min
            end

            return p[c+1]
        end
    end

end

function main()
    if length(ARGS) < 1
        println("Usage: main.jl filename")
        exit(1)
    end

    filename = ARGS[1]
    M = parseinstance(filename)

    println(M)

    ryanair(M)
end

main()

