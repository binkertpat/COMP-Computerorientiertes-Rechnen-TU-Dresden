function x = imaginaryUnit(startValue)
    x = newtonsolve(@(z) z^3-1,@(z)3*z^2,startValue,0.001);
end 