# Adaptive Median and Median Filtering
 
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
[**Code**]()

