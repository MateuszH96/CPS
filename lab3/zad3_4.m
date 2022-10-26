clc;clear;close all;
N=25;

k=(0:N-1); n=0:N-1;
%A=sqrt(2/(N+1))*sin(pi*(k'+1)*(n+1)/(N+1)); % DST
A=sqrt(1/N)*( cos(2*pi/N*k'*n) + sin(2*pi/N*k'*n) ); % Hartley
hold on
for i=1:N
    plot(1:N,A(i,1:N),'-');
    pause()
end
B=zeros(N);
for i = 1:N
    for j = 1:N
        B(i,j)=sum(A(i,:).*A(j,:));
    end
end
odw = inv(A);
tran= A';
przyp1 = odw * A;
przyp2 = tran * A;