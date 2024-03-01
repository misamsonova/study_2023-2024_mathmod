//case3: x'' + x' + 6x = 2сos(0.5t)
model lab4_3

parameter Real w = sqrt(6.0);  
parameter Real g = 1;  

parameter Real x0 = -0.7; 
parameter Real y0 = 0.7; 

Real x(start=x0); 
Real y(start=y0); 

// f(t) 
function f 
input Real t ; 
output Real res; 
algorithm  
res := 2*cos(0.5*t); // 3 случай 
end f; 

equation 
der(x) = y; 
der(y) = -w*w*x - g*y - f(time); 
end lab4_3;

