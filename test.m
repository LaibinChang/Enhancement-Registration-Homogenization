close all;
clear all;
clc;
%path= '.\registration';
%oldFolder = cd(path);
%cd 
ExeFileName= 'ERH.exe';
ExeFilePath= fullfile(ExeFileName);
param1=[' ','test1'];
Cmd = [ExeFilePath,param1]
system(Cmd);
%cd(oldFolder)