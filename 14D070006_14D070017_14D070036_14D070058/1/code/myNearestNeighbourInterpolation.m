function out_img = myNearestNeighboutInterpolation(img)
%     a   = '..\data\2.jpeg';
%     img = imread(a, 'jpeg');
%     figure(1), imshow(img);

    [row, column, noOfColorBands] = size(img);
    out_img = zeros(3*row-2, 2*column-1, noOfColorBands);
    
    out_img(1:3:end, 1:2:end, :) = img;
    out_img(1:3:end, 2:2:end, :) = out_img(1:3:end, (1:2:end-1)+2, :);
    out_img(2:3:end, 1:2:end, :) = out_img(1:3:end-1, 1:2:end, :);
    out_img(2:3:end, 2:2:end, :) = out_img(2:3:end, (1:2:end-1)+2, :); 
    out_img(3:3:end, 1:2:end, :) = out_img((1:3:end-1)+3, 1:2:end, :);
    out_img(3:3:end, 2:2:end, :) = out_img(3:3:end, (1:2:end-1)+2, :);
    
    out_img = uint8(out_img);
%     figure(3),imshow(out_img);
end
