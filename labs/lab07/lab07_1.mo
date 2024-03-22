model lab07_1
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.73 + 0.000013*n)*(N-n);
end lab07_1;
