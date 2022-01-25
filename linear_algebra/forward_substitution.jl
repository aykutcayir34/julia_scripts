using LinearAlgebra
A = [3 0 0; 2 -1 0; 1 -2 3]
b = [6; -2; 2]
function forward(A, b)
    n = size(A)[1]
    x = zeros(n, 1)
    for i = 1:n
        s = 0
        for j = 1:i-1
            if i == 1
                x[1, 1] = b[1, 1] / A[1, 1]
            end
            s += A[i, j] * x[j, 1]
        end
        x[i, 1] = (b[i, 1] - s) / A[i, i]
    end
    return x
end

forward(A, b)