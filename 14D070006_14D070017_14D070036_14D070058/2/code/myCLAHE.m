
function newimg = myCLAHE(img, threshold,N)
% >5 mins

    [rows1, columns1, numberOfColorBands] = size(img);
if numberOfColorBands == 3
    red   = img(:, :, 1);                                               % Red channel
    green = img(:, :, 2);                                               % GreenChannel
    blue  = img(:, :, 3);                                               % Blue Channel
    
    
    red3   = double(zeros(rows1, columns1));                            % construct a blank matrix
    green3 = double(zeros(rows1, columns1));                            % construct a blank matrix
    blue3  = double(zeros(rows1, columns1));                            % construct a blank matrix
    
    h=waitbar(0,'computing CLAHE-red');
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
            if x<size(red, 1)-N                                     % no of columns
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
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [rows, columns, numberOfColorBands] = size(red1);
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));			% construct a blank matrix
            n               = rows*columns;							% total number of pixels
            T               = zeros(256, 1);                     	% blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);						% probability distribution function array
            cdf             = zeros(256, 1);						% cumulative distribution function array
            outDomain       = zeros(256, 1);						% output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows                                          % loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = red1(i, j);
                    T(k+1)   = T(k+1)+1;                            % construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n;                            % construct the pdf of a
                end
            end
            
            %               threshold  = 150;                                       % num of pixels is to be added here
            sum_pixels = 0;
            for i = 1:256
                if T(i)>threshold
                    sum_pixels = sum_pixels+(T(i)-threshold);
                    T(i)       = threshold;
                end
            end
            equal_dist = sum_pixels/256;
            for i = 1:256
                T(i) = T(i)+equal_dist;
            end
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;									% construct the cumulative array
                cdf(i)       = cum(i)/n;							% construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);         % map the cumulative density function to the new domain and round it off
            end
            red3(x, y) = double(outDomain((red(x, y)+1)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Green Channel %
    
 h=waitbar(0,'computing CLAHE-green');
    ctr=0;
    for x = 1:rows1
        for y = 1:columns1
            ctr=ctr+1;
            waitbar(ctr/(rows1*columns1));
            % extract from pixel x, y (for green):
            if x>N
                x1 = x-N;
            else
                x1 = 1;
            end
            if x<size(green, 1)-N                                   % no of columns
                x2 = x+N;
            else
                x2 = size(green, 1);
            end
            if y>N
                y1 = y-N;
            else
                y1 = 1;
            end
            if y<size(green, 2)-N                                   % no of rows
                y2 = y+N;
            else
                y2 = size(green, 2);
            end
            green1 = green(x1:x2, y1:y2);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [rows, columns, numberOfColorBands] = size(green1);
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));			% construct a blank matrix
            n               = rows*columns;							% total number of pixels
            T               = zeros(256, 1);						% blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);						% probability distribution function array
            cdf             = zeros(256, 1);						% cumulative distribution function array
            outDomain       = zeros(256, 1);						% output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows                                          % loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = green1(i, j);
                    T(k+1)   = T(k+1)+1;                            % construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n;                            % construct the pdf of a
                end
            end
            
            %               threshold = 150;                                        % num of pixels is to be added here
            sum_pixels = 0;
            for i = 1:256
                if T(i)>threshold
                    sum_pixels = sum_pixels;+(T(i)-threshold);
                    T(i)       = threshold;
                end
            end
            equal_dist = sum_pixels/256;
            for i = 1:256
                T(i) = T(i)+equal_dist;
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;									% construct the cumulative array
                cdf(i)       = cum(i)/n;							% construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);         % map the cumulative density function to the new domain and round it off
            end
            green3(x, y) = double(outDomain((green(x, y)+1)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
        end
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Blue Channel %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     h=waitbar(0,'computing CLAHE-blue');
    ctr=0;
    for x = 1:rows1
        for y = 1:columns1
            ctr=ctr+1;
            waitbar(ctr/(rows1*columns1));
            % extract from pixel x, y (for blue):
            if x>N
                x1 = x-N;
            else
                x1 = 1;
            end
            if x<size(blue, 1)-N                                    % no of columns
                x2 = x+N;
            else
                x2 = size(blue, 1);
            end
            if y>N
                y1 = y-N;
            else
                y1 = 1;
            end
            if y<size(blue, 2)-N                                    % no of rows
                y2 = y+N;
            else
                y2 = size(blue, 2);
            end
            blue1 = blue(x1:x2, y1:y2);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [rows, columns, numberOfColorBands] = size(blue1);
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));			% construct a blank matrix
            n               = rows*columns;							% total number of pixels
            T               = zeros(256, 1);						% blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);						% probability distribution function array
            cdf             = zeros(256, 1);						% cumulative distribution function array
            outDomain       = zeros(256, 1);						% output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows                                          % loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = blue1(i, j);
                    T(k+1)   = T(k+1)+1;                            % construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n;                            % construct the pdf of a
                end
            end
            
            %               threshold = 150;                                        % num of pixels is to be added here
            sum_pixels = 0;
            for i = 1:256
                if T(i)>threshold
                    sum_pixels = sum_pixels;+(T(i)-threshold);
                    T(i)       = threshold;
                end
            end
            equal_dist = sum_pixels/256;
            for i = 1:256
                T(i) = T(i)+equal_dist;
            end
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;									% construct the cumulative array
                cdf(i)       = cum(i)/n;							% construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);         % map the cumulative density function to the new domain and round it off
            end
            blue3(x, y) = double(outDomain((blue(x, y)+1)));
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    newimg = cat(3, red3, green3, blue3);
    % Single ColorBand Images
    
elseif numberOfColorBands == 1
    red   = img(:, :, 1);                                               % Red channel
    
    [rows1, columns1, numberOfColorBands] = size(img);
    
    red3   = double(zeros(rows1, columns1));                            % construct a blank matrix
    
     h=waitbar(0,'computing CLAHE');
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
            if x<size(red, 1)-N                                     % no of columns
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
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [rows, columns, numberOfColorBands] = size(red1);
            
            sum             = 0;
            intensity_max   = 255;
            red2            = double(zeros(rows, columns));			% construct a blank matrix
            n               = rows*columns;							% total number of pixels
            T               = zeros(256, 1);						% blank array/histogram for no. of pixels in intensity range
            pdf             = zeros(256, 1);						% probability distribution function array
            cdf             = zeros(256, 1);						% cumulative distribution function array
            outDomain       = zeros(256, 1);						% output array/histogram which maps the cdf to intensity domain
            
            for i = 1:rows                                          % loop for constructing the arrays pdf, cdf and T
                for j = 1:columns
                    k        = red1(i, j);
                    T(k+1)   = T(k+1)+1;                            % construct the normal histogram of image a
                    pdf(k+1) = T(k+1)/n;                            % construct the pdf of a
                end
            end
            
            for i = 1:256
                sum          = sum+T(i);
                cum(i)       = sum;									% construct the cumulative array
                cdf(i)       = cum(i)/n;							% construct the cumulative density function
                outDomain(i) = round(cdf(i)*intensity_max);         % map the cumulative density function to the new domain and round it off
            end
            red3(x, y) = double(outDomain((red(x, y)+1)));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
    newimg = rede;
end
newimg=uint8(newimg);
end
