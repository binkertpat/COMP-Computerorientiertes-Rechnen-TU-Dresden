
function movingClock()  
    figure('Name','Uhrzeit');    
    hold on;
    
    r = 12;
    theta = 0 : pi/60 : 2*pi;
    xcoords = r * cos(theta);
    ycoords = r * sin(theta);
    
    %for the perfect round circle
    set(gcf,'position',[0,0,500,450])
    set(gcf,'color','w');
    plot(xcoords,ycoords, "r");
    axis equal;
    axis off;
   
    r = r - 2;
    numberIndex = 1;
    for grad = 60 : -30 : -270
        theta = grad * pi/180;
        xCoordsCaption = r * cos(theta) - 2/3;
        yCoordsCaption = r *sin(theta);
        text(xCoordsCaption,yCoordsCaption,num2str(numberIndex),'color',"g", 'FontSize', 20);
        numberIndex = numberIndex + 1;
    end
    
    r = r + 2;
    
    %drawing hour line
    for grad = 0 : 30 : 360
        theta = grad * pi/180;
        xCoordHourLine1 =(r - 1.2) * cos(theta); 
        xCoordHourLine2 =r * cos(theta); 
        xCoordsHourLine = [xCoordHourLine1 xCoordHourLine2];
        yCoordHourLine1 = (r - 1.2) * sin(theta); 
        yCoordHourLine2 = r * sin(theta); 
        yCoordsHourLine = [yCoordHourLine1 yCoordHourLine2];
        plot(xCoordsHourLine,yCoordsHourLine,'linewidth',2,'color',"k");
    end
    
    %drawing minute line
    for grad = 0 : 6 : 360
        theta = grad * pi/180;
        xCoordMinuteLine1 =(r - 0.6) * cos(theta); 
        xCoordMinuteLine2 =r * cos(theta); 
        xCoordsMinuteLine = [xCoordMinuteLine1 xCoordMinuteLine2];
        yCoordMinuteLine1 = (r - 0.6) * sin(theta); 
        yCoordMinuteLine2 = r * sin(theta); 
        yCoordsMinuteLine = [yCoordMinuteLine1 yCoordMinuteLine2];
        plot(xCoordsMinuteLine,yCoordsMinuteLine,'linewidth',1,'color',"k");
    end
    
    while(true)
        actualTime = clock;
        %disp(actualTime)
        s = actualTime(6);
        m = actualTime(5) + (s / 60); %adding second portion for continuous moving
        h = actualTime(4) + (m / 60)  + (s / 3600); %adding minute and second portion for continuous moving
        
        %drawing hour pointer
        theta = (90 - (360/12 * h)) * pi/180 ;
        xCoordHourPointer =(r - 3) * cos(theta); 
        xCoordsHourPointer = [0 xCoordHourPointer];
        yCoordHourPointer =(r - 3) * sin(theta); 
        yCoordsHourPointer = [0 yCoordHourPointer];
        hourPlot = plot(xCoordsHourPointer,yCoordsHourPointer,'linewidth',3,'color',"r");

        %drawing minute pointer
        theta = (90 - (360/60 * m)) * pi/180 ;
        xCoordMinutePointer =(r - 0.5) * cos(theta); 
        xCoordsMinutePointer = [0 xCoordMinutePointer];
        yCoordMinutePointer =(r - 0.5) * sin(theta); 
        yCoordsMinutePointer = [0 yCoordMinutePointer];
        minutePlot = plot(xCoordsMinutePointer,yCoordsMinutePointer,'linewidth',2,'color',"r");

        %drawing second pointer
        theta = (90 - (360/60 * s)) * pi/180 ;
        xCoordSecondPointer =(r - 0.5) * cos(theta); 
        xCoordsSecondPointer = [0 xCoordSecondPointer];
        yCoordSecondPointer =(r - 0.5) * sin(theta); 
        yCoordsSecondPointer = [0 yCoordSecondPointer];
        secondPlot = plot(xCoordsSecondPointer,yCoordsSecondPointer,'linewidth',1,'color',"r");
        
        pause(0.01);
        delete(hourPlot);
        delete(minutePlot);
        delete(secondPlot);
    end
end

    
