%方波的频谱（直接画）
close all;
clear all;

T=1;
N=128;
df=1/T/N;

f = -100*N/2*df:df:100*N/2*df-df;
sf= T^2*j*pi*f*0.5.*exp(-j*2*pi*f*T).*sinc(f*T*0.5).*sinc(f*T*0.5);

plot(f,abs(sf))
