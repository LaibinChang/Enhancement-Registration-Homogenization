%%%%%%
% This algorithm project is designed for the paper called ¡°Enhancement-Registration-Homogenization (ERH) 
% A Comprehensive Underwater Visual Reconstruction Paradigm¡± by Laibin Chang, Huajun Song, and Peng Ren, etc. 
% The paper presents a comprehensive underwater visual reconstruction paradigm that comprises three procedures, i.e., the E-procedure, the R-procedure, and the H-procedure. 

close all;
clear all;
clc;
s=tic;
addpath('./COS_code');
%%%%%%%%%% underwater image enhancement %%%%%%%%%%
%% The First Step: Underwater Image Color Balance.
imgPath = '.\ImagesData\original_input\test1-coral\'; %%% please change the path according to your input images.
image_result_dir = '.\ImagesData\enhanced_images\test1-coral\'; %%% the enhanced output results.
imgDir = dir([imgPath '*.jpg']); %%% Find all files in 'jpg' format, if your format is 'png', please modify it.

for i = 1:length(imgDir)
    %%%read the images
    path = [imgPath imgDir(i).name];
    rgbImage=double(imread(path))/255;
    
    %%%%%%% The compensation of red channel attenuation
    Ir = rgbImage(:,:,1);
    Ig = rgbImage(:,:,2);
    Ib = rgbImage(:,:,3);
    %the average value of Ir, Ig and Ib within all pixels of the entireimage.
    Ir_mean = mean(Ir, 'all');
    Ig_mean = mean(Ig, 'all');
    Ib_mean = mean(Ib, 'all');
    

    alpha = 1;% controls the magnitude of compensation.
    Irc = Ir + alpha*(Ig_mean - Ir_mean).*(1-Ir).*Ig;
    %Irc = Ir + alpha*(Ig_mean - Ir_mean);
    % figure('name', 'Color compensation');
    % imshow(Irc)
    
%%%%%%% White balance
    Icomp = cat(3, Irc, Ig, Ib);  %Icomp denote the color balanced image.
    I_lin = rgb2lin(Icomp);
    percentiles = 5;
    illuminant = illumgray(I_lin,percentiles);
    I_lin = chromadapt(I_lin,illuminant,'ColorSpace','linear-rgb');
    Icb = lin2rgb(I_lin);
    % figure('name', 'Underwater White Balance1');
    % imshow(Iwb)
%% The Second Step: Weighted Image Fusion

%%%%%%% The gamma correction
    Igamma = imadjust(Icb,[],[],2);
    % figure('name', 'Gamma Correction');
    % imshow(Igamma)

%%%%%%% The edge sharping
    sigma = 20;
    Igauss = Icb;
    N = 30;
for iter=1: N
    Igauss =  imgaussfilt(Igauss,sigma);
    Igauss = min(Icb, Igauss);
end
    gain = 1; 
    Norm = (Icb-gain*Igauss);
for n = 1:3
    Norm(:,:,n) = histeq(Norm(:,:,n));
end
    Isharp = (Icb + Norm)/2;
    % figure('name', 'image sharpening');
    % imshow(Isharp)
    
