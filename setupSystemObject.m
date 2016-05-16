function [ system_object ] = setupSystemObject(video)
% Function sets up all necessary system objects
% Initializes video I/O, create objects for reading a video from a file, drawing the tracked
% objects in each frame, and playing the video.

system_object.reader = vision.VideoFileReader(video);

system_object.videoPlayer = vision.VideoPlayer('Position', [20, 400, 700, 400]);
system_object.maskPlayer = vision.VideoPlayer('Position', [740, 400, 700, 400]);

system_object.detector = vision.ForegroundDetector('NumGaussians', 5, ...
            'NumTrainingFrames', 50, 'MinimumBackgroundRatio', 0.2);

system_object.blobAnalyser = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
            'AreaOutputPort', true, 'CentroidOutputPort', true, ...
            'MinimumBlobArea', 2000,'MaximumBlobArea', 70000);

end

