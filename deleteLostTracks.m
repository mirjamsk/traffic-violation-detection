function [ car_tracks ] = deleteLostTracks( car_tracks )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    if isempty(car_tracks)
        return;
    end

    invisibleForTooLong = 20;
    ageThreshold = 8;

    % Compute the fraction of the track's age for which it was visible.
    ages = [car_tracks(:).age];
    totalVisibleCounts = [car_tracks(:).totalVisibleCount];
    visibility = totalVisibleCounts ./ ages;

    % Find the indices of 'lost' tracks.
    lostInds = (ages < ageThreshold & visibility < 0.6) | ...
    [car_tracks(:).consecutiveInvisibleCount] >= invisibleForTooLong;

    % Delete lost tracks.
    car_tracks = car_tracks(~lostInds);

end

