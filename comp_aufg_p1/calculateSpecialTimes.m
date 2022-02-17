function x = calculateSpecialTimes()
    arrayIndex = 1;
    %iterate throw all possible times
    for i = 0:23
        for j = 0:59
            for k = 0:0.01:59
                s = k;
                m = j + (s / 60); %adding second portion for continuous moving
                h = i + (m / 60)  + (s / 3600); %adding minute and second portion for continuous moving
        
                %calcute angles for hour and minute pointer first, for checking
                %180° angle
                thetaHourPointer = (360/12 * h) * pi/180 ;
                thetaMinutePointer = (360/60 * m) * pi/180 ;
        
                %calculate angle difference and convert to degrees
                differenceAngle = abs(thetaHourPointer - thetaMinutePointer);
                differenceAngleInDegress = differenceAngle * 180/pi;
                %disp(differenceAngleInDegress);
                %write special times in an 3-D-array
                if differenceAngleInDegress >= 179.999 && differenceAngleInDegress <= 180.001
                    specialTimesArray(arrayIndex, 1) = s;
                    specialTimesArray(arrayIndex, 2) = m;
                    specialTimesArray(arrayIndex, 3) = h;
                    arrayIndex = arrayIndex + 1;
                end
            end
        end
    end
    disp(specialTimesArray);
    x = specialTimesArray;
end