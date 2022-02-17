function nSx = drawIntersection(f,g,df,dg,initalGuess,tolerance)
    hold on;
    arrayCounter = 1;
    for i=-5:0.1:1
        x_f(arrayCounter) = i;
        x_g(arrayCounter) = i;
        y_f(arrayCounter) = f(i);
        y_g(arrayCounter) = g(i);
        arrayCounter = arrayCounter + 1;
    end
    plot(x_f, y_f);
    plot(x_g, y_g);
   
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
    
    plot([nSx nSx], [max(y_f) min(y_f)]);
    
    xAxes = xlim();
    yAxes = ylim();
    text(xAxes(1) + 0.2,yAxes(2) - 2,"x0 = " + nSx, 'FontSize', 20);
end