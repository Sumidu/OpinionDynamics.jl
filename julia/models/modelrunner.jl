include("modelrunner.jl")
using Hwloc
Hwloc.num_physical_cores()



### https://github.com/crstnbr/JuliaWorkshop19/blob/master/3_Three/1_parallel_computing.ipynb

function batch_runner()
    batches = 10



end


using Distributed

using Distributed, BenchmarkTools; rmprocs(workers()); addprocs(4); nworkers()


# serial version - count heads in a series of coin tosses
function add_serial(n)
    c = 0
    for i = 1:n
        c += rand(Bool)
    end
    c
end

@btime add_serial(200_000_000);

function add_distributed(n)
    c = @distributed (+) for i in 1:n
        Int(rand(Bool))
    end
    c
end

@btime add_distributed(200_000_000);

function add_distributed(n)
    c = @distributed (+) for i in 1:n
        x = Int(rand(Bool))
        println(x);
        x
    end
    c
end

add_distributed(8);
