model lab05_2
Real a = 0.73;
Real b = 0.037;
Real c = 0.52;
Real d = 0.039;
Real x;
Real y;
initial equation
x = c / d;
y = a / b;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;
end lab05_2;
