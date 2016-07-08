function [ car_tracks ] = deleteLostTracks( car_tracks )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    
    if isempty(car_tracks)
        return;
    end
    
    frame_x_width = 1920;
    invisibleForTooLong = 40;
    ageThreshold = 8;

    % Compute the fraction of the track's age for which it was visible.
    ages = [car_tracks(:).age];
    totalVisibleCounts = [car_tracks(:).totalVisibleCount];
    visibility = totalVisibleCounts ./ ages;
    
    % Check if a car has left the frame
    bboxMatrix = reshape([car_tracks(:).bbox], 4, []);
    leftFrame =  bboxMatrix(1,:) > frame_x_width | ...
        (bboxMatrix(1,:) < 0 & abs(bboxMatrix(1,:)) > bboxMatrix(3,:));

    % Find the indices of 'lost' tracks.
    lostInds = leftFrame | ...
    (ages < ageThreshold & visibility < 0.6) | ...
    [car_tracks(:).consecutiveInvisibleCount] >= invisibleForTooLong;  


    % Delete lost tracks.
    car_tracks = car_tracks(~lostInds);

end

