function reportedViolations=checkForViolations(car_tracks, reportedViolations)

cars_p1 = car_tracks([car_tracks(:).priority] == 1);
cars_p2 = car_tracks([car_tracks(:).priority] == 2);
cars_p3 = car_tracks([car_tracks(:).priority] == 3);

if length(cars_p1) + length(cars_p1) == 0 
    return
end
for i = 1:length(cars_p2)
    % width or length cannot be 0
    if any(cars_p2(i).bbox(3:4) <=0) 
        continue
    end
    %case priority 1 vs 2
    for j = 1:length(cars_p1)
        if any(cars_p1(j).bbox(3:4) <= 0) || ...
                any(reportedViolations == cars_p1(j).id)
            continue;
        end
        overlapRatio = bboxOverlapRatio( cars_p2(i).bbox,  cars_p1(j).bbox);
        if overlapRatio >=0.2 && abs(cars_p2(i).velocity - cars_p1(j).velocity) > 300
            reportedViolations(end+1) = cars_p1(j).id;
            fprintf('Violation! overlap ratio between %d and %d = %.2f \n',cars_p2(i).id, cars_p1(j).id,  overlapRatio)
            fprintf('%d. carsv= %.2f \n',cars_p2(i).id, cars_p2(i).velocity)
            fprintf('%d. carsv= %.2f \n',cars_p1(j).id, cars_p1(j).velocity)
        end
    end
    
    %case priority 2 vs 3
    for j = 1:length(cars_p3)
        if  any(cars_p3(j).bbox(3:4) <= 0) || ...
                any(reportedViolations == cars_p3(j).id)
            continue;
        end
        overlapRatio = bboxOverlapRatio( cars_p2(i).bbox,  cars_p3(j).bbox);
        if overlapRatio >=0.99 && abs(cars_p2(i).velocity - cars_p3(j).velocity) > 300
            reportedViolations(end+1) = cars_p3(j).id;
            fprintf('Violation! overlap ratio between %d and %d = %.2f \n',cars_p2(i).id, cars_p3(j).id,  overlapRatio)
            fprintf('%d. carsv= %.2f \n',cars_p2(i).id, cars_p2(i).velocity)
            fprintf('%d. carsv= %.2f \n',cars_p3(j).id, cars_p3(j).velocity)
        end
    end 
end
end