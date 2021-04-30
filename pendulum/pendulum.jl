using DifferentialEquations
using Plots

l = 1.0     # length
m = 1.0     # mass
g = 9.81    # gravitational acceleration

function pendulum!(du, u, p, t)
    du[1] = u[2]
    du[2] = -3g/(2l)*sin(u[1]) + 3 / (m * l^2) * p(t) # ω'(t) = -3g(2l)sinθ(t) + 3 / (m * l^2) * M(t)
end

θ₀ = 0.01
ω₀ = 0.0
u₀ = [θ₀, ω₀]
tspan = (0.0, 10.0)
M = t -> 0.1sin(t)

prob = ODEProblem(pendulum!, u₀, tspan, M)
sol = solve(prob)

plot(sol, linewidth=2, axis="t", label=["θ [rad]" "ω [rad/s]"], layout=(2, 1))