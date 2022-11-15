clc; clear;
p=10;
N=2^p;
x=rand(1,N);
X=myRecFFT(x);
xr=myRecIFFT(X)/N;

error1 = max(abs(x-xr)) %błąd pojedyńczych funkcji
xr=ifft(fft(x));
error2 = max(abs(x-xr)) %błąd wbudowanych funkcji
Y=fft_or_ifft(x,-1);
Yr=fft_or_ifft(Y,1);
error3 = max(abs(Yr-x)) %błąd uniwersalnej funkcji