%fft_example1
fs=128; %sample frequency
T=1/fs; %sample time
L=256;  %the length of singal;
t=(0:L-1)*T; %times
x=5+7*cos(2*pi*15*t-30*pi/180)+3*cos(2*pi*40*t-90*pi/180); %original singal;
y=x+randn(size(t)); %noise singal;
yy=randn(size(t));
figure; 
plot(t,y);
xlabel('time (s)')
ylabel('noise')
title('noise singal')
N=2*nextpow2(L); 
Y=fft(y,N)/N*2;
f=fs/N*(0:1:N-1);
A=abs(Y);
P=angle(Y);
figure;
subplot(211)
plot(f (1:N/2), A (1:N/2),'*');
title('test')
xlabel('Hz');
ylabel('fudu');
subplot(212)
plot(f (1:N/2),P(1:N/2));


