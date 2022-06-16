# Adaptive Median and Median Filtering

## Table of Contents
1. [Noise](#noise)\
    1.1. [Image Noise](#image-noise)\
    1.2. [Salt & pepper noise](#salt--pepper-noise)
2. [Median filtering](#median-filtering)\
    2.1. [Algorithm](#algorithm)
3. [Adaptive Median Filtering](#adaptive-median-filtering)
4. [Code](#code)
5. [Sample outputs](#sample-outputs)\
    5.1. [Input](#input)\
    5.2. [Median Filtering](#median-filtering-1)\
    5.3. [Adaptive Median Filtering](#adaptive-median-filtering-1)
6. [Drawbacks](#drawbacks)


## Noise
### Image Noise
Image noise is random variation of brightness or color information in  images, and is usually an aspect of electronic noise.. It is an undesirable by-product of image capture that obscures the desired information.
### Salt & pepper noise
Salt & pepper noise is an impulse type of noise in images. We consider saltand-pepper noise, for which a certain amount of the pixels in the image are either black or white. Normally if there is black dots in the image we called it pepper noise and if there is white dots in the image we called it salt noise. This noise is generally caused by errors in data transmission, failure in memory cell or analog-to-digital converter errors.\
If we consider 8-bit image, salt and pepper noise randomly occur certain amount of pixels into two extremes, either 0 or 255.The noise significantly damages the image information which leads to difficulties in succeeding image processing tasks such as edge detection or image segmentation and image recognition tasks.

##  Median filtering
Median filter is the most commonly used filter. It is a non linear method of  filtering. The size of the kernel can be of nxn size which is made to convolve or slide over a mxm corrupted image. While performing this operation the median value of nxn kernel on the image is obtained and then the value of a particular pixel is replaced with the median value of the nxn kernel.\
The median m of a set of values is such that half of the values are greater than m and half are less than m

### Algorithm
1. Zero pad the input gray-scale of size (mxn) to form a matrix of size (m+2)x(n+2)

2. Form a window matrix of size 3x3 with the elements of input matrix

3. Copy the window matrix(3x3) into an array and sort it.

4. Find the median element and replace that value in the middle of the window matrix in the zero-padded image.

5. Shift the window and repeat the entire process to cover the entire pixels in the image.
---
## Adaptive Median Filtering
Adaptive Median Filter is a variation of median filter that can better handle noise found in salt-and-pepper images if the probability of noise is less than 20%. This works by preserving detail of the image while smoothing the nonimpulse noise.\
The working of adaptive filter is a two step process; in the first step its finds the median value for the kernel and in the second step it checks whether the current pixel value is a impulse (salt and pepper noise) or not. If pixel value is corrupted then it changes it value with median or else it retains the value of the gray scale pixel.\
Another key feature about the median filter is that the size of the kernel grows during iteration of the image, which can provide for more accurate denoising based on certain conditions listed below.\
\
**Level A**: if $Z_{min} < Z_{med} < Z_{max}$ , go to *Level B* .\
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Else,increase the size of $S_{xy}$\
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; f $S_{xy} <= S_{max}$, repeat *Level A*\
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  Else, output $Z_{med}$\
**Level B**: if $Z_{min} < Z_{xy} < Z_{max}$ , output $Z_{xy}$\
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Else, output $Z_{med}$\
$Z_{min}$ = Minimum gray level value in $S_{xy}$\
$Z_{max}$ = Maximum gray level value in $S_{xy}$\
$Z_{med}$ = Median of gray levels in $S_{xy}$\
$Z_{xy}$ = gray level at coordinates (x, y)\
$S_{max}$ = Maximum allowed size of $S_{xy}$\

---
## Code
The code is available in "matlab code" folder\
[**Code**](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/tree/main/matalb%20code)

---

## Sample outputs
### Input
![input image](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/IMAGE.jpg)
<p align = "center">The input image</p>

### Median Filtering

![Median filtering](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/median_filter_output.jpg)
<p align = "center">Greayscale image with noise and median filtered output</p>

![Median filtering with diffrent noise](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/median_filter_noise_vary.jpg)
<p align = "center">Median filtering with various noise levels</p>

![function vs inbuilt](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/defined_vs_inbuilt.jpg)
<p align = "center">Defined Medianfilter function vs inbuilt function</p>

### Adaptive Median Filtering
![Adaptive Median filtering](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/adaptive_filter_output.jpg)
<p align = "center">Greayscale image with noise and adaptive median filtered output</p>

![Adaptive Median filtering with diffrent noise](https://github.com/avaneesh2001/Adaptive-median-and-median-filterin/blob/main/images/adaptive_filter_noise_vary.jpg)
<p align = "center">Adaptive median filtering with various noise levels</p>

## A few Notes
1. For low noise levels both median and adaptive median filters works efficiently, but as noise levels increases the adaptive filter does a better job in denoising than median filter.

2. The signal to noise ratio of the output from median filter is less than that from adaptive median filter.

## Drawbacks
1. Effective only when the noise is impulse noise (salt and pepper).
2. The median filter's output quality deteriorates when the noise is more than 20%.
3. For large kernel size, there is no proper smoothening of the image instead valuable information from the image gets blured.