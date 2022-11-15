function X = myRecIFFT(x)
% Rekurencyjna funkcja algorytmu radix-2 DIT FFT
N = length(x);
if(N==2)
X(1) = x(1) + x(2); % # 2-punktowe DFT
X(2) = x(1) - x(2); % # na najnizszym poziomie
else
X1 = myRecIFFT(x(1:2:N)); % samo-wywolanie dla probek parzystych
X2 = myRecIFFT(x(2:2:N)); % samo-wywolanie dla probek nieparzystych
X = [ X1 X1 ] + [X2 X2] ./  exp(-j*2*pi/N*(0:N-1)); % zlozenie widm
end