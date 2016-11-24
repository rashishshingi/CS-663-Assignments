function newimg = myAHE(img,N)
%     img = imread('TEM.png');
img = double(img);
[rows1, columns1, numberOfColorBands] = size(img);
%     figure;imshow(uint8(img));

if numberOfColorBands == 3
    red     = img(:, :, 1);                                     % Red channel
    green   = img(:, :, 2);                                     % GreenChannel
    blue    = img(:, :, 3);                                     % Blue Channel
    red3    = double(zeros(rows1, columns1));					% Construct a blank matrix
    green3  = double(zeros(rows1, columns1));					% Construct a blank matrix
    blue3   = double(zeros(rows1, columns1));					% Construct a blank matrix
    
    h=waitbar(0,'computing AHE');
    ctr=0;
    for x = 1:rows1
        for y = 1:columns1
            ctr=ctr+1;
            waitbar(ctr/(rows1*columns1));
            if x>N
                x1 = x-N;
            else
                x1 = 1;
            end
            if x<size(red, 1)-N     %no of columns
                x2 = x+N;
            else
                x2 = size(red, 1);
            end
            if y>N
                y1 = y-N;
            else
                y1 = 1;
            end
            
            if y<size(red, 2)-N
                y2 = y+N;
            else
                y2 = size(red, 2);
            end
            red1   = red(x1:x2, y1:y2);
            green1 = green(x1:x2, y1:y2);
            blue1  = blue(x1:x2, y1:y2);
            [rows, columns, numberOfColorBands] = size(red1);
            
            %%%%%%%%%%%%% RED CHANNEL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));		% Construct a blank matrix
            n               = rows*columns;						% Total number of pixels
            T               = zeros(256, 1);					% Blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);					% Probability distribution function array
            cdf             = zeros(256, 1);					% Cumulative distribution function array
            outDomain       = zeros(256, 1);					% Output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows										% Loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = red1(i, j);
                    T(k+1)   = T(k+1)+1;           				% Construct the normal histogram of image a
                    pdf(k+1) =  T(k+1)/n; 						% Construct the pdf of a
                end
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;								% Construct the cumulative array
                cdf(i)       = cum(i)/n;						% Construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);		% Map the cumulative density function to the new domain and round it off
            end
            red3(x, y) = double(outDomain((red(x, y)+1)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));		% Construct a blank matrix
            n               = rows*columns;						% Total number of pixels
            T               = zeros(256, 1);					% Blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);					% Probability distribution function array
            cdf             = zeros(256, 1);					% Cumulative distribution function array
            outDomain       = zeros(256, 1);					% Output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows										% Loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = green1(i, j);
                    T(k+1)   = T(k+1)+1;           				% Construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n; 						% Construct the pdf of a
                end
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;								% Construct the cumulative array
                cdf(i)       = cum(i)/n;						% Construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);		% Map the cumulative density function to the new domain and round it off
            end
            green3(x, y) = double(outDomain((green(x, y)+1)));
            
            %%%%%%%%%%%%% BLUE CHANNEL %%%%%%%%%%%%%%%%%%%
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));		% Construct a blank matrix
            n               = rows*columns;						% Total number of pixels
            T               = zeros(256, 1);					% Blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);					% Probability distribution function array
            cdf             = zeros(256, 1);					% Cumulative distribution function array
            outDomain       = zeros(256, 1);					% Output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows										% Loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = blue1(i, j);
                    T(k+1)   = T(k+1)+1;           				% Construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n; 						% Construct the pdf of a
                end
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;								% Construct the cumulative array
                cdf(i)       = cum(i)/n;						% Construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);		% Map the cumulative density function to the new domain and round it off
            end
            blue3(x, y) = double(outDomain((blue(x, y)+1)));
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    newimg = cat(3, red3, green3, blue3);
    % Single ColorBand Images
    
    
elseif numberOfColorBands == 1
    red  = img(:, :, 1);                                        % Red channel
    red3 = double(zeros(rows1, columns1));                      % Construct a blank matrix
    
     h=waitbar(0,'computing AHE');
    ctr=0;
    for x = 1:rows1
        for y = 1:columns1
            
            ctr=ctr+1;
            waitbar(ctr/(rows1*columns1));
            
            
            if x>N
                x1 = x-N;
            else
                x1 = 1;
            end
            if x<size(red, 1)-N                                 % No of columns
                x2 = x+N;
            else
                x2 = size(red, 1);
            end
            if y>N
                y1 = y-N;
            else
                y1 = 1;
            end
            
            if y<size(red, 2)-N
                y2 = y+N;
            else
                y2 = size(red, 2);
            end
            red1 = red(x1:x2, y1:y2);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [rows, columns, numberOfColorBands] = size(red1);
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));		% Construct a blank matrix
            n               = rows*columns;						% Total number of pixels
            T               = zeros(256, 1);					% Blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);					% Probability distribution function array
            cdf             = zeros(256, 1);					% Cumulative distribution function array
            outDomain       = zeros(256, 1);					% Output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows										% Loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = red1(i, j);
                    T(k+1)   = T(k+1)+1;           				% Construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n; 						% Construct the pdf of a
                end
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;								% Construct the cumulative array
                cdf(i)       = cum(i)/n;						% Construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);		% Map the cumulative density function to the new domain and round it off
            end
            red3(x, y) = double(outDomain((red(x, y)+1)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
    newimg = red3;
end
newimg=uint8(newimg);
end