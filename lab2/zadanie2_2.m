% cps_02_sygnaly.m
clear; close all; clc;
len_letter = 3; len_break = 1; num_of_letter =3;
fs=8000; 
time=(num_of_letter*len_letter)+(num_of_letter-1*len_break);Nx=time*fs;df=200; % czestotliwosc probkowania, liczba probek
dt = 1/fs; % okres probkowania
t = dt*(0:Nx-1); % chwile pobierania probek
x1=sin(2*pi*2000*t); % sinus 10 Hz
x2=sin(2*pi*1000*t); % sinus 1 Hz
x3=exp(0.2*t); % eksponenta opadajaca w czasie
x4=exp(-300*(t-5.2).^2); % gaussoida
x5=sin(2*pi*(0*t+0.5*6000*t.^2)); % liniowy przyrost czest. (LFM): od 0 Hz, +20Hz/s
x6=sin(2*pi*(10*t-(900/(2*pi*1)*cos(2*pi*1*t)))); % sinus. FM: 9Hz wokol 10Hz 1x na sec
x7=sin(2*pi*(10*t+9000*cumsum(x2)*dt)); % to samo co x6; dlaczego?
%% rysowanie A
fPerSec = fs/len_letter;
fStart = fs/len_letter;
A_Legs = cos(2*pi*(fStart*t+0.5*fPerSec*t.^2));
A_Legs(1,1:Nx*(time-len_letter)/time) = 0; 

A_Gauss = exp(-10*(t-(time-len_letter/2)).^2);
A_Sin=sin(2*pi*(fs/4)*t);
A_Line=A_Sin.*A_Gauss;
A = A_Legs+A_Line; % wybor: x1,x2,...,x7, 0.23*x1 + x2, x1.*x3, ...

%% rysowanie N
fPerSec = fs*100;
N_Gauss1 = exp(-300*(t-(len_letter+len_break)).^2);
N_Gauss2 = exp(-300*(t-(len_letter*2+len_break)).^2);
N_Gauss = N_Gauss2 + N_Gauss1;
N_Background = cos(2*pi*(0*t+0.5*fPerSec*t.^2));
N_Leg1 = N_Background .* N_Gauss;

fPerSec = fs/len_letter/2;
fStart =fs/len_letter;
N_slash = cos(2*pi*(fStart*t+0.5*fPerSec*t.^2));
N_slash(1,1:fs*(time-2*len_letter-1)) = 0;
N_slash(1,fs*(time-len_letter-len_break):Nx) = 0;

N=N_Leg1+N_slash;

%% rysowanie S
S_Gauss = exp(-300*(t-(len_letter+len_break)).^2);
S_line1 = sin(2*pi*2000*t);
S_line1(1,1:fs*(len_letter/3)) =0;
S_line1(1,2/3*fs*len_letter:Nx) =0;
S_line2 = sin(2*pi*50*t);
S_line2(1,1:fs*(len_letter/3)) = 0;
S_line3 = sin(2*pi*3950*t);
S_line3(1,2*fs:Nx) = 0;
S_lines = S_line3 + S_line2 + S_line1;
S_lines(1,fs*len_letter:length(S_lines)) = 0;

S_V1_1 = sin(2*pi*(1000*t+0.5*1000*t.^2));
S_V1_2 = sin(2*pi*(1000*t+0.5*-1000*t.^2));
S_V1 = S_V1_1 + S_V1_2;
S_V1(1,fs:Nx) = 0;

S_V2_1 = sin(2*pi*(2000*t+0.5*1000*t.^2));
S_V2_2 = sin(2*pi*(0*t+0.5*-1000*t.^2));
S_V2 = S_V2_1 + S_V2_2;
S_V2(1,1:2*fs) = 0;
S_V2(1,3*fs:Nx) = 0;
S=S_lines+S_V1+S_V2 ;
%% Rysowanie napisu

x=(A)+N+S;
%x=flip(x);
plot(t,x,'.-'); grid; title('Sygnal x(t)'); xlabel('czas [s]'); ylabel('Amplituda');
spectrogram(x,256,256-64,512,fs);

%sound(x,fs);