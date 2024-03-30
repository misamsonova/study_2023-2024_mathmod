model lab08_2
Real cr = 39;
Real t1 = 31;
Real p1 = 11.2;
Real t2 = 28;
Real p2 = 15.5;
Real N = 91;
Real q = 1;

Real a1 = cr / (t1 * t1 * p1 * p1 * N * q);
Real a2 = cr / (t2 * t2 * p2 * p2 * N * q);
Real b = cr / (t1 * t1 * t2 * t2 * p1 * p1 * p2 * p2 * N * q);
Real c1 = (cr - p1) / (t1 * p1);
Real c2 = (cr - p2) / (t2 * p2);

Real M1;
Real M2;
initial equation
M1 = 7.7;
M2 = 8.8;
equation
der(M1) = M1 - (b / c1 + 0.00017) * M1 * M2 - a1 / c1 * M1 * M1;
der(M2) = c2 / c1 * M2 - b / c1 * M1 * M2 - a2 / c1 * M2 * M2;
end lab08_2;
