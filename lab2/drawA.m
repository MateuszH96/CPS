function A = drawA(t,fs,len_letter)
fPerSec = fs/len_letter;    % określenie nachylenia
fStart = fs/2;              %określenie wartości początkowej częstotliwości
%% nóżki litery A
A_Legs = cos(2*pi*(fStart*t+0.5*fPerSec*t.^2)); 
%% kreska litery A
A_Gauss = exp(-10*(t-(len_letter/2)).^2);
A_Sin=sin(2*pi*(fs/4)*t);
A_Line=A_Sin.*A_Gauss;
%% łączenie sygnałów i obcięcie niepotrzebnego czasu
A = A_Legs+A_Line;
A = A(1,1:fs*len_letter);
end