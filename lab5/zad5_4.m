clc; clear;
p=3;
N=2^p;
x = 1:N;
x_fft=fft(x);
xm = myRecFFT(x);
xf = fft(x);
error = max(abs(xm-xf))