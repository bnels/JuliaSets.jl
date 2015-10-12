using JuliaSets

Q(z) = z.^2

xs = [linspace(-2, 2, 1000);]
ys = copy(xs)

A = escape_time(Q, xs, ys, 20, 100.0)

using Gadfly

draw(SVG("z2.svg", 2inch, 2inch), spy(A))
