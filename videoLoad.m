function vid = videoLoad()
        
        % Create a video file reader.
        % hard-coded, should find some nicer way to do it
        vid.reader = vision.VideoFileReader('C:\\Users\\Lu\\Documents\\MATLAB\\IAProject\\video_data\\violation_non_violation_cut1.mp4');
        
        % Create video player to display the video.
        vid.videoPlayer = vision.DeployableVideoPlayer();
end

