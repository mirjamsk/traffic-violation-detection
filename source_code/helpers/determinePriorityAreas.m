img = 'IMG_6908_02.bmp';
figure
imshow(img);
h = impoly(gca);
setColor(h,'r');

%%
RGB = imread(img);
%%
RGB = insertShape(RGB, 'FilledPolygon', {P1,P2,P3}, 'Color', {'red','green', 'blue'}, 'Opacity', 0.5);
imshow(RGB);
%%
P3=[]
for i=1:length(polyP3(:,1))
P3(end+1)= polyP3(i,1);
P3(end+1)= polyP3(i,2);
end
%%
P2=[]
for i=1:length(polyP2(:,1))
P2(end+1)= polyP2(i,1);
P2(end+1)= polyP2(i,2);
end
%%
P1=[]
for i=1:length(polyP1(:,1))
P1(end+1)= polyP1(i,1);
P1(end+1)= polyP1(i,2);
end