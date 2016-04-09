function car_tracks = predictNewLocationOfTracks(car_tracks)
% Use the Kalman filter to predict the centroid of each track in the current frame, 
% and update its bounding box accordingly.

    for i = 1:length(car_tracks)
        bbox = car_tracks(i).bbox;

        % Predict the current location of the track.
        predictedCentroid = predict(car_tracks(i).kalmanFilter);

        % Shift the bounding box so that its center is at
        % the predicted location.
        predictedCentroid = predictedCentroid - bbox(3:4) / 2;
        car_tracks(i).bbox = [predictedCentroid, bbox(3:4)];
        
    end
    
end