function priority = determinePriority(bbox)

    % bbox(1,2) are the upper left corner coords
    % use the lower left corner
    car = bbox(1:2)+[1 bbox(4)];
    borderPriority1 = [950, 650; 1720, 800];
    borderPriority2 = [40,700; 950, 650];
    borderPriority3 = [40,700; 1170, 950];
    
   if car(2) >= borderPriority3(1,2) && ...
        isRightOfLine(borderPriority3(1,:), borderPriority3(2,:),car) 
        priority = 3;
    elseif  car(1) <= borderPriority2(2,1) && ...
            car(2) <= borderPriority2(1,2) && ...
        ~isRightOfLine(borderPriority2(1,:), borderPriority2(2,:),car)
        priority = 2;
    elseif car(1) > borderPriority1(1,1) && ...
        ~isRightOfLine(borderPriority1(1,:), borderPriority1(2,:),car)
        priority = 1;
    else
        priority = -1;
    end
    
    function res=isRightOfLine(a,b,p)
        if (b(1) - a(1))*(p(2) - a(2)) - (b(2) - a(2))*(p(1) - a(1)) > 0;
            res = true;
        else
            res = false;
        end
    end
end

