clc; clear;close all;
input=readDataFile('dane.txt');
sizeInput=size(input);
error=ones(1,sizeInput(1));
for k=1:sizeInput(1)
    error(k) = functionZad5_7(input(k,:));
end
pythonErr = fopen('pythonErr.txt');
errPy = fgetl(pythonErr);
errPy1 = str2num(errPy)
x=1:10;
hold on
plot(x,error,'.-r')
plot(x,errPy1,'.-b')
legend('matlab','pajton')