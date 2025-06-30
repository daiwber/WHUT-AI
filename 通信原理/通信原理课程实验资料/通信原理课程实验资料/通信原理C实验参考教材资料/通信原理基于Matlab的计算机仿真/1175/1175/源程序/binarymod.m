%2ASK,2PSK
clear all;
close all;

A=1;
fc = 2;    %2Hz;
N_sample = 8; 
N = 500;    %��Ԫ��
Ts = 1;     %1 baud/s

dt = Ts/fc/N_sample;  %���β������
t = 0:dt:N*Ts-dt;
T = dt*length(t);
Lt = length(t);

%������������Դ
d = sign(randn(1,N));
dd = sigexpand((d+1)/2,fc*N_sample);
gt = ones(1,fc*N_sample); %NRZ����

figure(1)
subplot(221); %����NRZ�źŲ���(�����ԣ�
d_NRZ = conv(dd,gt);
plot(t,d_NRZ(1:length(t))); 
axis([0 10 0 1.2]); ylabel('�����ź�');

subplot(222); %����NRZƵ��
[f,d_NRZf]=T2F( t,d_NRZ(1:length(t)) );
plot(f,10*log10(abs(d_NRZf).^2/T));
axis([-2 2 -50 10]);ylabel('�����źŹ������ܶ�(dB/Hz)');

%2ASK�ź�
ht = A*cos(2*pi*fc*t);
s_2ask = d_NRZ(1:Lt).*ht;

subplot(223)
plot(t,s_2ask);
axis([0 10 -1.2 1.2]); ylabel('2ASK');

[f,s_2askf]=T2F(t,s_2ask );
subplot(224)
plot(f,10*log10(abs(s_2askf).^2/T));
axis([-fc-4 fc+4 -50 10]);ylabel('2ASK�������ܶ�(dB/Hz)');

figure(2)
%2PSK�ź�
d_2psk = 2*d_NRZ-1;
s_2psk = d_2psk(1:Lt).*ht;
subplot(221)
plot(t,s_2psk);
axis([0 10 -1.2 1.2]); ylabel('2PSK');

subplot(222)
[f,s_2pskf] = T2F(t,s_2psk);
plot( f,10*log10(abs(s_2pskf).^2/T) );
axis([-fc-4 fc+4 -50 10]);ylabel('2PSK�������ܶ�(dB/Hz)');

% 2FSK
% s_2fsk = Acos(2*pi*fc*t + int(2*d_NRZ-1) );
 sd_2fsk = 2*d_NRZ-1;

s_2fsk = A*cos(2*pi*fc*t + 2*pi*sd_2fsk(1:length(t)).*t );
subplot(223)
plot(t,s_2fsk);
axis([0 10 -1.2 1.2]);xlabel('t'); ylabel('2FSK')
subplot(224)
[f,s_2fskf] = T2F(t,s_2fsk);
plot(f,10*log10(abs(s_2fskf).^2/T));
axis([-fc-4 fc+4 -50 10]);xlabel('f');ylabel('2FSK�������ܶ�(dB/Hz)');

%�����λ2FSK
fai = 2*pi*rand(1,N);
fai_2fsk = sigexpand(fai,fc*N_sample);
fai_2fsk = conv(fai_2fsk,gt);
s_2fskd = A*cos(2*pi*fc*t + 2*pi*sd_2fsk(1:length(t)).*t + fai_2fsk(1:length(t)) );
figure(3)
subplot(211);
plot(t,s_2fskd);
axis([0 10 -1.2 1.2]);
[f,s_2fskdf] = T2F(t,s_2fskd);
subplot(212);
plot(f,10*log10(abs(s_2fskdf).^2/T));
axis([-fc-4 fc+4 -50 10]);
