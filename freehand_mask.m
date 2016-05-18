function binaryImage=freehand_mask(grayImage, videoId)

% Demo to have the user freehand draw an irregular shape over
% a gray scale image, have it extract only that part to a new image,
% and to calculate the mean intensity value of the image within that shape.
%
% Change the current folder to the folder of this m-file.
    fontSize=11;
    f = figure, imshow(grayImage, []);
    title('Original Grayscale Image', 'FontSize', fontSize);
    set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
    message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
    uiwait(msgbox(message));
    hFH = imfreehand();
    % Create a binary image ("mask") from the ROI object.
    binaryImage = hFH.createMask();
    
    % Display the freehand mask.
    subplot(2, 3, 2);
    imshow(binaryImage);
    title('Binary mask of the region', 'FontSize', fontSize);

    % Get coordinates of the boundary of the freehand drawn region.
    structBoundaries = bwboundaries(binaryImage);
    xy=structBoundaries{1}; % Get n by 2 array of x,y coordinates.
    x = xy(:, 2); % Columns.
    y = xy(:, 1); % Rows.
    subplot(2, 3, 1); % Plot over original image.
    hold on; % Don't blow away the image.
    plot(x, y, 'LineWidth', 2);
    drawnow; % Force it to draw immediately.
    % Burn line into image by setting it to 255 wherever the mask is true.
    burnedImage = grayImage;
    burnedImage(binaryImage) = 255;
    % Display the image with the mask "burned in."
    subplot(2, 3, 3);
    imshow(burnedImage);
    caption = sprintf('New image with\nmask burned into image');
    title(caption, 'FontSize', fontSize);
    % Mask the image and display it.
    % Will keep only the part of the image that's inside the mask, zero outside mask.
    blackMaskedImage = grayImage;
    blackMaskedImage(~binaryImage) = 0;
    subplot(2, 3, 4);
    imshow(blackMaskedImage);
    saveas(f,strcat('setup_params/freehandMask_', videoId,'.bmp'))
    save(strcat('setup_params/freehandMask_', videoId,'.mat'),'binaryImage');

end