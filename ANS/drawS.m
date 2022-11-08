function S = drawS(t,fs,len_letter)

offset = 0.0063 * fs;% odległość od częstotliwści 0 i fs
%% poziome sygnały litery S
S_line1 = sin(2*pi*(fs/4)*t);
S_line1(1,1:floor(fs*(len_letter/3))) =0;
S_line1(1,floor(2/3*fs*len_letter):len_letter*fs) =0;

S_line2 = sin(2*pi*offset*t);
S_line2(1,floor(fs*(len_letter*2/3)):fs*len_letter) = 0;

S_line3 = sin(2*pi*(fs/2 - offset)*t);
S_line3(1,1:floor(fs*1/3*len_letter)) = 0;
S_lines = S_line3 + S_line2 + S_line1;
%S_lines = S_lines(1:len_letter*fs);
%% ukośne sygnały litery S
S_V1_1 = sin(2*pi*(fs/8*3*t+0.5*(fs/(4*len_letter/1.5))*t.^2));
S_V1_2 = sin(2*pi*(fs/8*3*t+0.5*-(fs/(4*len_letter/1.5))*t.^2));
S_V1 = S_V1_1 + S_V1_2;
S_V1(1,floor(1/3*len_letter*fs):fs*len_letter) = 0;

S_V2_1 = sin(2*pi*((fs/2)*t+0.5*(fs/(4*len_letter/1.5))*t.^2));
S_V2_2 = sin(2*pi*(fs/4*t+0.5*-(fs/(4*len_letter/1.5))*t.^2));
S_V2 = S_V2_1 + S_V2_2;
S_V2(1,1:floor(2/3*fs*len_letter))= 0;
%% łączenie Sygnałów
S=S_lines+S_V1+S_V2 ;
end