%方波的傅氏变换
clear all;
close all;
T=1;
N_sample = 128;
dt=1/N_sample;

t=0:dt:T-dt;
st=[ones(1,N_sample/2) -ones(1,N_sample/2)];

df=0.1/T;
Fx = 1/dt;
f=-Fx:df:Fx-df;
%根据傅氏变换计算得到的信号频谱
sff= T^2*j*pi*f*0.5.*exp(-j*2*pi*f*T).*sinc(f*T*0.5).*sinc(f*T*0.5);
sf_max = max(abs(sff));   %归一化

sff = sff/sf_max;
sf_max = max(abs(sff));

plot(f,abs(sff),'r-','LineWidth',4);
axis([-5 5 0 1]);
xlabel('f'); ylabel('信号频谱');
hold on;
line([f(1) f(end)],[sf_max sf_max],'LineWidth',4);
line([f(1) f(end)],[sf_max/sqrt(2) sf_max/sqrt(2)],'LineWidth',4);   %交点处为信号功率下降3dB处

Bw_eq = sum(abs(sff).^2)*df/T/sf_max.^2;        %信号的等效带宽
