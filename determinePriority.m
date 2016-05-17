function priority = determinePriority(bbox, priorityBorder)

    % bbox(1,2) are the upper left corner coords
    % use the lower left corner
    car = bbox(1:2)+[1 bbox(4)];
    pb1 = priorityBorder.pb1;
    pb2 = priorityBorder.pb2;
    pb3 = priorityBorder.pb3;
    
   if car(2) >= pb3(1,2) && ...
        isRightOfLine(pb3(1,:), pb3(2,:),car) 
        priority = 3;
    elseif  car(1) <= pb2(2,1) && ...
            car(2) <= pb2(1,2) && ...
        ~isRightOfLine(pb2(1,:), pb2(2,:),car)
        priority = 2;
    elseif car(1) > pb1(1,1) && ...
        ~isRightOfLine(pb1(1,:), pb1(2,:),car)
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

