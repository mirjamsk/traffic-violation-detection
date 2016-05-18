function test_priority_func(video)
params = loadParameters(video);
priorityBorder = params.priorityBorder;
pb1 = priorityBorder.pb1;
pb2 = priorityBorder.pb2;
pb3 = priorityBorder.pb3;

figure('position', [0, 0, 1500, 1500])  % create new figure with specified size

title(strcat('Priority determination according for:  ', video), 'Interpreter', 'none');
set(axes,'YDir','reverse'), hold on;

line(pb1(:,1)',pb1(:,2)', 'Color','r', 'LineWidth',4), hold on;
line(pb2(:,1)',pb2(:,2)', 'Color','g', 'LineWidth',4), hold on;
line(pb3(:,1)',pb3(:,2)', 'Color','b', 'LineWidth',4), hold on;

for y=1:40:1080
    for x=1:40:1920
        priority = determinePriority([x,y, 0,0], priorityBorder);
        marker = getMarkerStyle(priority);
        plot(x, y, marker, 'MarkerSize', 5), hold on;
    end
end

legend({'Priority = 1','Priority = 2', 'Priority = 3'});
showBorderCoords();
hold off;

% helper functions

    function marker=getMarkerStyle(priority)
        switch priority
            case -1
                marker = 'yo';
            case 1
                marker = 'ro';
            case 2
                marker = 'go';
            case 3
                marker = 'bo';
        end;
    end

    function showBorderCoords()
        pbs = struct2cell(priorityBorder);
        for i = 1:numel(pbs)
            pb = pbs{i};
            str=strcat('(', num2str(pb, '%d, %d'),')');
            text(pb(:,1),pb(:,2)-15,str, ...
                'FontSize', 15,...
                'BackgroundColor', 'w', ...
                'VerticalAlignment', 'bottom');
        end
    end
end