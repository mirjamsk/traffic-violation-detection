function videoId = getVideoId(videoPath)
videoId = strsplit(videoPath, {'/','\','.'});
videoId = videoId(end-1);
videoId = videoId{1};
end