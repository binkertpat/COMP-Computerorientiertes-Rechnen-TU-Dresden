function x = classify(n)
    primeFactors = helperFunction_checkIfPrimeDividerCountIsEven(n);   
    %disp(primeFactors);        
    if mod(length(primeFactors),2) == 0
        x = 1; 
    else
        x = -1; 
    end
end