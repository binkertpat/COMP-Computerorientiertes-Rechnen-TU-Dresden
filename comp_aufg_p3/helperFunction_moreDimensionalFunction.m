function [y, dy] = helperFunction_moreDimensionalFunction(x)
    n = length(x);
    
    y = zeros(size(x));
    dy = zeros(n,n);
    
    y(1) = x(1)^2/9+x(2)^2/4-1;
    y(2) = (x(1)-2)^2+(x(2)-3)^2-4;
    
    dy(1,1) = (2*x(1))/9; 
    dy(1,2) = x(2)/2;
    dy(2,1) = 2*x(1)-4; 
    dy(2,2) = 2*x(2)-6;
end
