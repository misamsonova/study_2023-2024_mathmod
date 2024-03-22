model lab07_3
Real N = 756;
Real n;
initial equation
n = 17;
equation
der(n) = (0.55*sin(time) + 0.33*sin(5*time)*n)*(N-n);
end lab07_3;
