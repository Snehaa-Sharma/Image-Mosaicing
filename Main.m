% main program for generating the mosaic image
clear;
close all;
clc;

% input your images here:
img1 = 'C:\Users\HP\Downloads\project1.png'; % building block
img2 = 'C:\Users\HP\Downloads\project 3.png'; % big image
% matrix that represents the image
small_img = imread(img1);
% if the image has 3 channels convert it to grayscale
if (size(small_img,3)==3)
    small_img = rgb2gray(small_img);
end
big_img = imread(img2);
if (size(big_img,3)==3)
    big_img = rgb2gray(big_img);
end

%output mosaic image and simple_mosaic that doesn't have the dynamics of the bigger image incorporated 
[M, simple_mosaic] = create_mosaic(small_img, big_img);
figure(3); 
imshow(simple_mosaic);
title('Simple Mosaic (Range 0 to 255)');

figure(4);
imshow(M);
title('Final Mosaic (Range 0 to 255)');

% scale : changing the intensity resolution of the image matrix from 8 bits to 1 bit
M = M - min(M(:)); % lowest value becomes 0

M = M./(max(M(:))); % highest value becomes 1

simple_mosaic = simple_mosaic - min(simple_mosaic(:));

simple_mosaic = simple_mosaic./(max(simple_mosaic(:)));


% show the images in different figures
figure(1); 
imshow(simple_mosaic);
title('Simple Mosaic (Range 0 to 1)');

figure(2);
imshow(M);
title('Final Mosaic (Range 0 to 1)');


