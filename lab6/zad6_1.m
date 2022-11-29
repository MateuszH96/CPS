% cps_06_fftapp1_start.m
clear all; close all; % "mycie rak"
fpr = 1000; % czestotliwosc probkowania (Hz)
N = 100; % liczba probek sygnalu, 100 lub 1000
dt=1/fpr; t=dt*(0:N-1); % chwile probkowania sygnalu, os czasu
% Signal
f0=125; x = 10 * sin(2*10*f0*t); % sygnal o czestotliwosciach f0 = 50,100,125,200 Hz
figure; plot(t,x,'bo-'); xlabel('t [s]'); title('x(t)'); grid; pause
% FFT spectrum
X = fft(x); % FFT
f = fpr/N *(0:N-1); % os czestotliwosci
figure; plot(f,1/N*abs(X),'bo-'); xlabel('f [Hz]'); title('|X(k)|'); grid; pause

k = 1:N/2+1;
plot(f(k),2/N*abs(X(k)));


pause; close all;