clc
clear 
close all

%% display the video

foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, ...
    'NumTrainingFrames', 50);
se = strel('square', 3); % morphological filter for noise removal
blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);
vid = videoLoad();
while ~isDone(vid.reader)
    frame = step(vid.reader);
    foreground = step(foregroundDetector, frame);
    filteredForeground = imopen(foreground, se);
    bbox = step(blobAnalysis, filteredForeground);
    
    result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');
    numCars = size(bbox, 1);
    result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
        'FontSize', 14);
    step(vid.videoPlayer,result);
end

release(vid.reader);
release(vid.videoPlayer); % treba osloboditi objekte nakon zavrsetka