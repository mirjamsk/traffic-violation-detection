function [ centroids, bboxes, mask] = detectCars(system_object,frame,freehandMask)
%The detectObjects function returns the centroids and the bounding boxes of 
%the detected objects. It also returns the binary mask, 
%which has the same size as the input frame. Pixels with a value of 1 correspond 
%to the foreground, and pixels with a value of 0 correspond to the background.

    % Detect the foreground in the current video frame
    mask = system_object.detector.step(frame);
    mask(freehandMask==0) = 0;

    % Use morphological opening to remove noise in the foreground
    se = strel('square', 3);
    
    mask = imopen(mask, se);
    mask = imclose(mask, se);
    mask = imfill(mask, 'holes');

    % Detect the connected components with the specified minimum area, and
    % compute their bounding boxes
    
    
    % Perform blob analysis to find connected components.
    [area, ~, identified_boxes] = system_object.blobAnalyser.step(mask);
    area;
    bboxes=[];
    centroids=[];
    %identified_boxes

    for k = 1:size(identified_boxes,1)
        bb = identified_boxes(k,:);
        xwidth = double(bb(3));
        ywidth = double(bb(4));
        frac = xwidth/ywidth;
        
        if frac >= 0.9 
            centroids(k,:) = [(bb(1)+bb(3)/2) (bb(2)+bb(4)/2)];
            bboxes(k,:) = bb;
            
        end
    
    end 

end

