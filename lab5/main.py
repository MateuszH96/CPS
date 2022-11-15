import numpy as np
import math as m
from scipy.fft import fft
def zad5_7(input):
    signal = input # sygnał
    N = len(signal)  # liczba próbek
    Nbits = int(m.log2(N))  # liczba bitów
    x = [i for i in range(N)]  # indeksy
    formatString = '{:0'+str(Nbits)+'b}'  # string do formatu postaci bitowej

    xbin1 = [formatString.format(x) for x in range(N)] # postać bitowa na właściwej ilości bitów
    reverseStrBin = [i[::-1] for i in xbin1]  # odwracanie liczby bitowej

    newX = [int(i, 2) for i in reverseStrBin]  # zamiana na decymalną postać indeksów
    changedSignal = [signal[i] for i in newX]  # zmiana indeksów próbek sygnału

    y=np.dot(np.array([[1,1],[1,-1]]),np.array([[changedSignal[i] for i in range(0,N,2)],[changedSignal[i] for i in range(1,N,2)]]))
    shape = np.shape(y)
    y_vect = [y[j][i] for i in range(shape[1]) for j in range(shape[0])]

    Nx = N

    Nlevels = Nbits
    N = 2
    y_vect= [complex(i) for i in y_vect]
    for lvl in range(1, Nlevels):
        N *= 2
        Nblocks = int(Nx/N)
        W_kor = [np.exp(complex(0, -1)*2*m.pi/N*i) for i in range(N)]
        for k in range(Nblocks):
            tmp1 = [i for i in range(1 + (k)*N, (int(N/2) + (k)*N)+1)]
            tmp2 = [i for i in range(int(N/2)+1 + (k)*N, (N + (k)*N)+1)]
            tmp3 = [i for i in range(1 + (k)*N, (N + (k)*N)+1)]
            y1 = np.array([y_vect[i-1] for i in tmp1])
            y2 = np.array([y_vect[i-1] for i in tmp2])
            W=np.array(W_kor)
            result = (np.concatenate((y1,y1)))+(W*(np.concatenate((y2,y2))))
            for i in range(len(tmp3)):
                y_vect[tmp3[i]-1] = result[i];


    return max(abs(y_vect-fft(signal)))


def getDataFromFile(input):
    a=open(input,'r')
    line = a.readline()
    data=[]
    while line:
        tmp=line.split(',');
        data.append([int(i) for i in tmp])
        line=a.readline()
    return data

data = getDataFromFile('dane.txt')
error=[]
for i in data:
    error.append(zad5_7(i))

file=open('pythonErr.txt','w')
txt=str(error[0])
for i in range(1,len(error)):
    txt+=','+str(error[i])
file.write(txt)

