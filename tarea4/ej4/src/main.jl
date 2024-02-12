include("./utils.jl")
include("./ryanair.jl")

function main()
    if length(ARGS) < 1
        println("Usage: main.jl filename")
        exit(1)
    end

    filename = ARGS[1]
    M = parseinstance(filename)

    println(ryanair(M))
end

main()

