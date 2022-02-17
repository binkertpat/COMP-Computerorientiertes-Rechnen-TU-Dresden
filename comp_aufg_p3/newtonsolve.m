function nSx = newtonsolve(f,df,initalGuess,tolerance)
    nSx = initalGuess;
    nSy = f(nSx);
    arrayCounter = 1;
    array(arrayCounter, 1) = nSx;
    array(arrayCounter, 2) = nSy;
    while abs(nSy) > tolerance
        arrayCounter = arrayCounter + 1;
        nSx = nSx - nSy/df(nSx);
      	nSy = f(nSx);
        array(arrayCounter, 1) = nSx;
        array(arrayCounter, 2) = nSy;
    end
    %disp(array);
end