module JuliaSets

export escape_time, JuliaSet, call


type JuliaSet
   Q::Function
end

function call{T<:Real}(J::JuliaSet, xs::Array{T}, ys::Array{T}, n_iter::Int64=100, escape_tol::T=100.0)
  @assert size(xs) == size(ys)
  ans = xs + 1im * ys
  for i = 1:n_iter
    ans = J.Q(ans)
  end
  return abs(ans) .< T(escape_tol)
end

function escape_time{T <: Real}(Q::Function, xs::Array{T,1}, ys::Array{T,1}, n_iter=100, escape_tol=100)
  A = zeros(length(xs), length(ys))
  for i in 1:length(xs)
    for j in 1:length(ys)
      z = xs[i] + 1im * ys[j]
      for k = 1:n_iter
        z = Q(z)
        if abs(z) > escape_tol # diverged
          A[i,j] = k
          break
        end
      end
      if A[i,j] == 0 # didn't diverge
        A[i,j] = escape_tol + 1
      end
    end
  end
  return A
end

end # module
