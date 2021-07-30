<<<<<<< HEAD
# ERH-A-Comprehensive-Underwater-Visual-Reconstruction-Paradigm

------

## 1.  Introduction

This algorithm project is designed for the paper called "Enhancement-Registration-Homogenization (ERH) :A Comprehensive Underwater Visual Reconstruction Paradigm" by Laibin Chang, Huajun Song, and Peng Ren, etc. 

H. Song, L. Chang, Z. Chen and P. Ren, "Enhancement-Registration-Homogenization (ERH): A Comprehensive Underwater Visual Reconstruction Paradigm," in IEEE Transactions on Pattern Analysis and Machine Intelligence, doi: 10.1109/TPAMI.2021.3097804.

URL: [https://ieeexplore.ieee.org/document/9490352](https://ieeexplore.ieee.org/document/9490352)

This paper presents a comprehensive underwater visual reconstruction paradigm that comprises three procedures, i.e., the E-procedure, the R-procedure, and the H-procedure. The E-procedure *enhance*s original underwater images based on color compensation balance and weighted image fusion, yielding restored color, sharpened edges, and global contrast. The R-procedure *register*s multiple enhanced underwater images by exploiting global similarity and local deformation. The H-procedure *homogenize*s the registered underwater images by multi-scale composition strategy, which eliminates the inhomogeneous transition and brightness difference across overlapping regions, resulting in a reconstructed wide-field underwater image with comfortable and natural visibility. The three procedures operate in a cascade where the former procedure processes underwater images in a way that facilitates the latter one. We refer to the overall three procedures as the Enhancement-Registration-Homogenization (ERH) paradigm. Comprehensive qualitative and quantitative empirical evaluations reveal that our ERH paradigm outperforms state-of-the-art visual reconstruction methods, including the AutoStitch, APAP, SPHP, APNAP, and REW.

------

## 2. Required environment

Based on Windows 10, you should have a PC with MATLAB 2020a.

------

## 3. Running Steps

Open this project in MATLAB, and run the "main.m". Then you would get the enhanced results in "enhanced_images" and the reconstructed results in "reconstructed_images". The detailed implementation process is in this "main.m" file.

------

## 4. Test your own underwater images

Proceed as follows:

1. Put your images into the "original_input" and create a new folder named "*test-mydataset*" like the example.

2. Put two original images named "*image1*" and "*image2*" in the "*test-mydataset*" folder.

3. change the code in "main.m" according to your new folder.

   - ```
     I_num =2;  % Number of the input images.
     ```

   - ```
     path = strcat('ImagesData\original_input\test-mydataset\image',int2str(i),'.jpg');
     % please change the path according to your input images.
     ```

   - ```
     mkdir test-mydataset         %new folder
     ```

   - ```
     imwrite(I_E,strcat('test-mydataset/test-enhanced',int2str(i),'.png')) %the path of save should be changed.
     ```

   Importantly, you need to create a file for registration in the enhanced folder of "*test-mydataset*", and its name should be "test-mydataset-STITCH-GRAPH.txt". It is indispensable when completing the registration task. For the content, please refer to our example. Especially in the reconstruction of multiple images, if you have any questions, please contact us.

   - ```
     param1= 'test-mydataset'; %change the name.
     ```

4. run the "main.m"  and get the reconstructed images in "reconstructed_images".

   ------

   

## 5.Code references

Chen Y S , Chuang Y Y . Natural Image Stitching with the Global Similarity Prior[C]// European Conference on Computer Vision. Springer International Publishing, 2016.



If you encounter any difficulties or problems  in the implementation process, please contact us at changlb666@163.com.

=======
# ERH-A-Comprehensive-Underwater-Visual-Reconstruction-Paradigm

------

## 1.  Introduction

This algorithm project is designed for the paper called "Enhancement-Registration-Homogenization (ERH) :A Comprehensive Underwater Visual Reconstruction Paradigm" by Laibin Chang, Huajun Song, and Peng Ren, etc. 

H. Song, L. Chang, Z. Chen and P. Ren, "Enhancement-Registration-Homogenization (ERH): A Comprehensive Underwater Visual Reconstruction Paradigm," in IEEE Transactions on Pattern Analysis and Machine Intelligence, doi: 10.1109/TPAMI.2021.3097804.

URL: [https://ieeexplore.ieee.org/document/9490352](https://ieeexplore.ieee.org/document/9490352)

This paper presents a comprehensive underwater visual reconstruction paradigm that comprises three procedures, i.e., the E-procedure, the R-procedure, and the H-procedure. The E-procedure *enhance*s original underwater images based on color compensation balance and weighted image fusion, yielding restored color, sharpened edges, and global contrast. The R-procedure *register*s multiple enhanced underwater images by exploiting global similarity and local deformation. The H-procedure *homogenize*s the registered underwater images by multi-scale composition strategy, which eliminates the inhomogeneous transition and brightness difference across overlapping regions, resulting in a reconstructed wide-field underwater image with comfortable and natural visibility. The three procedures operate in a cascade where the former procedure processes underwater images in a way that facilitates the latter one. We refer to the overall three procedures as the Enhancement-Registration-Homogenization (ERH) paradigm. Comprehensive qualitative and quantitative empirical evaluations reveal that our ERH paradigm outperforms state-of-the-art visual reconstruction methods, including the AutoStitch, APAP, SPHP, APNAP, and REW.

------

## 2. Required environment

Based on Windows 10, you should have a PC with MATLAB 2020a.

------

## 3. Running Steps

Open this project in MATLAB, and run the "main.m". Then you would get the results. The detailed implementation process is in this file.

------

## 4. Test your own underwater images

Proceed as follows:

1. put your images into the "original_input", like the example.

2. change the code in "main.m" according to your new folder.

   - ![image-20210729222721042](C:\Users\16050\AppData\Roaming\Typora\typora-user-images\image-20210729222721042.png)# the number of the input images;

   - ![image-20210729222816204](C:\Users\16050\AppData\Roaming\Typora\typora-user-images\image-20210729222816204.png)#please change the path according to your input images

   - ![image-20210729223846614](C:\Users\16050\AppData\Roaming\Typora\typora-user-images\image-20210729223846614.png)#This path of save should be changed according to the name of the new folder. The enhanced images will appear in it.

     Importantly, in the You need to put a file for registration in this folder, and its name can refer to our example.

   - ![image-20210729223928957](C:\Users\16050\AppData\Roaming\Typora\typora-user-images\image-20210729223928957.png)The name should be the same as the new folder created earlier

3. run the "main.m"  and get the reconstructed images in "reconstructed_images"

   ------

   

## 5.Code references

Chen Y S , Chuang Y Y . Natural Image Stitching with the Global Similarity Prior[C]// European Conference on Computer Vision. Springer International Publishing, 2016.



If you encounter any difficulties or problems  in the implementation process, please contact us at changlb666@163.com.

>>>>>>> 5bff8037879a992d76ff5bd0dd7a4f1bafeffe00
