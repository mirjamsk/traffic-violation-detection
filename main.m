clc
clear 
close all
%%
% tested for
% 'video_data_sunday/IMG_5108.mov'
% 'video_data_sunday/IMG_6919.mov'

%%

%video = 'C:\\Users\\Lu\\Documents\\MATLAB\\IAProject\\video_data\\rooftop1_stabilized.avi';

video = 'video_data_sunday/IMG_5108.mov';
params = loadParameters(video);
car_tracking(video, params);