%%%%%%% Caluate the three weight maps
    Igamma_lab = rgb2lab(Igamma);
    R1 = double(Igamma_lab(:, :, 1)) / 255;
    Isharp_lab = rgb2lab(Isharp);
    R2 = double(Isharp_lab(:, :, 1)) / 255;
    % for the first input image
    
    % calculate laplacian contrast weight
    WC1 = sqrt((((Igamma(:,:,1)) - (R1)).^2 + ...
            ((Igamma(:,:,2)) - (R1)).^2 + ...
            ((Igamma(:,:,3)) - (R1)).^2) / 3);
    % calculate the saliency weight
    WS1 = saliency_detection(Igamma);
    WS1 = WS1/max(WS1,[],'all');
    % calculate the saturation weight
    WSAT1 = sqrt(1/3*((Igamma(:,:,1)-R2).^2+(Igamma(:,:,2)-R2).^2+(Igamma(:,:,3)-R2).^2));
 
	% for the second input image
    % calculate laplacian contrast weight
    WC2 = sqrt((((Isharp(:,:,1)) - (R2)).^2 + ...
            ((Isharp(:,:,2)) - (R2)).^2 + ...
            ((Isharp(:,:,3)) - (R2)).^2) / 3);
    % calculate the saliency weight
    WS2 = saliency_detection(Isharp);
    WS2 = WS2/max(WS2,[],'all');
    % calculate the saturation weight
    WSAT2 = sqrt(1/3*((Isharp(:,:,1)-R2).^2+(Isharp(:,:,2)-R2).^2+(Isharp(:,:,3)-R2).^2));
    
    % figure('name', 'Image 1 weights');
    % imshow([WC1 , WS1, WSAT1]);
    % figure('name', 'Image 1 weights WC1');
    % imshow(WC1);
    % figure('name', 'Image 1 weights WS1');
    % imshow(WS1);
    % figure('name', 'Image 1 weights WSAT1');
    % imshow(WSAT1);
    % figure('name', 'Image 2 weights');
    % imshow([WC2 , WS2, WSAT2]);
    % figure('name', 'Image 2 weights WC2');
    % imshow(WC2 );
    % figure('name', 'Image 2 weights WS2');
    % imshow(WS2);
    % figure('name', 'Image 2 weights WSAT2');
    % imshow(WSAT2);

    % calculate the normalized weight
    W1 = (WC1 + WS1 + WSAT1+0.1) ./ ...
        (WC2 + WS2 + WSAT2 + WC1 + WS1 + WSAT1+0.2); % the first
    W2 = (WC2 + WS2 + WSAT2+0.1) ./ ...
        (WC2 + WS2 + WSAT2 + WC1 + WS1 + WSAT1+0.2); % the second
    % figure('name', 'Image 1 weights W1');
    % imshow(W1);
    % figure('name', 'Image 2 weights W2');
    % imshow(W2);

    % Multi scale fusion.
     img1 = Igamma;
     img2 = Isharp;

    % calculate the gaussian pyramid
    level = 10; %the number of level
    Weight1 = gaussian_pyramid(W1, level);
    Weight2 = gaussian_pyramid(W2, level);

    % calculate the laplacian pyramid
    R1 = laplacian_pyramid(Igamma(:, :, 1), level);
    G1 = laplacian_pyramid(Igamma(:, :, 2), level);
    B1 = laplacian_pyramid(Igamma(:, :, 3), level);
    
    R2 = laplacian_pyramid(Isharp(:, :, 1), level);
    G2 = laplacian_pyramid(Isharp(:, :, 2), level);
    B2 = laplacian_pyramid(Isharp(:, :, 3), level);

    % Multi-sacale Fusion
for k = 1 : level
   Rr{k} = Weight1{k} .* R1{k} + Weight2{k} .* R2{k};
   Rg{k} = Weight1{k} .* G1{k} + Weight2{k} .* G2{k};
   Rb{k} = Weight1{k} .* B1{k} + Weight2{k} .* B2{k};
end
    % the enhanced images
    R = pyramid_reconstruct(Rr);
    G = pyramid_reconstruct(Rg);
    B = pyramid_reconstruct(Rb);
    I_E = cat(3, R, G, B);
    figure('name', 'Multi scale fusion');
    imshow(I_E);
    %Since the underwater environment is changeable and complex, the enhancement performance is
    %better after the image is histogram stretched. According to your task, you can try it.
%     I_E = im2uint8(I_E);
%     I_E = stretching(I_E);
%     I_E = LABStretching(I_E);
%     imshow(I_E);
    img_name = imgDir(i).name
    image_dir = strcat(image_result_dir,img_name);
    %imwrite(Ilabs,strcat('test4-people/test4-enhanced',int2str(i),'.png')) %the path of save should be changed.
    imwrite(I_E,image_dir) %the path of save should be changed.
end
toc(s);
%% after running this Enhancement_main.m, you would get the enhanced results in the corresponding folder.