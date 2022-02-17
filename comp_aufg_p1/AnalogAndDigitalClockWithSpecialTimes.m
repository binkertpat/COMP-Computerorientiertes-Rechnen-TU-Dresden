function AnalogAndDigitalClockWithSpecialTimes()  
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
        disp(actualTime)
        s = actualTime(6);
        m = actualTime(5) + (s / 60); %adding second portion for continuous moving
        h = actualTime(4) + (m / 60)  + (s / 3600); %adding minute and second portion for continuous moving
        
        %calcute angles for hour and minute pointer first, for checking
        %180° angle
        thetaHourPointer = (90-(360/12 * h)) * pi/180 ;
        thetaMinutePointer = (90-(360/60 * m)) * pi/180 ;
        
        %calculate angle difference and convert to degrees
        differenceAngle = abs(thetaHourPointer - thetaMinutePointer);
        differenceAngleInDegress = differenceAngle * 180/pi;

        %set fontcolor resp. plotcolor for special times
        if differenceAngleInDegress >= 179.999 && differenceAngleInDegress <= 180.001
            color = "b";
        else
            color = "r";
        end
        
        %digital time printer inclusive fixing single string times to
        %stringLength 2
        concateTimeString = "";
        if strlength(num2str(fix(h))) == 1
            concateTimeString = concateTimeString + "0" + fix(h);
        else 
            concateTimeString = concateTimeString + fix(h);
        end
        
        concateTimeString = concateTimeString + ":";
        
        if strlength(num2str(fix(m))) == 1
            concateTimeString = concateTimeString + "0" + fix(m);
        else 
            concateTimeString = concateTimeString + fix(m);
        end
        
        concateTimeString = concateTimeString + ":";
        
        if strlength(num2str(fix(s))) == 1
            concateTimeString = concateTimeString + "0" + fix(s);
        else 
            concateTimeString = concateTimeString + fix(s);
        end
        
        %plot and print the digital time
        concateTimeString = concateTimeString + " Uhr";
        disp(concateTimeString); %console output for debugging
        xAxes = xlim();
        yAxes = ylim();
        analogTime = text(xAxes(1)-4,yAxes(2),concateTimeString,'color',color, 'FontSize', 20);
   
        %drawing hour pointer
        xCoordHourPointer =(r - 3) * cos(thetaHourPointer); 
        xCoordsHourPointer = [0 xCoordHourPointer];
        yCoordHourPointer =(r - 3) * sin(thetaHourPointer); 
        yCoordsHourPointer = [0 yCoordHourPointer];
        hourPlot = plot(xCoordsHourPointer,yCoordsHourPointer,'linewidth',3,'color',color);

        %drawing minute pointer
        xCoordMinutePointer =(r - 0.5) * cos(thetaMinutePointer); 
        xCoordsMinutePointer = [0 xCoordMinutePointer];
        yCoordMinutePointer =(r - 0.5) * sin(thetaMinutePointer); 
        yCoordsMinutePointer = [0 yCoordMinutePointer];
        minutePlot = plot(xCoordsMinutePointer,yCoordsMinutePointer,'linewidth',2,'color',color);
        
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
        delete(analogTime);
    end
end

