%���ֻ����źŵĹ������ܶ�
clear all;
close all;
Ts=1;
N_sample = 8;              %ÿ����Ԫ�ĳ�������
dt = Ts/N_sample;          %����ʱ����
N = 1000;                  %��Ԫ��

t = 0:dt:(N*N_sample-1)*dt;
T = N*N_sample*dt;

gt1 = ones(1,N_sample);    %NRZ�ǹ��㲨��
gt2 = ones(1,N_sample/2);  %RZ���㲨��
gt2 = [gt2 zeros(1,N_sample/2)];

mt3 = sinc((t-5)/Ts);          % sin(pi*t/Ts)/(pi*t/Ts)���Σ��ض�ȡ10����Ԫ
gt3 = mt3(1:10*N_sample);


d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %�����м������N_sample-1��0

st1 = conv(data,gt1);
st2 = conv(data,gt2);
d   =  2*d-1;                 %���˫��������
data=  sigexpand(d,N_sample); 
st3 = conv(data,gt3);

[f,st1f] = T2F(t,[st1(1:length(t))]);
[f,st2f] = T2F(t,[st2(1:length(t))]);
[f,st3f] = T2F(t,[st3(1:length(t))]);

figure(1)
subplot(321)
plot(t,[st1(1:length(t))] );grid
axis([0 20 -1.5 1.5]);
ylabel('������NRZ����');
subplot(322);
plot(f,10*log10(abs(st1f).^2/T) );grid
axis([-5 5 -40 10]);
ylabel('������NRZ�������ܶ�(dB/Hz)');

subplot(323)
plot(t,[st2(1:length(t))] );
axis([0 20 -1.5 1.5]);grid
ylabel('������RZ����');
subplot(324)
plot(f,10*log10(abs(st2f).^2/T));
axis([-5 5 -40 10]);grid
ylabel('������RZ�������ܶ�(dB/Hz)');

subplot(325)
plot(t-5,[st3(1:length(t))] );
axis([0 20 -2 2]);grid
ylabel('˫����sinc����');xlabel('t/Ts');
subplot(326)
plot(f,10*log10(abs(st3f).^2/T));
axis([-5 5 -40 10]);grid
ylabel('sinc���ι������ܶ�(dB/Hz)');xlabel('f*Ts');
