function cont_img = myLinearContrastStretching(img)
%     a     = '..\data\B_W_Low_Contrast.jpg';
%     img   = imread(a,'jpg');
%     figure(1), imshow(img);
[row, column, noOfColorBands]   = size(img);
if noOfColorBands == 3
    img   = double(img);
    red   = img(:,:,1); % Red channel
    green = img(:,:,2); % Green channel
    blue  = img(:,:,3); % Blue channel
    
    %for red channel
    M = max(red(:));
    m = min(red(:));
    if M == m
        cont_red = red;
    else
        fact     = 255/(M-m);
        cont_red = (red-m).*fact;
    end
    
    %for green channel
    M = max(green(:));
    m = min(green(:));
    if M == m
        cont_green = green;
    else
        fact       = 255/(M-m);
        cont_green = (green-m).*fact;
    end
    
    %for blue channel
    M = max(blue(:));
    m = min(blue(:));
    if M == m
        cont_blue = blue;
    else
        fact      = 255/(M-m);
        cont_blue = (blue-m).*fact;
    end
    
    cont_img = cat(3, cont_red, cont_green, cont_blue);
    cont_img=uint8(cont_img);
    
elseif noOfColorBands == 1
    M = max(img(:));
    m = min(img(:));
    if M == m
        cont_img = img;
    else
        fact       = 255/(M-m);
        cont_img = (img-m).*fact;
    end
    cont_img=uint8(cont_img);
end
%     figure(2), imshow(uint8(cont_img));
%     colormap(figure(2));
end
