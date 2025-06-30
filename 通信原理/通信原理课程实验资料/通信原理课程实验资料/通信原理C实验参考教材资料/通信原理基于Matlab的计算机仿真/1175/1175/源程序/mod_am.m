%显示模拟调制的波形及解调方法AM、DSB、SSB
%信源
close all;
clear all;
dt = 0.001;
fm=1;
fc=10;
t = 0:dt:5;
mt = sqrt(2)*cos(2*pi*fm*t);
N0 = 0.1;

%AM modulation
A=2;
s_am = (A+mt).*cos(2*pi*fc*t);
B = 2*fm;
noise = noise_nb(fc,B,N0,t);
s_am = s_am + noise;

figure(1)
subplot(321)
plot(t,s_am);hold on;
plot(t,A+mt,'r--');
%AM demodulation
rt = s_am.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);
title('AM信号');xlabel('t');
subplot(322)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('AM解调信号');xlabel('t');

%DSB modulation
s_dsb = mt.*cos(2*pi*fc*t);
B=2*fm;
noise = noise_nb(fc,B,N0,t);
s_dsb=s_dsb+noise;

subplot(323)
plot(t,s_dsb);hold on;
plot(t,mt,'r--');
title('DSB信号');xlabel('t');
%DSB demodulation
rt = s_dsb.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);
subplot(324)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('DSB解调信号');xlabel('t');
%SSB modulation
s_ssb = real( hilbert(mt).*exp(j*2*pi*fc*t) );
B=fm;
noise = noise_nb(fc,B,N0,t);
s_ssb=s_ssb+noise;
subplot(325)
plot(t,s_ssb);
title('SSB信号');xlabel('t');
%SSB demodulation
rt = s_ssb.*cos(2*pi*fc*t);
rt = rt-mean(rt);
[f,rf] = T2F(t,rt);
[t,rt] = lpf(f,rf,2*fm);
subplot(326)
plot(t,rt); hold on;
plot(t,mt/2,'r--');
title('SSB解调信号');xlabel('t');
