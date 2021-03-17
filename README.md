# Computer Vision and Image Processing Package - MNIST case
This is a compilation of codes for computer vision with Keras CNN and image processing with ImageMagick. This repository includes the MNIST model version and an empty one for your own images.
# Contents
## MNIST codes
```mnist_prepare.R``` is for preparing the MNIST dataset from the Keras package.<br />
```mnist_rgb.R``` is for assigning random colors to each figure and its background, as well as combining the RGB channels into one JPEG image.<br />
```mnist_disrupt.R``` is for randomly change the color of the pixel by a small extent, and randomly add some noise points. Adjust the numbers according to personal need.<br />
```keras_cnn_mnist.R``` is for Keras Sequential Model of CNN, as well as the instruction to start training and evaluating, for the case of MNIST. Adjust the numbers according to personal need. 

## ImageMagick
```imagemagick.R``` is for processing the images, potentially increases the accuracy for image classification, with example of MNIST. Choose the functions based on personal need.

##Your own images
```your_images.R``` is for compiling your images into one place and let the computer read and edit your images.
