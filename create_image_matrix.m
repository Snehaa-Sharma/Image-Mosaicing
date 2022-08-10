function [ mosaic ] = create_image_matrix( element_img, matrix_size )
% CREATE_IMAGE_MATRIX generates a simple (double) mosaic image
%
%	Function takes a building block image (element_img) and a matrix_size 
% 	variable which dictates the height and the width of the output image.
%	Output image is a simple mosaic whose dynamics does not get changed, it's 
%	simply a matrix of smaller building block images.
%
% Input:
%               matrix_size - [H, W] 
%				H - height of the output mosaic image
%				W - width of the output mosaic image
%
%               element_img - 2D, grayscale image


N = size(element_img,1);
M = size(element_img,2);
H = matrix_size(1);
W = matrix_size(2);

% preallocate space for the output image
mosaic = zeros(N*H, M*W);
% matrix which stores a single row of building block images
row_tmp = zeros(N,M*W);

	for j = 1:1:W
	   row_tmp(: , (j-1)*M+1 : j*M) = element_img;
	end

	for i = 1:1:H
		mosaic((i-1)*N+1:i*N,:) = row_tmp;
	end

end 

