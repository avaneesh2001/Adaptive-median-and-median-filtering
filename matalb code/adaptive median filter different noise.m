% A15
% diffrent noise levels
clc;
clear;


% import the image
I = imread('IMAGE.jpg');

% convert to grayscale
I = rgb2gray(I);

% add salt and pepper noise

figure("Name","Image with salt and pepper noise");
subplot(231)
d = 0.02;
J = snp(I,d);
imshow(J);
title("d = 0.02");

subplot(232)
d = 0.04;
J1 = snp(I,d);
imshow(J1);
title("d = 0.04");

subplot(233)
d = 0.06;
J2 = snp(I,d);
imshow(J2);
title("d = 0.06");

subplot(234.5)
d = 0.2;
J3 = snp(I,d);
imshow(J3);
title("d = 0.2");

subplot(235.5)
d = 0.9;
J4 = snp(I,d);
imshow(J4);
title("d = 0.90");

% perform filtering
max =9;
figure("Name","Filtered  image");
subplot(231)
K = AdaptiveMedianfilter(J,max);
imshow(K);
title("d = 0.02");

subplot(232)
K1 = AdaptiveMedianfilter(J1,max);
imshow(K1);
title("d = 0.04");

subplot(233)
K2 = AdaptiveMedianfilter(J2,max);
imshow(K2);
title("d = 0.06");

subplot(234.5)
K3 = AdaptiveMedianfilter(J3,max);
imshow(K3);
title("d = 0.2");

subplot(235.5)
K4 = AdaptiveMedianfilter(J4,max);
imshow(K4);
title("d = 0.9");

