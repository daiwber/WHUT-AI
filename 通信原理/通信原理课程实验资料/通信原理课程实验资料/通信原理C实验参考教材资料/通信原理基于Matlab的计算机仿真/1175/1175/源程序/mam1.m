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
subplot(321)
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('Input analog signal');
xlabel('t');
%AM demodulation
%rt = s_am.*cos(2*pi*fc*t);  %��ɽ��
%rt = rt-mean(rt);
%[f,rf] = T2F(t,rt);
%[t,rt] = lpf(f,rf,2*fm);    %��ͨ�˲�
subplot(322)
plot(t,s_am);hold on;        %����AM�źŲ���
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('Modulated signal');
xlabel('t'); grid

subplot(323)
A = sqrt(2);
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('Input analog signal');
xlabel('t');
subplot(324)
s_am = (A+mt).*cos(2*pi*fc*t);
plot(t,s_am);hold on;        %����AM�źŲ���
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('Modulated signal');
xlabel('t');
grid;

subplot(325)
A = 1;
plot(t,A+mt,'r--');       %��ʾAM�İ���
title('Input analog signal');
xlabel('t');
subplot(326)
s_am = (A+mt).*cos(2*pi*fc*t);
plot(t,s_am);hold on;        %����AM�źŲ���
plot(t,abs(A+mt),'r--');       %��ʾAM�İ���
title('Modulated signal');
xlabel('t')
grid;

