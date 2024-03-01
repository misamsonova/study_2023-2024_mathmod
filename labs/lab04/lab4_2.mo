//case2: x'' + 5.5x' + 4.4x = 0
model lab4_2

parameter Real w = sqrt(4.4);  
parameter Real g = 5.5;  

parameter Real x0 = -0.7; 
parameter Real y0 = 0.7; 

Real x(start=x0); 
Real y(start=y0); 

// f(t) 
function f 
input Real t ; 
output Real res; 
algorithm  
res := 0; 
end f; 

equation 
der(x) = y; 
der(y) = -w*w*x - g*y + f(time); 

end lab4_2;
