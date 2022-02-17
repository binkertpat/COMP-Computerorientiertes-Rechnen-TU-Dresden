function x = helperFunction_checkIfPrimeDividerCountIsEven(n)
    output = [];
    for i = 2:n
        while mod(n,i) == 0 
            output(end + 1) = i;
            n = n / i;
        end
    end
    x = output;
    return;
end
    
 