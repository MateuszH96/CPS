% Koncepcja ortogonalnosci wektorow i macierzy
clear all; close all
N=4;
mul = 1/sqrt(N);
v1 = mul*[ -1 1 1 1 ]; % wektor nr 1
v2 = mul*[ 1 -1 1 1 ]; % wektor nr 2
v3 = mul*[ 1 1 -1 1 ]; % wektor nr 3
v4 = mul*[ 1 1 1 -1 ]; % wektor nr 4
prod1 = sum( v1 .* conj(v2) ) % kiedy suma iloczynow odpowiadajacych sobie
prod2 = dot( v1, v2 ) % elementow dwoch wektorow jest rowna 0,
prod3 = v1*v2' % to wektory te sa ortogonalne w przestrzeni euklidusowej
A = [v1;v2;v3;v4]; % diagonalna, ortogonalna macierz identycznoscio
B=zeros(N);
for i = 1:N
    for k = 1:N
        B(i,k)=sum(A(i,:).*A(k,:));
    end
end
prod4 = inv(A) * A; % wynik powinien dac macierz identycznosciowa
prod5 = A' * A; % inv(A)->A' dla macierzy ortogonalnych