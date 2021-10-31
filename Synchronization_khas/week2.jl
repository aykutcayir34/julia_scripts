using Plots
function Euler(f, t, x₀::Vector{Int64})
    dim = length(x₀)
    x = zeros(length(t), dim)
    x[1] = x₀[1]
    for i = 1:length(t) - 1
        h = t[i + 1] - t[i]
        x[i + 1] = x[i] + h * f(t[i], x[i])
    end
    return x
end

function Heum(f, t, x₀)
    dim = length(x₀)
    x = zeros(length(t), dim)
    x[1] = x₀[1]
    for i = 1:length(t) - 1
        h = t[i + 1] - t[i]
        x₁ = x[i] + h * f(t[i], x[i])
        x[i + 1] = x[i] + 0.5 * h * (f(t[i], x[i]) + f(t[i], x₁))
    end
    return x
end

ẋ(t, x) = 2 .* x
x₀ = [1]
t_init = 0
t_final = 4
h = 0.05
t = t_init:h:t_final
x_euler = Euler(ẋ, t, x₀)
x_heum = Heum(ẋ, t, x₀)
x_analytical_sol = exp.(2 .* t)

plot(t, [x_euler x_heum x_analytical_sol], xlabel="time", ylabel="X function", label=["X Euler" "X Heum" "X Exact"])



