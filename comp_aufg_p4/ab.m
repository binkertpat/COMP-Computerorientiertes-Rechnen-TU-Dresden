function x = ab(n)
    numberAsString = num2str(n);
    
    for i = 1:length(numberAsString)
        singleIntArray(i) = str2double(numberAsString(i));
    end
    
    singleIntArray = helperFunction_Sort(singleIntArray, "down");
    
    output = "";
    for i = 1:length(numberAsString)
        output = output + num2str(singleIntArray(i));
    end
    
    %disp(output);
    x = str2double(output);
end
    
    