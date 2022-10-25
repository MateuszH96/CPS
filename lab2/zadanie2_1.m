% cps_02_sygnaly.m
clear all; close all; clc;
fs=16000; Nx=10*fs;df=200; % czestotliwosc probkowania, liczba probek
dt = 1/fs; % okres probkowania
t = dt*(0:Nx-1); % chwile pobierania probek
x1=sin(2*pi*2000*t); % sinus 10 Hz
x2=sin(2*pi*1000*t); % sinus 1 Hz
x3=exp(0.2*t); % eksponenta opadajaca w czasie
x4=exp(-10*(t-5.2).^2); % gaussoida
x5=sin(2*pi*(0*t+0.5*6000*t.^2)); % liniowy przyrost czest. (LFM): od 0 Hz, +20Hz/s
x6=sin(2*pi*(10*t-(900/(2*pi*1)*cos(2*pi*1*t)))); % sinus. FM: 9Hz wokol 10Hz 1x na sec
x7=sin(2*pi*(10*t+9000*cumsum(x2)*dt)); % to samo co x6; dlaczego?
%%rysowanie A
A_L = cos(2*pi*(0*t+0.5*100*t.^2));
A_P = cos(2*pi*(2000*t+0.5*(-100)*t.^2));
t2 = dt*(0:(Nx*0.01)-1);
A = A_P+A_L; % wybor: x1,x2,...,x7, 0.23*x1 + x2, x1.*x3, ...
xabc = x1.*x3;
%%rysowanie N
N_L = sin(2*pi*3000*t);
N_S = cos(2*pi*(5000*t+0.5*(-200)*t.^2));
N_P = sin(2*pi*5000*t);
N=N_L + N_P+ N_S;
%%rysowanie S
tmp = cos(2*pi*(6000*t+0.5*(500)*t.^2));
S=zeros(1,Nx);
S(1:4*fs) = tmp(1:4*fs);
S(4*fs:8*fs) = tmp(4*fs:8*fs);
S(8*fs:10*fs-1) = tmp(1:2*fs);
xp=x4.*x2;
x=A+xp+N+S;
plot(t,x,'.-'); grid; title('Sygnal x(t)'); xlabel('czas [s]'); ylabel('Amplituda');
spectrogram(x,256,256-64,512,fs);

%sound(x,fs);