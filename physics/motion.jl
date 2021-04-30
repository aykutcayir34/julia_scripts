using Plots

t₀ = 0 #s
a₀ = 4 #m/s^2
tₗ = 10 #s
b = 0.25 #s^-1
δt = 0.01
ts = t₀:δt:tₗ
v₀ = 0

function a(t)
    a₀ * 2^(-b*t)
end

function v(a)
    vs = zeros(length(a))
    for i in 1:length(a) - 1
        vs[i + 1] = vs[i] + a[i] * δt
    end
    vs
end

function x(v)
    xs = zeros(length(v))
    for i in 1:length(xs) - 1
        xs[i + 1] = xs[i] + v[i] * δt
    end
    xs
end
as = a.(ts)
vs = v(as)
xs = x(vs)

pa = plot(ts, as)
display(pa)

pv = plot(ts, vs)
display(pv)

px = plot(ts, xs)
display(px)