function newimg = myBilinearInterpolation(img)
%     a   = '..\data\barbara.png';
%     img = imread(a,'png');
%     figure(1), imshow(img);
    img = double(img);
    
    [row, column, noOfColorBands] = size(img);
    new1          = [];
    newimg        = [];
    
    for i=1:(row-1)
        new1 = [];
        for j=1:(column-1)
            orig = getPixel(img, i, j);
            new  = pixelConvert(orig);
            new1 = [new1 new];
        end
        newimg = [newimg; new1];
    end
    
    newimg = uint8(newimg);
%     figure(2), imshow(newimg);
end
function new = pixelConvert(m)
    new      = [];
    new(1, 1, :) = m(1, 1, :);
    for i=1:3
        for j=1:2
            if (and(i==1, j==1))
                continue;
            else
                new(i, j, :) = (m(1, 1, :)*(4-i)*(3-j) + m(1, 2, :)*(4-i)*(j-1) + m(2, 1, :)*(i-1)*(3-j) + m(2, 2, :)*(i-1)*(j-1)) / ((4-i)*(3-j) + (4-i)*(j-1) + (i-1)*(3-j) + (i-1)*(j-1));
            end
        end
    end
end
function m = getPixel(img, i, j)
   p1=img(i, j, :);
   p2=img(i+1, j, :);
   p3=img(i, j+1, :);
   p4=img(i+1, j+1, :);
   m = [p1, p2; p3, p4];
end
