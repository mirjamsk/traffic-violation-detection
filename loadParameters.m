function params = loadParameters(video)

videoId = strsplit(video, {'/','\','.'});
videoId = videoId(end-1);
paramsCustom = strcat('setup_params/', videoId{1},'.mat');
paramsDefault = 'setup_params/default_params.mat';
try
    params = load(paramsCustom);
    fprintf('Loaded initial params from: %s \n', paramsCustom);
    
catch
    params = load(paramsDefault);
    fprintf('Could not load %s \nUsing %s instead', paramsCustom, paramsDefault);
end

end