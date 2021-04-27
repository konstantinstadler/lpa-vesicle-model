# Example model from the Diff equation webpage

using DifferentialEquations
using Plots


function sara_spon_recycle!(ds, s, p, tspan)
# Note: Julia is 1 indexed, the formulas in the original publication are 0 indexed
    α, β, δ = p.α, p.β, p.δ 
    ds[1] = -α * s[1] * (s[1] / (s[1] + s[4]))
    ds[2] = -δ * s[2] + α * (s[1] / (s[1] + s[4])) * s[1]
    ds[3] = -β * s[3] + δ*s[2]
    ds[4] = β * s[3]
end

# TODO: values in figure 5D and SI are different by a a factor of 10"
p = (α=1/60, β=10.5, δ=1.67)

# paper only states a poool of 15 vesicles, here we put all in the dye loaded state s1 (s0 in the paper)
s0 = [1000.0,0.0,0.0,0.0]

# origianl graph was for up to 1200 sec
tspan = (0.0,1200.0)

prob = ODEProblem(sara_spon_recycle!,s0,tspan,p)
sol = solve(prob, Tsit5(), abstol = 1e-9, reltol = 1e-9)

Plots.theme(:sand)
#  plot(sol)
p1 = plot(sol,vars=(0,1));
p2 = plot(sol,vars=(0,2));
p3 = plot(sol,vars=(0,3));
p4 = plot(sol,vars=(0,4));
plot(p1, p2, p3, p4, layout=(2,2))


