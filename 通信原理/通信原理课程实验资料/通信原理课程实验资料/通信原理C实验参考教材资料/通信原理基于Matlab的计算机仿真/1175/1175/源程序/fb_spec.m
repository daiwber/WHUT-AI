%方波的傅氏变换
clear all;
close all;
T=1;
N_sample = 128;
dt=1/N_sample;

t=0:dt:T-dt;
%st=[ones(1,N_sample/2),-ones(1,N_sample/2)];
st = sin(2*pi*10*t);

subplot(211);
plot(t,st,'LineWidth',2);
axis([0 1 -2 2]);
xlabel('t');
ylabel('s(t)');
subplot(212);
[f sf]=T2F(t,st);
plot(f,abs(sf),'LineWidth',2); 
hold on;
axis([-10 10 0 1]);
xlabel('f')
ylabel('|S(f)|');

%根据傅氏变换计算得到的信号频谱
sff= T^2*j*pi*f*0.5.*exp(-j*2*pi*f*T).*sinc(f*T*0.5).*sinc(f*T*0.5);
plot(f,abs(sff),'r-','LineWidth',2)







