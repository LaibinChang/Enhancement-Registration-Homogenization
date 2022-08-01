%% Before running this Reconstruction_main.m, you should copy the enhanced results to the corresponding folder, which
%% are based on the number of your images.
%% Reconstration_with_two_images/three_images/four_images/five_images/six_images.
close all;
clear all;
clc;
%cd 
ExeFileName= 'ERH.exe';
ExeFilePath= fullfile(ExeFileName);
%name:你的文件夹名
param1=[' ','Reconstruction_with_two_images'];%Modify it according to your folder name.
Cmd = [ExeFilePath,param1]
system(Cmd);
