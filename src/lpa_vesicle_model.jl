# Example model from the Diff equation webpage

using DifferentialEquations
using Plots


function lorenz!(du,u,p)
 x,y,z = u
 σ,ρ,β = p
 du[1] = dx = σ*(y-x)
 du[2] = dy = x*(ρ-z) - y
 du[3] = dz = x*y - β*z
end

u0 = [1.0,2.0,1.0]
tspan = (0.0,100.0)

p = (α=1, β=2, σ=8/3)

prob = ODEProblem(lorenz!,u0,tspan,p)
sol = solve(prob)

Plots.theme(:sand)
p1 = plot(sol,vars=(1,2,3));
p2 = plot(sol,vars=(0,3));
plot(p1, p2, layout=(2,1))


