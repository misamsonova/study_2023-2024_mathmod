model lab05_1
Real a = 0.73;
Real b = 0.037;
Real c = 0.52;
Real d = 0.039;
Real x;
Real y;
initial equation
x = 7;
y = 16;
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;
end lab05_1;
