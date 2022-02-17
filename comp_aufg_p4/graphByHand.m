function graphByHand(k,n)
    output = "";
    for i = 1:k+1
        if i ~= k + 1
            output = output + num2str(K(n,i)) + " → ";
        else
            output = output + num2str(K(n,i));
        end
    end
    disp(output);
end
