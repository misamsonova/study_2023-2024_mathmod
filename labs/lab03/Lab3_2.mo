model Lab3_2
Real x;
Real y;
Real a = 0.38;
Real b = 0.67;
Real c = 0.57;
Real d = 0.39;
Real t = time;
initial equation
x = 88000;
y = 99000;
equation
der(x) = -a*x - b*y + sin(7*t)+1;
der(y) = -c*x*y - d*y + cos(8*t)+1;
end Lab3_2;
