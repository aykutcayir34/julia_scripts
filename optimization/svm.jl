using Convex, SCS
using Distributions:MvNormal

n = 2 #dim
C = 10 # reg param in objective function
N = 10 # Number of positive samples
M = 10 # Number of negative samples

pos_data = rand(MvNormal([1.0, 2.0], 1.0), N)
neg_data = rand(MvNormal([-1.0, 2.0], 1.0), M)

function svm(pos_data, neg_data, solver=()->SCS.Optimizer(verbose=0))
    w = Variable(n)
    b = Variable()
    obj = sumsquares(w) + C * sum(max(1 + b - w' * pos_data, 0)) + C * sum(max(1 - b + w' * neg_data, 0))
    problem = minimize(obj)
    solve!(problem, solver)
    return evaluate(w), evaluate(b)
end

w, b = svm(pos_data, neg_data)

using  Plots

line_x = -2.0:0.1:2
line_y = (-w[1] * line_x .+ b) / w[2]

plot(pos_data[1, :], pos_data[2, :], st=:scatter, label="Positive Points")
plot!(neg_data[1, :], neg_data[2, :], st=:scatter, label="Negative Points")
plot!(line_x, line_y, label="Separating Line")