include("./utils.jl")
include("./ryanair.jl")

function main()
    if length(ARGS) < 1
        println("Usage: main.jl filename")
        exit(1)
    end

    path = ARGS[1]
    S = parseinstance(path)

    println(ryanair(S))
end

main()

