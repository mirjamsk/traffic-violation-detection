function [assignments, unassignedTracks, unassignedDetections] = detectionToTrackAssignment(car_tracks, centroids)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    nTracks = length(car_tracks);
    nDetections = size(centroids, 1);

    % Compute the cost of assigning each detection to each track.
    cost = zeros(nTracks, nDetections);
    for i = 1:nTracks
          cost(i, :) = distance(car_tracks(i).kalmanFilter, centroids);
    end

    % Solve the assignment problem.
    costOfNonAssignment = 20;
    [assignments, unassignedTracks, unassignedDetections] = ...
            assignDetectionsToTracks(cost, costOfNonAssignment);


end

