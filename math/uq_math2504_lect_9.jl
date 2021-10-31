using Plots

diff_forward(f, x; h=sqrt(eps())) = (f(x + h) - f(x)) / h
f(x) = sin(x^2)
f_der(x) = 2 * x * cos(x^2) # the analytic derviative of the function f
x0, x1 = 0.5, 5
h_range = 10 .^(-14:0.01:-2)
errs0 = [abs(diff_forward(f, x0; h=h) - f_der(x0)) / abs(f_der(x0)) for h in h_range]
errs1 = [abs(diff_forward(f, x1; h=h) - f_der(x1)) / abs(f_der(x1)) for h in h_range]

plot(h_range, [errs0 errs1], yaxis= :log, xaxis= :log, xlabel="h", ylabel="Absolute relative error", label=["x=$x0" "x=$x1"], c=[:red :blue], legend= :bottomright)