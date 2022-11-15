clc; clear all; close all;
N = 100; x = rand(1,N);
Xm = fft(x);
Xe = fft(x(1:2:N));
Xo = fft(x(2:2:N));
X = [ Xe, Xe ] + exp(-j*2*pi/N*(0:1:N-1)) .* [Xo, Xo ];
error = max( abs( X - Xm ) ),

N=8;
x = rand(1,N);
x_fft = fft(x);
k = (0:N-1); n=(0:N-1);
A = exp(-1j*2*pi/N*k'*n);
xe = x(1:2:N);
xo = x(2:2:N);
Ae = A(1:N,1:2:N);
Ao = A(1:N,2:2:N);
Xe = Ae * xe.';
Xo = Ao * xo.';
X=Xe+Xo;
error1 = max(abs(X.'-x_fft))