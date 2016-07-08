function reportedViolations = determineIfViolaitonP12(carP1, carP2, reportedViolations)

deltaChar = char(916);
minOverlap = 0.2;
minDeltaDist = 10;
minDeltaVelocity = 250;

deltaX = carP2.bbox(1) - carP1.bbox(1);
if  deltaX >= minDeltaDist
    reportedViolations(end+1) = carP1.id;
    deltaY = carP1.bbox(2) + carP1.bbox(4) - (carP2.bbox(2) + carP2.bbox(4));
    
    fprintf('------------------\n');
    fprintf('Attention!\n')
    fprintf('Cars %d and %d ( priorities 2 and 1 respectively) just passed each other \n',carP2.id, carP1.id)
    fprintf('%cx = %.2f \n', deltaChar, deltaX);
    fprintf('%cy = %.2f \n', deltaChar, deltaY);
    
    if deltaY < minDeltaDist
        fprintf('Not a violation because %cy < %.2f \n', deltaChar, minDeltaDist);
    else
        overlapRatio = bboxOverlapRatio(carP2.bbox, carP1.bbox);
        fprintf('Overlap ratio =  %.2f \n', overlapRatio)
        if  overlapRatio < minOverlap
            fprintf('Final call: Not a violation because overlap ratio < %.2f \n', minOverlap);
        else
            deltaV = carP1.velocity - carP2.velocity;
            fprintf('%cv = %.2f \n', deltaChar, deltaV);
            if  deltaV < minDeltaVelocity
                fprintf('Final call: Not a violation because %cv < %.2f \n', deltaChar, minDeltaVelocity);
            else
                fprintf('Final call: Violation!\n');
            end
        end
    end
end
end
