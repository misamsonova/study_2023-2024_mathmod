model Lab3_1
Real x;
Real y;
Real a = 0.45;
Real b = 0.55;
Real c = 0.58;
Real d = 0.45;
Real t = time;
initial equation
x = 88000;
y = 99000;
equation
der(x) = -a*x - b*y + sin(t+15);
der(y) = -c*x - d*y + cos(t+3);
end Lab3_1;
