function car_tracks = updateVelocity(car_tracks)
fps = 25;
for i = 1:length(car_tracks)
    curr_bbox = car_tracks(i).bbox;
    old_bbox = car_tracks(i).bbox_initial;
    age = car_tracks(i).age;
    
    curr_centroid=[(curr_bbox(1)+curr_bbox(3)) (curr_bbox(2)+curr_bbox(4))];
    old_centroid=[(old_bbox(1)+old_bbox(3)) (old_bbox(2)+old_bbox(4))];
    
    dx = abs(curr_centroid(1) - old_centroid(1));
    vel_x = (dx /age)*fps;
    dy = abs(curr_centroid(2) - old_centroid(2));
    vel_y = (dy /age)*fps;   
    vel_z = sqrt(vel_x^2 + vel_y^2);
    
    car_tracks(i).velocity = vel_z;

end
end