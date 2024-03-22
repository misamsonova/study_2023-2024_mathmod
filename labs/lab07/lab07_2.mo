model lab07_2
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.000013 + 0.73*n)*(N-n);
end lab07_2;
