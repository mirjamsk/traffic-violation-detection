function car_tracks = updateAssignedTracks(assignments, centroids, bounding_boxes, car_tracks )
%The updateAssignedTracks function updates each assigned track with the corresponding detection. 
%It calls the correct method of vision.KalmanFilter to correct the location estimate. 
%Next, it stores the new bounding box, and increases 
%the age of the track and the total visible count by 1.
%Finally, the function sets the invisible count to 0.

    numAssignedTracks = size(assignments, 1);
    
    for i = 1:numAssignedTracks
        trackIdx = assignments(i, 1);
        detectionIdx = assignments(i, 2);
        centroid = centroids(detectionIdx, :);
        bbox = bounding_boxes(detectionIdx, :);

        % Correct the estimate of the object's location
        % using the new detection.
        correct(car_tracks(trackIdx).kalmanFilter, centroid);

        % Replace predicted bounding box with detected
        % bounding box.
        car_tracks(trackIdx).bbox = bbox;

        % Update track's age.
        car_tracks(trackIdx).age = car_tracks(trackIdx).age + 1;

        % Update visibility.
        car_tracks(trackIdx).totalVisibleCount = ...
        car_tracks(trackIdx).totalVisibleCount + 1;
        car_tracks(trackIdx).consecutiveInvisibleCount = 0;
    end
    
end

