%fft_0]
N=8;
n=0:N-1;
xn=[4 3 2 6 7 8 9 0];
Xk=fft(xn);
data1=Xk(:,1)
data2=Xk(:,2)