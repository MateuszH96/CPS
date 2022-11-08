function A = drawA(t,fs,len_letter)
fPerSec = fs/len_letter;    % określenie nachylenia
fStart = 0;              %określenie wartości początkowej częstotliwości
%% nóżki litery A
A_Legs = cos(2*pi*(fStart*t+0.5*fPerSec*t.^2)); 
%% kreska litery A


A_Sin=sin(2*pi*(fs/4)*t);
A_Sin(1,1:(1/4*len_letter*fs))=0;
A_Sin(1,(3/4*len_letter*fs):fs*len_letter)=0;
A_Line=A_Sin;
%% łączenie sygnałów i obcięcie niepotrzebnego czasu
A = A_Legs+A_Line;
A = A(1,1:fs*len_letter);
end