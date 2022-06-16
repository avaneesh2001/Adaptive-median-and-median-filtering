% A15

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
d = 0.02;
J = snp(I,0.2);
subplot(223)
imshow(J);
title("Image with salt and pepper noise");

% perform filtering
K = Medianfilter(J);
subplot(224)
imshow(K);
title("Filtered image image");


% comparing with matlab functions
X = imnoise(I,"salt & pepper",0.2);
Y = medfilt2(X);

figure;
subplot(221)
imshow(X)
title("Matlab salt and pepper noise")

subplot(222)
imshow(Y)
title("Matlab median filter")

subplot(223)
imshow(J)
title("User defined salt and pepper noise")

subplot(224)
imshow(K)
title("User defined median filter")

