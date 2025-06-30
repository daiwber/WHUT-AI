%方波的傅氏变换
clear all;
close all;
T=1;
N_sample = 128;
dt=1/N_sample;

t=0:dt:T-dt;
st=[ones(1,N_sample/2) -ones(1,N_sample/2)];

df=0.1/T;
Fx = 10/dt;
f=-Fx:df:Fx-df;
%根据傅氏变换计算得到的信号频谱
sff= T^2*j*pi*f*0.5.*exp(-j*2*pi*f*T).*sinc(f*T*0.5).*sinc(f*T*0.5);
plot(f,abs(sff),'r-')
