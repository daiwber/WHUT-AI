%显示模拟调制的波形及解调方法AM
%信源
close all;
clear all;
dt = 0.001;          %时间采样间隔         
fm=1;                %信源最高频率
fc=10;               %载波中心频率
T=5;                 %信号时长
t = 0:dt:T; 
mt = sqrt(2)*cos(2*pi*fm*t);  %信源
%N0 = 0.01;            %白噪单边功率谱密度

%AM modulation
A=2;
s_am = (A+mt).*cos(2*pi*fc*t);
B = 2*fm;            %带通滤波器带宽
%noise = noise_nb(fc,B,N0,t);    %窄带高斯噪声产生
%s_am = s_am + noise;

figure(1)
subplot(321)
plot(t,A+mt,'r--');       %标示AM的包络
title('Input analog signal');
xlabel('t');
%AM demodulation
%rt = s_am.*cos(2*pi*fc*t);  %相干解调
%rt = rt-mean(rt);
%[f,rf] = T2F(t,rt);
%[t,rt] = lpf(f,rf,2*fm);    %低通滤波
subplot(322)
plot(t,s_am);hold on;        %画出AM信号波形
plot(t,A+mt,'r--');       %标示AM的包络
title('Modulated signal');
xlabel('t'); grid

subplot(323)
A = sqrt(2);
plot(t,A+mt,'r--');       %标示AM的包络
title('Input analog signal');
xlabel('t');
subplot(324)
s_am = (A+mt).*cos(2*pi*fc*t);
plot(t,s_am);hold on;        %画出AM信号波形
plot(t,A+mt,'r--');       %标示AM的包络
title('Modulated signal');
xlabel('t');
grid;

subplot(325)
A = 1;
plot(t,A+mt,'r--');       %标示AM的包络
title('Input analog signal');
xlabel('t');
subplot(326)
s_am = (A+mt).*cos(2*pi*fc*t);
plot(t,s_am);hold on;        %画出AM信号波形
plot(t,abs(A+mt),'r--');       %标示AM的包络
title('Modulated signal');
xlabel('t')
grid;

