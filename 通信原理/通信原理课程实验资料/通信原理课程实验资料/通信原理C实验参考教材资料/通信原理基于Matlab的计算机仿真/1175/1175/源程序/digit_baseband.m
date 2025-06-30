%数字基带信号的功率谱密度
clear all;
close all;
Ts=1;
N_sample = 8;              %每个码元的抽样点数
dt = Ts/N_sample;          %抽样时间间隔
N = 1000;                  %码元数

t = 0:dt:(N*N_sample-1)*dt;
T = N*N_sample*dt;

gt1 = ones(1,N_sample);    %NRZ非归零波形
gt2 = ones(1,N_sample/2);  %RZ归零波形
gt2 = [gt2 zeros(1,N_sample/2)];

mt3 = sinc((t-5)/Ts);          % sin(pi*t/Ts)/(pi*t/Ts)波形，截段取10个码元
gt3 = mt3(1:10*N_sample);


d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %对序列间隔插入N_sample-1个0

st1 = conv(data,gt1);
st2 = conv(data,gt2);
d   =  2*d-1;                 %变成双极性序列
data=  sigexpand(d,N_sample); 
st3 = conv(data,gt3);

[f,st1f] = T2F(t,[st1(1:length(t))]);
[f,st2f] = T2F(t,[st2(1:length(t))]);
[f,st3f] = T2F(t,[st3(1:length(t))]);

figure(1)
subplot(321)
plot(t,[st1(1:length(t))] );grid
axis([0 20 -1.5 1.5]);
ylabel('单极性NRZ波形');
subplot(322);
plot(f,10*log10(abs(st1f).^2/T) );grid
axis([-5 5 -40 10]);
ylabel('单极性NRZ功率谱密度(dB/Hz)');

subplot(323)
plot(t,[st2(1:length(t))] );
axis([0 20 -1.5 1.5]);grid
ylabel('单极性RZ波形');
subplot(324)
plot(f,10*log10(abs(st2f).^2/T));
axis([-5 5 -40 10]);grid
ylabel('单极性RZ功率谱密度(dB/Hz)');

subplot(325)
plot(t-5,[st3(1:length(t))] );
axis([0 20 -2 2]);grid
ylabel('双极性sinc波形');xlabel('t/Ts');
subplot(326)
plot(f,10*log10(abs(st3f).^2/T));
axis([-5 5 -40 10]);grid
ylabel('sinc波形功率谱密度(dB/Hz)');xlabel('f*Ts');
