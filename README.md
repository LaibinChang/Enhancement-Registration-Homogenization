# Enhancement-Registration-Homogenization (ERH): A Comprehensive Underwater Visual Reconstruction Paradigm

------

## 1.  Introduction

This algorithm project is designed for the paper called "Enhancement-Registration-Homogenization (ERH) :A Comprehensive Underwater Visual Reconstruction Paradigm" by Laibin Chang, Huajun Song, and Peng Ren, etc. 

**If the project is helpful to you, please cite our paper. Thanks!**.

H. Song, L. Chang, Z. Chen and P. Ren, "Enhancement-Registration-Homogenization (ERH): A Comprehensive Underwater Visual Reconstruction Paradigm," in IEEE Transactions on Pattern Analysis and Machine Intelligence, vol. 44, no. 10, pp. 6953-6967, 1 Oct. 2022, doi: 10.1109/TPAMI.2021.3097804.

URL: [https://ieeexplore.ieee.org/document/9490352](https://ieeexplore.ieee.org/document/9490352)

This paper presents a comprehensive underwater visual reconstruction paradigm that comprises three procedures, i.e., the E-procedure, the R-procedure, and the H-procedure. The E-procedure *enhance*s original underwater images based on color compensation balance and weighted image fusion, yielding restored color, sharpened edges, and global contrast. The R-procedure *register*s multiple enhanced underwater images by exploiting global similarity and local deformation. The H-procedure *homogenize*s the registered underwater images by multi-scale composition strategy, which eliminates the inhomogeneous transition and brightness difference across overlapping regions, resulting in a reconstructed wide-field underwater image with comfortable and natural visibility. The three procedures operate in a cascade where the former procedure processes underwater images in a way that facilitates the latter one. We refer to the overall three procedures as the Enhancement-Registration-Homogenization (ERH) paradigm. Comprehensive qualitative and quantitative empirical evaluations reveal that our ERH paradigm outperforms state-of-the-art visual reconstruction methods, including the AutoStitch, APAP, SPHP, APNAP, and REW.

------

## 2. Required environment

Based on Windows 10, you should have a PC with MATLAB 2020a.

------

## 3. Running Steps

Open this project in MATLAB, and run the "Enhancement_main.m". You would get the enhanced results in "enhanced_images"，Then you run the "Reconstruction_main.m",  the reconstructed results are shown in "reconstructed_images". 

------

## 4. Test your own underwater images

Proceed as follows:
1. Put your images into the "original_input" and create a new folder named "*test-mydataset*" like the example.

2. Put at least two original images named "*image1*" and "*image2*" in the "*test-mydataset*" folder.

3. Change the code in "Enhancement_main.m" according to your new folder.

    ```
    imgPath = '.\ImagesData\original_input\test-mydataset\'; % please change the path according to your input images.
    image_result_dir = '.\ImagesData\enhanced_images\test-mydataset\'; % the enhanced output results.
    ```
	After running this Enhancement_main.m, you would get the enhanced results in the corresponding folder.

 4. You should copy the enhanced results to the corresponding folder, which are based on the number of your images. These  corresponding folders include the "Rec_Two_images, Rec_Three_images, Rec_Four_images, Rec_Five_images,  Rec_Six_images.

 5. Change the code in "Reconstruction_main.m" according to your corresponding folders that you put into the enhanced image.

    ```
    param1=[' ','Rec_Two_images']; % Modify it based on the corresponding folder you select.
    ```

 6. Then run the "Reconstruction_main.m" to get the final reconstructed images, which are in the  "reconstructed_images" folder.

------

## 5. Result display

### The framework

![image-20210730111441224](https://raw.githubusercontent.com/LaibinChang/Enhancement-Registration-Homogenization-A-Comprehensive-Underwater-Visual-Reconstruction-Para/master/images/image-20210730111441224.png)

### Two- images input performance

![image-20210730111314648](https://raw.githubusercontent.com/LaibinChang/Enhancement-Registration-Homogenization-A-Comprehensive-Underwater-Visual-Reconstruction-Para/master/images/image-20210730111314648.png)

![image-20210730111213287](https://raw.githubusercontent.com/LaibinChang/Enhancement-Registration-Homogenization-A-Comprehensive-Underwater-Visual-Reconstruction-Para/master/images/image-20210730111213287.png)

### Multi-images input performance

![images\image-20210730111213287.png](https://raw.githubusercontent.com/LaibinChang/Enhancement-Registration-Homogenization-A-Comprehensive-Underwater-Visual-Reconstruction-Para/master/images/image-20210730110831984.png)

## 6. Code references

Chen Y S , Chuang Y Y . Natural Image Stitching with the Global Similarity Prior[C]// European Conference on Computer Vision. Springer International Publishing, 2016.


If you encounter any difficulties or problems  in the implementation process, please contact us at changlb666@163.com.

