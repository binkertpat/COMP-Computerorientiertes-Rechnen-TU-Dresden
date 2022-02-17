function x = primal(n)
    countEven = 0;
    countUnEven = 0;
    
    for i = 2:n
        %disp(classify(i));
        
        if classify(i) == 1
           countEven = countEven + 1;
        else
           countUnEven = countUnEven + 1;
        end
    end
    x = countEven - countUnEven;
end
        