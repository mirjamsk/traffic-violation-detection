function test_priority_func(videoId)

default_params =  loadParameters('default_params');
custom_params = loadParameters(videoId);
params = setstructfields(default_params, custom_params);

priorityPolygons = params.priorityPolygons;

polyP1 = priorityPolygons.polyP1;
polyP2 = priorityPolygons.polyP2;
polyP3 = priorityPolygons.polyP3;

colorP1 = [0.9 0.4 0.6];
colorP2 = [0.3 0.8 0.5];
colorP3 = [0.5 0.4 0.9];

figure('position', [0, 0, 1920, 1080])  % create new figure with specified size

title(strcat('Priority determination according for:  ', videoId), 'Interpreter', 'none');
set(axes,'YDir','reverse'), hold on;

plot(polyP1(:,1), polyP1(:,2), 'Color', colorP1) % polygon
plot(polyP2(:,1), polyP2(:,2), 'Color', colorP2) % polygon
plot(polyP3(:,1), polyP3(:,2), 'Color', colorP3) % polygon

for y=0:30:1080
    for x=0:30:1920
        priority = determinePriority([x,y, 0,0], priorityPolygons);
        [markerSize, color] = getPriorityStyle(priority);
        plot(x, y, 'Marker', '+', 'MarkerSize', markerSize,  'Color', color), hold on;
    end
end

legend({'Priority = 1','Priority = 2', 'Priority = 3'});
hold off;

% helper functions

    function [markerSize, color] = getPriorityStyle(priority)
        markerSize = 5;
        switch priority
            case -1
                markerSize = 1;
                color = [0.8 0.8 0.8];
            case 1
                color = colorP1;
            case 2
                color = colorP2;
            case 3
                color = colorP3;
        end;
    end

    
end