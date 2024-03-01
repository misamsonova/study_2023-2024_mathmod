#case 3
# x'' + x' + 8.8x = 0.7sin(3t)
# x'' + x' + 6x = 2cos(0.5t)
using DifferentialEquations

function lorenz!(du, u, p, t)
    a, b = p
    du[1] = u[2]
    du[2] = -a*du[1] - b*u[1] + 2*cos(0.5*t)
end

const x = -0.7
const y = 0.7
u0 = [x, y]

p = (sqrt(1), 6)
tspan = (0.0, 37.0)
prob = ODEProblem(lorenz!, u0, tspan, p)
sol = solve(prob, dtmax = 0.05)

using Plots; gr()

#решение системы уравнений
plot(sol)
savefig("lab4_julia_3.png")

#фазовый портрет
plot(sol, vars=(2,1))
savefig("lab4_julia_3_phase.png")