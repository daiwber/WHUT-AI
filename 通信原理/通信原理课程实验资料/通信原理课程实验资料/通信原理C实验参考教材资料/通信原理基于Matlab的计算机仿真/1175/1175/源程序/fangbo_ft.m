%周期方波的傅立叶级数展开
close all;
clear all;

T=1;
N_sample=128;
dt=T/N_sample;
N=2;

t=0:dt:N*T-dt;
%d=sign(randn(1,N));
d = [+1 -1];
x=ones(N_sample,N);
y=diag(d);

ft = x*y;
ft = reshape(ft,1,N*N_sample);
subplot(211);
plot(t,ft);
axis([0 100 -2 2]);

df=1/(N*T);
f=-df*(N*N_sample/2)+df:df:df*(N*N_sample)/2;
subplot(212)
plot(f,abs( fftshift(fft(ft))) );