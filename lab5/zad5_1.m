%1.stworzenie macierzy analizy oraz testowanego sygnału
%2.podział macierzy analizy na próbki parzyste i nieparzyste oraz podział
%sygnału
%3.wyciągnięcie z 2 macierzy wektor korekcji
%4. wymnożenie podzielonych sygnałów i macierzy przez połowę tej macierzy

clc; clear;
N=8;
x = 1:N;
vect = exp(-1j * 2*pi/N*(0:N-1));
k = (0:N-1); n=(0:N-1);
A = exp(-1j*2*pi/N*k'*n);
xe = x(1:2:N);
xo = x(2:2:N);
Ae = A(1:N,1:2:N);
Ao = A(1:N,2:2:N) ./  vect.';
Xe = xe * Ae(1:N/2,:);
Xo = xo * Ao(1:N/2,:);
result = [Xe Xe] + vect.* [Xo Xo]