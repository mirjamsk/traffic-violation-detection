function [car_tracks,nextID] = createNewTracks(centroids, bounding_boxes, unassignedDetections, car_tracks, nextID)
        centroids = centroids(unassignedDetections, :);
        bounding_boxes = bounding_boxes(unassignedDetections, :);

        for i = 1:size(centroids, 1)

            centroid = centroids(i,:);
            bbox = bounding_boxes(i, :);

            % Create a Kalman filter object.
            kalmanFilter = configureKalmanFilter('ConstantVelocity', ...
                centroid, [200, 50], [100, 25], 100);

            % Create a new track.
            newTrack = struct(...
                'id', nextID, ...
                'bbox', bbox, ...
                'kalmanFilter', kalmanFilter, ...
                'age', 1, ...
                'totalVisibleCount', 1, ...
                'consecutiveInvisibleCount', 0);

            % Add it to the array of tracks.
            car_tracks(end + 1) = newTrack;

            % Increment the next id.
            nextID = nextID + 1;
        end
    end