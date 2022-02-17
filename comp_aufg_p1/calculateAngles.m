function x = calculateAngles(hour,minute)
    %calculate hour angle
    thetaHour = (360/12 * hour) * pi/180 ;

    %calculate minute angle
    thetaMinute = (360/60 * minute) * pi/180 ;

    %calculate all possible angles
    diff1 = thetaHour - thetaMinute;
    diff2 = thetaMinute - thetaHour;

    %arc measure to degree
    diff1Degree = diff1 * 180/pi;
    diff2Degree = diff2 * 180/pi;

    %eliminate negative number and return minimum angle
    if diff1Degree < diff2Degree && diff1Degree >=0
        x = diff1Degree;
        %disp(diff1Degree);
    elseif diff2Degree >=0
        x = diff2Degree;
        %disp(diff2Degree);
    end
end