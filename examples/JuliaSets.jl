using JuliaSets

Q(z) = z.^4 + 0.6 + 1im * 0.55
n = 1000

xs = [linspace(-2, 2, n);]
ys = copy(xs)

A = escape_time(Q, xs, ys, 20, 100.0)

# map to [0,2 \pi]
A = atan(A)

using Gadfly

draw(PNG("example.png", 20cm, 20cm), spy(A, Guide.xticks(ticks=nothing), Guide.yticks(ticks=nothing), Guide.xlabel(nothing), Guide.ylabel(nothing), Theme(key_position = :none)))
