---
## Front matter
lang: ru-RU
title: "Презентация по лабораторной работе №7"
subtitle: " Модель распространения рекламы "
author:
  - Самсонова Мария Ильинична
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 04 марта 2024

## i18n babel
babel-lang: russian 
babel-otherlangs: english 
mainfont: Arial 
monofont: Courier New 
fontsize: 12pt

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Цель лабораторной работы №7

Изучение и построение модели эффективности рекламы.

# Задание лабораторной работы №7

**Вариант 27**

Постройте график распространения рекламы, математическая модель которой описывается следующим уравнением:

1.  $\frac{dn}{dt} = (0.73 + 0.000013n(t))(N-n(t))$
2.  $\frac{dn}{dt} = (0.000013 + 0.73n(t))(N-n(t))$
3.  $\frac{dn}{dt} = (0.55\sin{t} + 0.33\sin{(5t)}  n(t))(N-n(t))$

При этом объем аудитории $N = 756$, в начальный момент о товаре знает 17 человек.

Для случая 2 определите в какой момент времени скорость распространения рекламы будет иметь максимальное значение.

# Выполнение лабораторной работы №7 на Julia

Код программы для первого случая $\frac{dn}{dt} = (0.73 + 0.000013n(t))(N-n(t))$:

```
using Plots
using DifferentialEquations

N = 756
n0 = 17

function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.73 + 0.000013*u[1])*(N - u[1])
end
```

# Выполнение лабораторной работы №7 на Julia

```
v0 = [n0]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600, title = "Эффективность распространения рекламы (1) ", legend = false)
plot!(plt,T,n,color = :red)
savefig(plt, "lab07_1.png")
```

# Выполнение лабораторной работы №7 на Julia

Код программы для второго случая $\frac{dn}{dt} = (0.000013 + 0.73n(t))(N-n(t))$:

```
using Plots
using DifferentialEquations

N = 756
n0 = 17

function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.000013 + 0.73*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]
```
# Выполнение лабораторной работы №7 на Julia

```
max_dn = 0;
max_dn_t = 0;
max_dn_n = 0;
for (i, t) in enumerate(T)
    if sol(t, Val{1})[1] > max_dn
        global max_dn = sol(t, Val{1})[1]
        global max_dn_t = t
        global max_dn_n = n[i]
    end
end

plt = plot(dpi = 600,title = "Эффективность распространения рекламы (2) ",legend = false)
plot!(plt,T,n,color = :red)
plot!(plt,[max_dn_t],[max_dn_n],seriestype = :scatter,color = :red)
savefig(plt, "lab07_2.png")
```

# Выполнение лабораторной работы №7 на Julia

Код программы для третьего случая $\frac{dn}{dt} = (0.55\sin{t} + 0.33\sin{(5t)}  n(t))(N-n(t))$:

```
using Plots
using DifferentialEquations

N = 756
n0 = 17

function ode_fn(du, u, p, t)
    (n) = u
    du[1] = (0.55*sin(t) + 0.33*sin(5*t)*u[1])*(N - u[1])
end
```

# Выполнение лабораторной работы №7 на Julia

```
v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 600,title = "Эффективность распространения рекламы (3) ",legend = false)
plot!(plt,T,n,color = :red)
savefig(plt, "lab07_3.png")
```

# Результаты работы кода на Julia

![График распространения рекламы для первого случая, построенный на языке Julia](image/1.PNG){ #fig:001 width=70% height=70% }

# Результаты работы кода на Julia

![График распространения рекламы для второго случая, построенный на языке Julia](image/2.PNG){ #fig:002 width=70% height=70% }

# Результаты работы кода на Julia

![График распространения рекламы для третьего случая, построенный на языке Julia](image/3.PNG){ #fig:003 width=70% height=70% }

# Выполнение лабораторной работы №7 на OpenModelica

Код программы для первого случая $\frac{dn}{dt} = (0.73 + 0.000013n(t))(N-n(t))$:

```
model lab07_1
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.73 + 0.000013*n)*(N-n);
end lab07_1;
```

# Выполнение лабораторной работы №7 на OpenModelica

Код программы для второго случая $\frac{dn}{dt} = (0.000013 + 0.73n(t))(N-n(t))$:

```
model lab07_2
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.000013 + 0.73*n)*(N-n);
end lab07_2;
```

# Выполнение лабораторной работы №7 на OpenModelica

Код программы для третьего случая $\frac{dn}{dt} = (0.55\sin{t} + 0.33\sin{(5t)}  n(t))(N-n(t))$:

```
model lab07_3
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.55*sin(time) + 0.33*sin(5*time)*n)*(N-n);
end lab07_3;
```

# Результаты работы кода на OpenModelica

![График распространения рекламы для первого случая, построенный с помощью OpenModelica](image/4.PNG){ #fig:004 width=70% height=70% }

# Результаты работы кода на OpenModelica

![График распространения рекламы для второго случая, построенный с помощью OpenModelica](image/5.PNG){ #fig:005 width=70% height=70% }

# Результаты работы кода на OpenModelica

![График распространения рекламы для третьего случая, построенный с помощью OpenModelica](image/6.PNG){ #fig:006 width=70% height=70% }

# Анализ полученных результатов. Сравнение языков.

В итоге проделанной работы мы построили графики распространения рекламы для трех случаев на языках Julia и OpenModelica. Построение модели распространения рекламы на языке OpenModelica занимает значительно меньше строк и построение графиков по времени, чем аналогичное построение на Julia. 

# Вывод лабораторной работы №7

В ходе выполнения лабораторной работы №7 была изучена модель эффективности рекламы и в дальнейшем построена модель на языках Julia и OpenModelica.