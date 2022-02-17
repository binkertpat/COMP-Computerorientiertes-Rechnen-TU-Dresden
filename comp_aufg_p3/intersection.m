function nSx = intersection(f,g,df,dg,initalGuess,tolerance)
    h = @(x) f(x) - g(x);
    dh = @(x) df(x) - dg(x);

    nSx = initalGuess;
    nSy = h(nSx);
    arrayCounter = 1;
    array(arrayCounter, 1) = nSx;
    array(arrayCounter, 2) = nSy;
    while abs(nSy) > tolerance
        arrayCounter = arrayCounter + 1;
        nSx = nSx - nSy/dh(nSx);
      	nSy = h(nSx);
        array(arrayCounter, 1) = nSx;
        array(arrayCounter, 2) = nSy;
    end
    disp(array);
end