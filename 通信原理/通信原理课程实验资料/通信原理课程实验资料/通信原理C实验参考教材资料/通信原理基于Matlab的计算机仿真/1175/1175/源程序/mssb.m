%��ʾģ����ƵĲ��μ��������SSB
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

%SSB modulation
s_ssb = real( hilbert(mt).*exp(j*2*pi*fc*t) );
B=fm;
%noise = noise_nb(fc,B,N0,t);
%s_ssb=s_ssb+noise;
figure(1)
subplot(311)
plot(t,s_ssb);hold on;     %����SSB�źŲ���
plot(t,mt,'r--');          %��ʾmt�Ĳ���
title('SSB�����ź�');
xlabel('t');

%SSB demodulation
rt = s_ssb.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);

subplot(312)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('��ɽ������źŲ����������źŵıȽ�');
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_ssb);
psf = (abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('SSB�źŹ�����');
xlabel('f');
