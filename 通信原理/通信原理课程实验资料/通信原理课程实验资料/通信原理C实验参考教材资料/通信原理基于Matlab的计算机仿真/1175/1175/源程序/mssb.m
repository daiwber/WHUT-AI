%显示模拟调制的波形及解调方法SSB
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

%SSB modulation
s_ssb = real( hilbert(mt).*exp(j*2*pi*fc*t) );
B=fm;
%noise = noise_nb(fc,B,N0,t);
%s_ssb=s_ssb+noise;
figure(1)
subplot(311)
plot(t,s_ssb);hold on;     %画出SSB信号波形
plot(t,mt,'r--');          %标示mt的波形
title('SSB调制信号');
xlabel('t');

%SSB demodulation
rt = s_ssb.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);

subplot(312)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('相干解调后的信号波形与输入信号的比较');
xlabel('t')
subplot(313)
[f,sf]=T2F(t,s_ssb);
psf = (abs(sf).^2)/T;
plot(f,psf);
axis([-2*fc 2*fc 0 max(psf)]);
title('SSB信号功率谱');
xlabel('f');
