clear all; clc; close all;
N=8;
mul = 1/sqrt(8);
v1 = mul*[-1 1 1 1 1 1 1 1]; % wektor nr 1
v2 = mul*[1 -1 1 1 1 1 1 1]; % wektor nr 2
v3 = mul*[1 1 -1 1 1 1 1 1]; % wektor nr 3
v4 = mul*[1 1 1 -1 1 1 1 1]; % wektor nr 4
v5 = mul*[1 1 1 1 -1 1 1 1]; % wektor nr 1
v6 = mul*[1 1 1 1 1 -1 1 1]; % wektor nr 2
v7 = mul*[1 1 1 1 1 1 -1 1]; % wektor nr 3
v8 = mul*[1 1 1 1 1 1 1 -1]; % wektor nr 4
A = [v1;v2;v3;v4;v5;v6;v7;v8];
B=zeros(N);
for i = 1:N
    for k = 1:N
        B(i,k)=sum(A(i,:).*A(k,:));
    end
end
prod2 = dot( v1, v2 )
prod4 = inv(A) * A;
prod5 = A' * A;
