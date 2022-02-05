using Pkg
Pkg.add("SymbolicUtils")
Pkg.add("SymbolicNumericIntegration")


using Symbolics
@syms x y z
import LinearAlgebra: dot,(x)
using SymbolicUtils
using SymbolicNumericIntegration

const ∂ = Symbolics.derivative
struct ∇; end

∇(Ψ::T) where T=[∂(Ψ, x), ∂(Ψ, y), ∂(Ψ, z)]
∂(sin(x), x)
∇((sin(x)+y)*cos(z))
dot(::Type{∇}, u) = ∂(u[1],x) + ∂(u[2],y) + ∂(u[3],z)
(X)(::Type{∇}, u) = [∂(u[3],y) - ∂(u[2],z), ∂(u[1],z) - ∂(u[3],x), ∂(u[2],x) - ∂(u[1],y)] 

u = [-x^2, -y^2, -z^2]
∇(u)
dot(∇, u)
X(∇, u)

#h8Tbg0qX