%周期方波的傅立叶级数展开
close all;
clear all;

T=1;
N_sample=128;
dt=T/N_sample;

t=0:dt:T-dt;
y = [ones(1,N_sample/2) -ones(1,N_sample/2)];

ft = y;
ft = reshape(ft,1,N_sample);
subplot(211);
plot(t,ft);
axis([0 1 -2 2]);

df=1/T;
f=-df*(N_sample/2):df:df*(N_sample)/2-df;
subplot(212)
stem(f,abs( fftshift(fft(ft))) );