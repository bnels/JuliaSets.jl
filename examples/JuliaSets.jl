using JuliaSets

Q(z) = z.^4 + 0.6 + 1im * 0.55

xs = [linspace(-2, 2, 1000);]
ys = copy(xs)

A = escape_time(Q, xs, ys, 20, 100.0)

# map to [0,2 \pi]
A = atan(A)

using Gadfly

draw(PNG("example.png", 5cm, 5cm), spy(A))
