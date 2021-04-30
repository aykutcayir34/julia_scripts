using SymPy
x = Sym("x")
y = Sym("y")

f(x) = exp(-x^2/2)
f(x)
subs(f(x), x, 1)
ex = exp(-x^2/2)
ex(1)
ex(x=>1)
N(ex(1))
########## Equations
(x+1)+(x+2)+(x+3)
sin(x)^2 + cos(x)^2
simplify(sin(x)^2 + cos(x)^2)
factor(x^2 + 2x + 1)
expand((x + 1) * (x + 2) * (x + 3))
p = expand((x - 1) * (x - 2) * (x - 3) * (x^2 + x + 1))
factor(p)
sympy.roots(p)
[k for (k,v) in sympy.roots(p)]
q = x^4 -8x^2 + 8
factor(q)
sympy.roots(q)
sympy.real_roots(q)
solve(q)
as = solve(q)
N.(as)
solve(exp(x) - 2x^2, x)
sympy.nsolve(exp(x) - 2x^2, x, 3)

solve(sin(x)^2 - (1 // 2)^2) * 180 / pi
out = solve(x^2 + y^2 - 1, y)
subs.(out, x => 1 // 2)

eq1 = x + y - 1
eq2 = x - y - (-1)
solve([eq1, eq2], [x, y])

#Q1
expand((x - 1) * (x - 2) * (x - 3) * (x - 4) * (x - 5))

#Q2
expand(((1*x+2)*x + 3)*x + 4)

#Q3
eq = x^3 - 6x^2 + 11x - 6
solve(eq, x)

#Q5
eq = x^4 - 10x^3 + 32x^2 - 38x + 15
solve(eq, x)

#Q6
eq = exp(x) - x^4
solve(eq)
N.(solve(eq)) # yanlis cozum

using  Plots
ex = x^2 - 2x + 4
plot(ex, -1, 3)

###############################
x = Sym("x")
ex = (x^4 * exp(x)) / (exp(x) - 1)^2
integrate(ex, x)