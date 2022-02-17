function x = moreDimensionalNewton(f,x,tolerance)
    [y,dy] = f(x); 
    
    arrayCounter = 1;
    datas = horzcat(x', y');
    for i = 1 : length(datas)
        array(arrayCounter, i) = datas(i);
    end

    arrayCounter = arrayCounter + 1;
    
    while max(y) > tolerance
        x = x - dy\y;
        [y,dy] = f(x);
        datas = horzcat(x', y');
        for i = 1 : length(datas)
            array(arrayCounter, i) = datas(i);
        end
        arrayCounter = arrayCounter + 1;
    end
    %disp(array);
    x = array;
end

