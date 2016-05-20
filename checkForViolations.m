function reportedViolations=checkForViolations(car_tracks, reportedViolations)

carsP1 = car_tracks([car_tracks(:).priority] == 1);
carsP2 = car_tracks([car_tracks(:).priority] == 2);
carsP3 = car_tracks([car_tracks(:).priority] == 3);

if length(carsP1) + length(carsP3) == 0
    return
end
for i = 1:length(carsP2)
    % width or length cannot be 0
    if any(carsP2(i).bbox(3:4) <=0)
        continue
    end
    
    % case priority 1 vs 2
    for j = 1:length(carsP1)
        if ~(any(carsP1(j).bbox(3:4) <= 0) || any(reportedViolations == carsP1(j).id))
            reportedViolations = determineIfViolaitonP12(carsP1(j), carsP2(i), reportedViolations);
        end
    end
    
    % case priority 2 vs 3
    for j = 1:length(carsP3)
        if  ~(any(carsP3(j).bbox(3:4) <= 0) || any(reportedViolations == carsP3(j).id))
            reportedViolations = determineIfViolaitonP23(carsP2(i), carsP3(j), reportedViolations);
        end
    end
end
end