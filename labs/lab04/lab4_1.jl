#case 1
# x'' + 4.3x = 0
# x'' + 9x = 0
using DifferentialEquations

function lorenz!(du, u, p, t)
    a = p
    du[1] = u[2]
    du[2] = -a*u[1]
end

const x = -0.7
const y = 0.7
u0 = [x, y]

p = (9)
tspan = (0.0, 37.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plt1 = plot(sol, dpi = 1200, legend= true, bg =:white)
plot!(plt1, title="Решение системы уравнений - 1 случай",titlefont = font(9, "Arial"), legend=:outerbottom)
savefig("lab4_julia_1.png")

#фазовый портрет
plt2 = plot(sol, vars=(2,1), dpi = 1200, legend= true, bg =:white)
plot!(plt2, title="Фазовый портрет - 1 случай", titlefont = font(9, "Arial"), legend=:outerbottom)
savefig("lab4_julia_1_phase.png")