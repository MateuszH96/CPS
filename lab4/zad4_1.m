% cps03_trans.m
clear all; close all
% Orthogonal matrix for DCT-IV orthogonal transform
N = 100; % wymiar macierzy kwadratowej, 25, 100
k = (0:N-1); n=(0:N-1); % wiersze=funkcje, kolumny=probki
A = sqrt(1/N)*exp(-1j*2*pi/N*k'*n); % macierz analizy
B= A(1:10,:);
mesh(abs(A*A'));
pause

for x = 1:10
    subplot(2,1,1)
    plot(k, real(B(x,:)))
    subplot(2,1,2)
    plot(k, imag(B(x,:)))
    
    pause(3)
    close all
end

% for x = 2:50
%     subplot(2,2,1)
%     plot(k, real(A(x,:)))
%     title(sprintf("Real %d",x))
%     subplot(2,2,2)
%     plot(k, imag(A(x,:)))
%     title(sprintf("Imag %d",x))
%     end_value = N+2-x;
%     subplot(2,2,3)
%     plot(k, real(A(end_value,:)))
%     title(sprintf("Real %d",end_value))
%     subplot(2,2,4)
%     plot(k, imag(A(end_value,:)))
%     title(sprintf("Imag %d",end_value))
%     
%     pause(3)
%     close all
% end