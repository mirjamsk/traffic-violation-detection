function [ system_object ] = setupSystemObject(video)
% Function sets up all necessary system objects
% Initializes video I/O, create objects for reading a video from a file, drawing the tracked
% objects in each frame, and playing the video.
switch video
    case 'video_data_sunday/IMG_6914.mov'
        maximumBlobArea = 230000;
    otherwise
        maximumBlobArea = 90000;
end;

system_object.reader = vision.VideoFileReader(video);
system_object.videoPlayer = vision.VideoPlayer('Position', [20, 400, 700, 400]);
system_object.maskPlayer = vision.VideoPlayer('Position', [740, 400, 700, 400]);

system_object.detector = vision.ForegroundDetector( ...
    'NumGaussians', 5, ...
    'NumTrainingFrames', 50, ...
    'MinimumBackgroundRatio', 0.2);

system_object.blobAnalyser = vision.BlobAnalysis( ...
    'AreaOutputPort', true, ...
    'CentroidOutputPort', true, ...
    'BoundingBoxOutputPort', true, ...
    'MinimumBlobArea', 3000, ...
    'MaximumBlobArea', maximumBlobArea);

end

