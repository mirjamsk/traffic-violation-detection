function displayTrackingResults(frame, car_tracks, mask, system_object)
        % Convert the frame and the mask to uint8 RGB.
        frame = im2uint8(frame);
        mask = uint8(repmat(mask, [1, 1, 3])) .* 255;

        minVisibleCount = 0;
        if ~isempty(car_tracks)

            % Noisy detections tend to result in short-lived tracks.
            % Only display tracks that have been visible for more than
            % a minimum number of frames.
            reliableTrackInds = ...
                [car_tracks(:).totalVisibleCount] > minVisibleCount;
            reliableTracks = car_tracks(reliableTrackInds);

            % Display the objects. If an object has not been detected
            % in this frame, display its predicted bounding box.
            if ~isempty(reliableTracks)
                % Get bounding boxes.
                bboxes = cat(1, reliableTracks.bbox);

                % Get ids.
                ids = int32([reliableTracks(:).id]);
                priorities = int32([reliableTracks(:).priority]);
                priorities = cellstr(int2str(priorities'));


                % Create labels for objects indicating the ones for
                % which we display the predicted rather than the actual
                % location.
                ids = cellstr(int2str(ids'));
                labels = strcat('id: ', ids, ' priority: ', priorities);
                predictedTrackInds = ...
                    [reliableTracks(:).consecutiveInvisibleCount] > 0;
                isPredicted = cell(size(labels));
                isPredicted(predictedTrackInds) = {' predicted'};
                labels = strcat(labels, isPredicted);

                % Draw the objects on the frame.
                frame = insertObjectAnnotation(frame, 'rectangle', ...
                    bboxes, labels);

                % Draw the objects on the mask.
                mask = insertObjectAnnotation(mask, 'rectangle', ...
                    bboxes, labels);
            end
        end

        % Display the mask and the frame.
        system_object.maskPlayer.step(mask);
        system_object.videoPlayer.step(frame);
        %imtool(frame);
        %pause;

end