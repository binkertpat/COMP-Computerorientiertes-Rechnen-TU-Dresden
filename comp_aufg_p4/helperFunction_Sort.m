function x = helperFunction_Sort(arr, direction)
   for i = 1:length(arr)
        currentExtrema = i;
        for j = i+1:length(arr)
            if direction == "up"
                if arr(currentExtrema) > arr(j)
                    currentExtrema = j;
                end
            elseif direction == "down"
                if arr(currentExtrema) < arr(j)
                    currentExtrema = j;
                end
            end
        end
        if currentExtrema ~= i
            tempNumberSave = arr(currentExtrema);
            arr(currentExtrema) = arr(i);
            arr(i) = tempNumberSave;
        end
    end
    x = arr;
end