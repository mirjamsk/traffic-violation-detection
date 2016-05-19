function priority = determinePriority(bbox, priorityPolygons)

    % bbox(1,2) are the upper left corner coords
    % use the lower left corner
    car = bbox(1:2);
    carWidth = bbox(3);
    carHeight = bbox(4);
    
    polyP1 = priorityPolygons.polyP1;
    polyP2 = priorityPolygons.polyP2;
    polyP3 = priorityPolygons.polyP3;
    
   if inpolygon(car(1)+carWidth, car(2)+carHeight, polyP3(:,1), polyP3(:,2))
        priority = 3;
    elseif  inpolygon(car(1)+carWidth, car(2)+carHeight, polyP2(:,1), polyP2(:,2))
        priority = 2;
    elseif inpolygon(car(1), car(2)+carHeight, polyP1(:,1), polyP1(:,2))
        priority = 1;
    else
        priority = -1;
    end
    
end

