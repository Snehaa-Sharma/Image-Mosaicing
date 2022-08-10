function [ mosaic, simple_mosaic ] = create_mosaic( element_img, big_img )
% CREATE_MOSAIC generates a mosaic image which looks like the big_img made
% using the element_img
%
%	Function takes as input 2 images element_img and big_img. It
%	creates a new image that looks much like the big_img but
% 	when zoomed in you can tell it's made up from smaller element_img images.
%
%	element_img changes it's mean value such that the element_img on position (i,j)
% 	has the same mean value as the pixel (i,j) of the big_img, thus the mean
% 	value of the output image remains the same as the mean of the big_img image.
%
%				Input relatively small images so that the output image 
%				can fit on the screen without any scaling applied


N = size(element_img,1);
M = size(element_img,2);
H = size(big_img,1);
W = size(big_img,2);

% generates a simple mosaic whose dynamics are yet to be changed
simple_mosaic = create_image_matrix (element_img, [H W]);
mosaic = simple_mosaic;

for i = 1:1:H
    for j = 1:1:W
        
        % adjusts the mean of the element_img so that it's the same
		  % as big_img(i,j) and also the range is [0,255]	
        element = adjust_element_mean(element_img,big_img(i,j));
        mosaic (((i-1)*N)+1:i*N, ((j-1)*M)+1:j*M) = element;
        
    end
end

end 
