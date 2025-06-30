%��ʾģ����ƵĲ��μ��������DSB
%��Դ
close all;
clear all;
dt = 0.001;          %ʱ��������         
fm=1;                %��Դ���Ƶ��
fc=10;               %�ز�����Ƶ��
T=5;                 %�ź�ʱ��
t = 0:dt:T; 
mt = sqrt(2)*cos(2*pi*fm*t);  %��Դ
%N0 = 0.01;            %���뵥�߹������ܶ�

%DSB modulation
s_dsb = mt.*cos(2*pi*fc*t);
B=2*fm;
%noise = noise_nb(fc,B,N0,t);
%s_dsb=s_dsb+noise;

figure(2)
subplot(211)
plot(t,mt);          %��ʾmt�Ĳ���
title('Input signal');
subplot(212)
plot(t,s_dsb);hold on;     %����DSB�źŲ���
plot(t,abs(mt),'r--');          %��ʾmt�Ĳ���
title('DSB modulated signal');

figure(1)
subplot(311)
plot(t,s_dsb);hold on;     %����DSB�źŲ���
plot(t,mt,'r--');          %��ʾmt�Ĳ���
%title('DSB�����ź�');
title('DSB modulated signal');
xlabel('t');
%DSB demodulation
rt = s_dsb.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);
subplot(312)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('��ɽ������źŲ����������źŵıȽ�');
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_dsb);
psf = (abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('DSB�źŹ�����');
xlabel('f');
