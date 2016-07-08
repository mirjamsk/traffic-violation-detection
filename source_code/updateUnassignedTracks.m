function car_tracks = updateUnassignedTracks( car_tracks, unassignedTracks )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    for i = 1:length(unassignedTracks)
        ind = unassignedTracks(i);
        car_tracks(ind).age = car_tracks(ind).age + 1;
        car_tracks(ind).consecutiveInvisibleCount = ...
        car_tracks(ind).consecutiveInvisibleCount + 1;
    end


end

