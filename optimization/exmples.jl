using JuMP
using GLPK

#Example-1
model = Model(GLPK.Optimizer)
@variable(model, x >= 0)
@variable(model, y >= 0)
@objective(model, Max, 5x+6y)
@constraint(model, c1, 3x + 2y <= 32)
@constraint(model, c2, x + 4y <= 34)
print(model)
optimize!(model)
@show objective_value(model)
@show value(x)
@show value(y)

#Example-2
model = Model(GLPK.Optimizer)
#unregister(model, :x₁)
@variable(model, x₁ >=0)
@variable(model, x₂ >= 0)
@objective(model, Max, 3x₁ + 2x₂)
@constraint(model, x₁ <= 5)
@constraint(model, 2x₁ + x₂ <= 12)
@constraint(model, x₁ + x₂ <= 8)
optimize!(model)
@show objective_value(model)
@show value(x₁)
@show value(x₂)