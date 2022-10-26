function ANS = drawANS()
%% deklaracja zmiennych
fs = 8000; %czestotliwość probkowani
len_letter = 3; len_break =0.2; %szerokość litery, szerokość przerwy
Nx = len_letter*fs; %liczba próbek dla jednej litery
dt = 1/fs; % okres probkowania
t = dt*(0:Nx-1); % chwile pobierania probek
time_break=zeros(1,len_break*fs); %wektor przerwymiędzy literami

%% tworzenie i łączenie sygnałów
A=drawA(t,fs,len_letter);
N=drawN(t,fs,len_letter);
S=drawS(t,fs,len_letter);
ANS =[A time_break N time_break S];
%% wyświetlanie i odsłuchanie sygnału
spectrogram(ANS,256,256-64,512,fs);
if(fs>=8000)
    %sound(ANS,fs)
end
end