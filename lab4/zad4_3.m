% clc; clear all; close all;
% N=1000;
% fs=1000; dt=1/fs; T=N*dt; f0=1/T;
% t=dt*(0:N-1); 
% x5=1*cos(2*pi*(10*f0)*t);
% x=x5;
% plot(t,x,'o-')

clear all; close all
% Orthogonal matrix for DCT-IV orthogonal transform
N = 100; % wymiar macierzy kwadratowej, 25, 100
fs=1000; dt=1/fs; T=N*dt; f0=1/T;
t=dt*(0:N-1);
k = (0:N-1); n=(0:N-1); % wiersze=funkcje, kolumny=probki
A = (1/N)*exp(-1j*2*pi/N*k'*n); % macierz analizy
S=A'; % macierz analizy: transpozycja i sprzezenie S
x = 0.5*A(22,:)'; % + x2; % wybor x1, x2, x3, x4, x1+x2, x1+x3, x1+x4
%x=real(x);
%x=imag(x);
c=A*x;
cs = sqrt(1/N)*c;
fk = f0*(0:N-1);
figure; subplot(211); stem(fk,real(cs)); subplot(212); stem(fk,imag(cs));
figure; subplot(211); stem(fk,abs(cs)); subplot(212); stem(fk,angle(cs));