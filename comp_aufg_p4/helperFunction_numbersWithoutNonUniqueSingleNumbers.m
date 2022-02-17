function x = helperFunction_numbersWithoutNonUniqueSingleNumbers(n)
    arrayCounter = 1;
    
    minimum = "1";
    maximum = "9";
    
    for i = 1:n-1
        minimum = minimum + "0";
        maximum = maximum + "9";
    end
    
    minimum = str2double(minimum);
    maximum = str2double(maximum);
    
    for i = minimum:maximum
           if (i / 10 < 1) || length(unique(num2str(i))) ~= 1
                array(arrayCounter) = i;
                arrayCounter = arrayCounter + 1; 
           end 
    end
    %disp(array);
    x = array;
end