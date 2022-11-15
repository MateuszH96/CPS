function X = fft_or_ifft(x,type,lvl)
% Rekurencyjna funkcja algorytmu radix-2 DIT FFT
if nargin == 2
    lvl=0;
end
N = length(x);
if(N==2)
    X(1) = x(1) + x(2); % # 2-punktowe DFT
    X(2) = x(1) - x(2); % # na najnizszym poziomie
else
    X1 = fft_or_ifft(x(1:2:N),type,lvl+1); % samo-wywolanie dla probek parzystych
    X2 = fft_or_ifft(x(2:2:N),type, lvl+1); % samo-wywolanie dla probek nieparzystych
    if type == -1
        X = [ X1 X1 ] + exp(-j*2*pi/N*(0:N-1)).* [X2 X2]; % zlozenie widm
    else
        X = [ X1 X1 ] +  [X2 X2] ./ exp(-j*2*pi/N*(0:N-1));; % zlozenie widm
        if lvl==0
            X=X/N;
        end
    end
end

end