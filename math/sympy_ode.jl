using SymPy
t = Sym("t")
x = SymFunction("x")(t)
deqn = Eq(diff(x, t), x - sympify(1)/2*x^2)
res = dsolve(deqn, x(t))
expr = (2 * exp(t)) / (1 + exp(t))
simplify(diff(expr, t))