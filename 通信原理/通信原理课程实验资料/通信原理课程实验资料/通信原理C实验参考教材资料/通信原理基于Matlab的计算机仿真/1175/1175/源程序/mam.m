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
subplot(311)
plot(t,s_am);hold on;     %画出AM信号波形
plot(t,A+mt,'r--');       %标示AM的包络
title('AM调制信号及其包络');
xlabel('t');
%AM demodulation
rt = s_am.*cos(2*pi*fc*t);  %相干解调
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);    %低通滤波
subplot(312)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('相干解调后的信号波形与输入信号的比较');
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_am);
psf = (abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('AM信号功率谱');
xlabel('f');
