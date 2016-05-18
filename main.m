clc
clear 
close all
%%
% tested for
% 'video_data_sunday/IMG_5108.mov'
% 'video_data_sunday/IMG_6919.mov'

%%

%video = 'C:\\Users\\Lu\\Documents\\MATLAB\\IAProject\\video_data\\rooftop1_stabilized.avi';

videoPath = 'video_data_sunday/IMG_5108.mov';
videoId = getVideoId(videoPath); % this is just the IMG_6919 part of the videoPath
params = loadParameters(videoId);
car_tracking(videoPath, params);
