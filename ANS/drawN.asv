function N = drawN(t,fs,len_letter)
fPerSec = fs*50;       %częstotliwość którą będziemy używać do rysowania tła dla nóżek N
%% sygnał do rysowania nóżek
N_Gauss1 = exp(-300*(t-0.1).^2);
N_Gauss2 = exp(-300*(t-(len_letter-0.1)).^2);
N_Gauss = N_Gauss2 + N_Gauss1;
N_Background = cos(2*pi*(0*t+0.5*fPerSec*t.^2));
N_Legs = N_Background .* N_Gauss;
%% sygnał do rysowania skośnej kreski
fPerSec = fs/len_letter/2; %określenie nachylenia lini rysującej 
fStart =0;
N_slash = cos(2*pi*(fStart*t+0.5*fPerSec*t.^2));
%% łaczenie sygnałów
N=N_Legs+N_slash;
end