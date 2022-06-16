% A15
% Adaptive median filter

clc;
clear;
clf;

% import the image
I = imread('IMAGE.jpg');
figure(1)
subplot(221)
imshow(I);
title("Input image");

% convert to grayscale
I = rgb2gray(I);
subplot(222)
imshow(I)
title("Grayscale image");


% add salt and pepper noise
d = 0.9;
J = snp(I,d);
subplot(223)
imshow(J);
title("Image with salt and pepper noise");

% perform filtering
K = AdaptiveMedianfilter(J,9);
subplot(224)
imshow(K);
title("Filtered image by adaptive median filter");

