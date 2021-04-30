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