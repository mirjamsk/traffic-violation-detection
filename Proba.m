clc
clear 
%close all

%% display the video

vid = videoLoad();

foregroundDetector = vision.ForegroundDetector('NumGaussians', 5, ...
    'NumTrainingFrames', 50);
for i = 1:150
    frame = step(vid.reader); % read the next video frame
    foreground = step(foregroundDetector, frame);
end

%figure; imshow(frame); title('Video Frame');

figure; imshow(foreground); title('Foreground');
if 0
se = strel('square', 3); % morphological filter for noise removal
filteredForeground = imopen(foreground, se);
figure; imshow(filteredForeground); title('Clean Foreground');
blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);

bbox = step(blobAnalysis, filteredForeground);
result = insertShape(frame, 'Rectangle', bbox, 'Color', 'green');

numCars = size(bbox, 1);
result = insertText(result, [10 10], numCars, 'BoxOpacity', 1, ...
    'FontSize', 14);
figure; imshow(result); title('Detected Cars');
end
%%vid = videoLoad();
if 0
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
end

release(vid.reader);
release(vid.videoPlayer); % treba osloboditi objekte nakon zavrsetka