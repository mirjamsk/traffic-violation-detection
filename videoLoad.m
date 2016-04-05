function vid = videoLoad()
        
        % Create a video file reader.
        % hard-coded, should find some nicer way to do it
        vid.reader = vision.VideoFileReader('C:\\Users\\Lu\\Desktop\\Polimi\\ImageAnalysis\\project\\videos\\skr.mp4');
        
        % Create video player to display the video.
        vid.videoPlayer = vision.DeployableVideoPlayer();
end

