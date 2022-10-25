clc; clear all; close all;
N=25;
for k=0:N-1
    A(k+1,1:N)=sqrt(2/N)*cos(pi/N*(k+1/2)*((0:N-1)+1/2));
end
hold on
for i=1:N
    plot(1:N,A(i,1:N),'-');
    %pause()
end
B=zeros(N);
for i = 1:N
    for k = 1:N
        B(i,k)=sum(A(i,:).*A(k,:));
    end
end
odw = inv(A);
tran= A';
przyp1 = odw * A;
przyp2 = tran * A;