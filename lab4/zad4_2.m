% cps03_trans.m
clear all; close all
% Orthogonal matrix for DCT-IV orthogonal transform
N = 100; % wymiar macierzy kwadratowej, 25, 100

k = (0:N-1); n=(0:N-1); % wiersze=funkcje, kolumny=probki
A = sqrt(1/N)*exp(-1j*2*pi/N*k'*n); % macierz analizy
S=A'; % macierz analizy: transpozycja i sprzezenie S

x1 = 10*S(:,5); % sygnal #1
x2 = 20*S(:,10); % sygnal #2
x3 = 30*sqrt(2/N)*cos(pi/N*(n' +1/2)*(10.333333+1/2) ); % sygnal #3
x4 = 30*sqrt(2/N)*cos(pi/N*(n'+N/4+1/2)*(10 +1/2) ); % sygnal #4
x5 = randn(1,N); % sygnal #5
x = A(22,:)'; % + x2; % wybor x1, x2, x3, x4, x1+x2, x1+x3, x1+x4
%x=real(x);
%x=imag(x);
c=A*x;
stem(c)

%symetryczność bo cosinusa rokłąda się na sume exp^+j() + exp^-j() i całość
%dzielone przez 2 cos(2pi*100/fpr*n) = (e^+j() + e^-j())/2


% Z rysunku widać, że widmo sygnału jest symetryczne  względem połowy 
% częstotliwości próbkowania. Faktycznie, z teorii wiemy, że dla rzeczywistych 
% sygnałów dyskretnych x(n), wartości DFT dla częstotliwości m>(N/2), 
% są „nadmiarowe”, gdyż prążek dla m-tej częstotliwości będzie miał taką samą 
% wartość jak dla częstotliwości (N-m). Innymi słowy, jeżeli dla sygnału x(n) 
% wyznaczymy N punktową DFT, to otrzymamy N prążków reprezentujących występujące 
% w sygnale częstotliwości, ale tylko pierwsze N/2 jest niezależnych. 
% Dlatego licząc i rysując widmo sygnału, np. za pomocą algorytmu FFT w MATLABie, 
% robimy to dla pierwszych N/2 wartości częstotliwości, czyli 0<= m <= (N/2)-1. 
% Wartości widma powyżej N/2 nie wnoszą żadnej dodatkowej informacji, a są jedynie 
% „odbiciem” prążków w paśmie podstawowym. 

