
function resizeImagesInFolder(images_folder, masks_folder, scale_to_downsample)

    image_names = getMultipleImagesFileNames(images_folder);
    masks_names = getMultipleImagesFileNames(masks_folder);
    
    for i = 1 : length(image_names)
        
        I = imread(fullfile(images_folder, image_names{i}));
        fov_mask = imread(fullfile(masks_folder, masks_names{i}));
        
        I = imresize(I, scale_to_downsample);
        fov_mask = imresize(fov_mask > 0, scale_to_downsample, 'nearest');
        
        imwrite(I, fullfile(images_folder, image_names{i}));
        imwrite(fov_mask > 0, fullfile(masks_folder, masks_names{i}));
        
    end

