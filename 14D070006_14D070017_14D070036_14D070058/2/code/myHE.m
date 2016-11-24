function newimg = myHE(img)
    % figure('Name', 'Original Image');imshow(Image);
    % figure('Name', 'Original Image histogram');imhist(Image);
    %
    % Global histogram equalization
    % Image = imread('TEM.png');

    [rows, columns, numberOfColorBands] = size(img);
    
    if numberOfColorBands == 3
        ar              = img(:, :, 1); 									% Take green channel
        sum             = 0;
        intensity_max   = 255;
        br              = uint8(zeros(rows, columns));						% Construct a blank matrix
        n               = rows*columns;										% Total number of pixels
        T               = zeros(256, 1);									% Blank array/histogram for no. of pixels in intensity range
        pdf             = zeros(256, 1);                                    % Probability distribution function array
        cdf             = zeros(256, 1);                                    % Cumulative distribution function array
        outDomain       = zeros(256, 1);                                    % Output array/histogram which maps the cdf to intensity domain

        for i = 1:rows                                                      % Loop for constructing the arrays pdf, cdf and T
            for j = 1:columns
                k        = ar(i, j);
                T(k+1)   = T(k+1)+1;                                        % Construct the normal histogram of image a
                pdf(k+1) = T(k+1)/n;                                        % Construct the pdf of a
            end
        end

        for i = 1:256
            sum = sum+T(i);
            cum(i)       = sum;                                             % Construct the cumulative array
            cdf(i)       = cum(i)/n;                                        % Construct the cumulative density function
            outDomain(i) = round(cdf(i)*intensity_max);                     % Map the cumulative density function to the new domain and round it off
        end

        for i = 1:rows
            for j = 1:columns
                br(i, j) = outDomain(ar(i, j)+1);                               %construct the output image b such that T(a)=b
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        ag              = img(:, :, 2);                                     % Take green channel.
        sum             = 0;
        intensity_max   = 255;
        bg              = uint8(zeros(rows, columns));						% Construct a blank matrix
        n               = rows*columns;										% Total number of pixels
        T               =	zeros(256, 1);									% Blank array/histogram for no. of pixels in intensity range
        pdf             = zeros(256, 1);                                    % Probability distribution function array
        cdf             = zeros(256, 1);                                    % Cumulative distribution function array
        outDomain       = zeros(256, 1);                                    % Output array/histogram which maps the cdf to intensity domain

        for i = 1:rows                                                      % Loop for constructing the arrays pdf, cdf and T
            for j = 1:columns
                k        = ag(i, j);
                T(k+1)   = T(k+1)+1;                                        % Construct the normal histogram of image a
                pdf(k+1) = T(k+1)/n;                                        % Construct the pdf of a
            end
        end

        for i = 1:256
            sum          = sum+T(i);
            cum(i)       = sum;                                             % Construct the cumulative array
            cdf(i)       = cum(i)/n;                                        % Construct the cumulative density function
            outDomain(i) = round(cdf(i)*intensity_max);                     % Map the cumulative density function to the new domain and round it off
        end

        for i = 1:rows
            for j = 1:columns
                bg(i, j) = outDomain(ag(i, j)+1);                               % Construct the output image b such that T(a)=b
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        ab              = img(:, :, 3); 									% Take green channel.
        sum             = 0;
        intensity_max   = 255;
        bb              = uint8(zeros(rows, columns));						% Construct a blank matrix
        n               = rows*columns;										% Total number of pixels
        T               = zeros(256, 1);                                    % Blank array/histogram for no. of pixels in intensity range
        pdf             = zeros(256, 1);                                    % Probability distribution function array
        cdf             = zeros(256, 1);                                    % Cumulative distribution function array
        outDomain       = zeros(256, 1);                                    % Output array/histogram which maps the cdf to intensity domain

        for i = 1:rows                                                      % Loop for constructing the arrays pdf, cdf and T
            for j = 1:columns
                k        = ab(i, j);
                T(k+1)   = T(k+1)+1;                                        % Construct the normal histogram of image a
                pdf(k+1) = T(k+1)/n;                                        % Construct the pdf of a
            end
        end

        for i = 1:256
            sum          = sum+T(i);
            cum(i)       = sum;                                             % Construct the cumulative array
            cdf(i)       = cum(i)/n;                                        % Construct the cumulative density function
            outDomain(i) = round(cdf(i)*intensity_max);                     % Map the cumulative density function to the new domain and round it off
        end

        for i = 1:rows
            for j = 1:columns
                bb(i, j) = outDomain(ab(i, j)+1);                           % Construct the output image b such that T(a)=b
            end
        end
        newimg = cat(3, br, bg, bb);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    elseif numberOfColorBands == 1
        ar                                  = img(:, :, 1);                 % Take red channel.
        [rows, columns, numberOfColorBands] = size(ar);
        sum                                 = 0;
        intensity_max                       = 255;
        br                                  = uint8(zeros(rows, columns));  % Construct a blank matrix
        n                                   = rows*columns;					% Total number of pixels
        T                                   = zeros(256, 1);				% Blank array/histogram for no. of pixels in intensity range
        pdf                                 = zeros(256, 1);				% Probability distribution function array
        cdf                                 = zeros(256, 1);				% Cumulative distribution function array
        outDomain                           = zeros(256, 1);                % Output array/histogram which maps the cdf to intensity domain

        %   figure('Name', 'Original Image');imshow(Image);
        %   figure('Name', 'Original Image histogram');imhist(Image);

        for i = 1:rows                                                      % Loop for constructing the arrays pdf, cdf and T
            for j = 1:columns
                k        = ar(i, j);
                T(k+1)   = T(k+1)+1;                                        % Construct the normal histogram of image a
                pdf(k+1) = T(k+1)/n;                                        % Construct the pdf of a
            end
        end

        for i = 1:256
            sum          = sum+T(i);
            cum(i)       = sum;                                             % Construct the cumulative array
            cdf(i)       = cum(i)/n;                                        % Construct the cumulative density function
            outDomain(i) = round(cdf(i)*intensity_max);                     % Map the cumulative density function to the new domain and round it off
        end

        for i = 1:rows
            for j = 1:columns
                br(i, j) = outDomain(ar(i, j)+1);                               % Construct the output image b such that T(a)=b
            end
        end
        newimg = br;
        % figure('Name', 'Final Image');imshow(newimg);
        % figure('Name', 'Final Image Histogram', yo);imhist(bb);
    end
end

