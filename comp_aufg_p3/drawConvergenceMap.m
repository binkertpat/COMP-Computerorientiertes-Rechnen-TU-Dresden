function drawConvergenceMap(xa, xe, ya, ye, accuracy, intervall)
    hold on;
    x = linspace(xa,xe,intervall);
    y = linspace(ya,ye,intervall);
    
    x01 = -0.5000 - 0.8660i;
    x02 = 1;
    x03 = -0.5000 + 0.8660i;
    
    [X, Y] = meshgrid(x,y);
   
    for i = 1:height(X)
        for j = 1:width(Y)
            currentSolution = imaginaryUnit(X(i,j)+Y(i,j)*1i);
            if abs(currentSolution-x01) <= accuracy
                Z(i,j) = 1;
            elseif abs(currentSolution-x02) <= accuracy
                Z(i,j) = 2;
            elseif abs(currentSolution-x03) <= accuracy
                Z(i,j) = 3;
            else
                Z(i,j) = 0;
            end
            %disp(Z(i,j));
        end
    end
    
    title('Newtonfraktal zu z^3-1');
    surf(X, Y, Z, 'edgecolor', 'none')
    colorbar('Ticks',[0,1,2,3],'TickLabels',{'-','x01','x02','x03'});
    view(2);
end