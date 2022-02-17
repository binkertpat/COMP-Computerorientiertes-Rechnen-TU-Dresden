function x = drawMoreDimensionalNewton(f,x,tolerance)
    array = moreDimensionalNewton(f,x,tolerance);
    hold on;
    title('NewtonSolve');
    xlabel('x-Value');
    ylabel('y-Value');


    %draw ellipses
    a1 = 3;  a2 = 2;
    b1 = 2;  b2 = 2;
    x01 = 0; x02 = 2;
    y01 = 0; y02 = 3;
    i = -pi:0.01:pi;

    f1x1 = x01 + a1*cos(i);
    f2x2 = x02 + a2*cos(i);
    
    f1y1 = y01 + b1*sin(i);
    f2y2 = y02 + b2*sin(i);
    
    plot(f1x1,f1y1,'-');
    plot(f2x2,f2y2,'-');
        
    %disp(array);
    for i = 1:size(array,1)
        x1(i) = array(i,1);
        x2(i) = array(i,2);
        %disp(size(array,1));
        plot(x1,x2,'o','Color', 'b');
        pause(1);
        if i == size(array,1)
            p = plot(array(size(array,1),1),array(size(array,1),2),'*','Color', [0.4660 0.6740 0.1880]);
            p.MarkerSize = 20;
            yAxes = ylim();
            xAxes = xlim();
            plot([array(size(array,1),1), array(size(array,1),1)],yAxes);
            plot(xAxes,[array(size(array,1),2), array(size(array,1),2)]);
            subtitle("Solution: x1 = " + num2str(x1(i)) + "   x2 = " + num2str(x2(i)))
        end
    end
end
