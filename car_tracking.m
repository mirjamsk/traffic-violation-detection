function car_tracking(video)
% detects cars, detects traffic violations
%   Detailed explanation goes here

% Create System objects used for reading video, detecting moving objects,
% and displaying the results.
system_object = setupSystemObject(video);

%% Create an empty array of tracks 
car_tracks = initializeCarTracks();

%% ID tracker
nextID = 1;

%% Detect moving objects and track them across video frames
frame = system_object.reader.step(); % read frames
freehandMask = freehand_mask(frame);
% mogle bi saveat ovaj objekat i samo ga iscitat iz filea
% save(video + '_mask',freehandMask)

while ~isDone(system_object.reader)
    frame = system_object.reader.step(); % read frames

    [centroids, bounding_boxes, mask] = detectCars(system_object,frame, freehandMask);
    car_tracks = predictNewLocationOfTracks(car_tracks);
    
    [assignments, unassignedTracks, unassignedDetections] = ...
        detectionToTrackAssignment(car_tracks,centroids);

    car_tracks = updateAssignedTracks(assignments, centroids, bounding_boxes, car_tracks);
    car_tracks = updateUnassignedTracks(car_tracks, unassignedTracks);
    car_tracks = deleteLostTracks(car_tracks);
    [car_tracks, nextID ] = createNewTracks(centroids, bounding_boxes, unassignedDetections, car_tracks, nextID);

    displayTrackingResults(frame, car_tracks, mask, system_object);
end

end
