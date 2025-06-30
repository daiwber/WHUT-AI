%�����ĸ��ϱ任
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
%���ݸ��ϱ任����õ����ź�Ƶ��
sff= T^2*j*pi*f*0.5.*exp(-j*2*pi*f*T).*sinc(f*T*0.5).*sinc(f*T*0.5);
sf_max = max(abs(sff));   %��һ��

sff = sff/sf_max;
sf_max = max(abs(sff));

plot(f,abs(sff),'r-','LineWidth',4);
axis([-5 5 0 1]);
xlabel('f'); ylabel('�ź�Ƶ��');
hold on;
line([f(1) f(end)],[sf_max sf_max],'LineWidth',4);
line([f(1) f(end)],[sf_max/sqrt(2) sf_max/sqrt(2)],'LineWidth',4);   %���㴦Ϊ�źŹ����½�3dB��

Bw_eq = sum(abs(sff).^2)*df/T/sf_max.^2;        %�źŵĵ�Ч����
