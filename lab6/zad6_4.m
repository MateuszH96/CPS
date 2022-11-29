clear all; close all;
fpr = 8000; % czestotliwosc probkowania (Hz)
T = 3; % czas trwania sygnalu w sekundach
N = round(T*fpr); % liczba probek, 100 albo 1000
dt=1/fpr; t=dt*(0:N-1); % os czasu
n = 1:1000; % indeksy probkek sygnalu dla rysunkow

x1=sin(2*pi*200*t) .* (0.01*randn(1,N));

Mwind = 256; Mstep=16; Mfft=2*Mwind; Many = floor((N-Mwind)/Mstep)+1;