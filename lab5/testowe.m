clc; clear;close all;
input=readDataFile('dane.txt');
sizeInput=size(input);
error=ones(1,sizeInput(1));
filename='matlabErr.txt';
for k=1:sizeInput(1)
    error(k) = functionZad5_7(input(k,:));
end
pythonErr = fopen('pythonErr.txt');
errPy = fgetl(pythonErr);
errPy1 = str2num(errPy);
x=1:10;
subplot(2,1,1)
plot(x,errPy1)
title('pajton')
subplot(2,1,2)
plot(x,error)