%FM modulation and demodulation
clear all;
close all;

Kf = 5;
fc = 10;
T=5;
dt=0.001;
t = 0:dt:T;

%信源
fm= 1;
%mt = cos(2*pi*fm*t) + 1.5*sin(2*pi*0.3*fm*t);              %信源信号
mt = cos(2*pi*fm*t);              %信源信号
%FM 调制
A = sqrt(2);
%mti = 1/2/pi/fm*sin(2*pi*fm*t) -3/4/pi/0.3/fm*cos(2*pi*0.3*fm*t);   %mt的积分函数
mti = 1/2/pi/fm*sin(2*pi*fm*t) ;   %mt的积分函数
st = A*cos(2*pi*fc*t + 2*pi*Kf*mti);
figure(1)
subplot(311);
plot(t,st); hold on;
plot(t,mt,'r--');
%xlabel('t');ylabel('调频信号')
xlabel('t');ylabel('FM modulated signal')

subplot(312)
[f sf] = T2F(t,st);
plot(f, abs(sf));
axis([-25 25 0 3])
%xlabel('f');ylabel('调频信号幅度谱')
xlabel('f');ylabel('Spectrum of the FM signal')

%FM 解调
for k=1:length(st)-1
    rt(k) = (st(k+1)-st(k))/dt;
end
rt(length(st))=0;
subplot(313)
plot(t,rt); hold on;
plot(t,A*2*pi*Kf*mt+A*2*pi*fc,'r--');
%xlabel('t');ylabel('调频信号微分后包络')
xlabel('t');ylabel('Signal envelope after differentiator')


