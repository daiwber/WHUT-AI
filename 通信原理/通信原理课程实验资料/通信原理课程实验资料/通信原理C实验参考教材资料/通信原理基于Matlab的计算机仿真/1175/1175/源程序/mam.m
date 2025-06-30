%��ʾģ����ƵĲ��μ��������AM
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

%AM modulation
A=2;
s_am = (A+mt).*cos(2*pi*fc*t);
B = 2*fm;            %��ͨ�˲�������
%noise = noise_nb(fc,B,N0,t);    %խ����˹��������
%s_am = s_am + noise;

figure(1)
subplot(311)
plot(t,s_am);hold on;     %����AM�źŲ���
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('AM�����źż������');
xlabel('t');
%AM demodulation
rt = s_am.*cos(2*pi*fc*t);  %��ɽ��
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);    %��ͨ�˲�
subplot(312)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('��ɽ������źŲ����������źŵıȽ�');
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_am);
psf = (abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('AM�źŹ�����');
xlabel('f');
