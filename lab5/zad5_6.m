clc; clear;

p=3;
N=2^p;
Nbits=p;
index=0:N-1;
bitsArr = dec2bin(index);
bitsArr = bitsArr(:,Nbits:-1:1);
newIndex = bin2dec(bitsArr).';
index,newIndex