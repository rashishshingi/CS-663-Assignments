function output = myShrinkImageByFactorD(img, d)
%     a   = '..\data\circles_concentric.png';
%     img = imread(a,'png');
%     figure(1), imshow(img);
    img = double(img);
%     d   = uint32(2);
    
    [row, column, noOfColorBands]   = size(img);
    output                          = zeros(row/d, column/d, noOfColorBands);  
    [rnew, cnew, noOfColorBandsNew] = size(output);  

    for x = 1:rnew                                          % Change for loop limits
        for y = 1:cnew
            i = d*(x-1) + 1;                                % Change for loop limits 
            j = d*(y-1) + 1;
            output(x, y, :) = img(i, j, :);
        end
    end
%     figure(2), imshow(uint8(output));
end
