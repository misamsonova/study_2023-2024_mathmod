using Plots
using DifferentialEquations
# ���������� �� ����� �� ������
const a = 12.2
const n = 4.1
# ���������� ������ �������
const r0 = a/(n + 1)
const r0_2 = a/(n - 1)
# ��������
const T = (0, 2*pi)
const T_2 = (-pi, pi)
function F(u, p, t)
	return u / sqrt(n*n - 1)

end
# ������ ���
problem = ODEProblem(F, r0, T)
#�������
result = solve(problem, abstol=1e-8, reltol=1e-8)
@show result.u
@show result.t
dxR = rand(1:size(result.t)[1])
rAngles = [result.t[dxR] for i in 1:size(result.t)[1]]
#�����1
plt = plot(proj=:polar, aspect_ratio=:equal, dpi = 1000, legend=true, bg=:white)
#��������� ��� ������
plot!(plt, xlabel="theta", ylabel="r(t)", title="������ � ������ - ������ 1", legplot!(plt, [rAngles[1], rAngles[2]], [0.0, result.u[size(result.u)[1]]], label="�scatter!(plt, rAngles, result.u, label="", mc=:blue, ms=0.0005)
plot!(plt, result.t, result.u, xlabel="theta", ylabel="r(t)", label="���� ������"scatter!(plt, result.t, result.u, label="", mc=:green, ms=0.0005)
savefig(plt, "lab02_01.png")
problem = ODEProblem(F, r0_2 , T_2)
result = solve(problem, abstol=1e-8, reltol=1e-8)
dxR = rand(1:size(result.t)[1])
rAngles = [result.t[dxR] for i in 1:size(result.t)[1]]
#xo���2
plt1 = plot(proj=:polar, aspect_ratio=:equal, dpi = 1000, legend=true, bg=:white)#��������� ��� ������
plot!(plt1, xlabel="theta", ylabel="r(t)", title="������ � ������ - ������ 2", leplot!(plt1, [rAngles[1], rAngles[2]], [0.0, result.u[size(result.u)[1]]], label="scatter!(plt1, rAngles, result.u, label="", mc=:blue, ms=0.0005)
plot!(plt1, result.t, result.u, xlabel="theta", ylabel="r(t)", label="���� ������scatter!(plt1, result.t, result.u, label="", mc=:green, ms=0.0005)
savefig(plt1, "lab02_02.png")