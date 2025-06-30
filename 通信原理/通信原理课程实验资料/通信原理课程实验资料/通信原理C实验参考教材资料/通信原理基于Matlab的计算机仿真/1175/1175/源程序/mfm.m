%FM modulation and demodulation
clear all;
close all;

Kf = 5;
fc = 10;
T=5;
dt=0.001;
t = 0:dt:T;

%��Դ
fm= 1;
%mt = cos(2*pi*fm*t) + 1.5*sin(2*pi*0.3*fm*t);              %��Դ�ź�
mt = cos(2*pi*fm*t);              %��Դ�ź�
%FM ����
A = sqrt(2);
%mti = 1/2/pi/fm*sin(2*pi*fm*t) -3/4/pi/0.3/fm*cos(2*pi*0.3*fm*t);   %mt�Ļ��ֺ���
mti = 1/2/pi/fm*sin(2*pi*fm*t) ;   %mt�Ļ��ֺ���
st = A*cos(2*pi*fc*t + 2*pi*Kf*mti);
figure(1)
subplot(311);
plot(t,st); hold on;
plot(t,mt,'r--');
%xlabel('t');ylabel('��Ƶ�ź�')
xlabel('t');ylabel('FM modulated signal')

subplot(312)
[f sf] = T2F(t,st);
plot(f, abs(sf));
axis([-25 25 0 3])
%xlabel('f');ylabel('��Ƶ�źŷ�����')
xlabel('f');ylabel('Spectrum of the FM signal')

%FM ���
for k=1:length(st)-1
    rt(k) = (st(k+1)-st(k))/dt;
end
rt(length(st))=0;
subplot(313)
plot(t,rt); hold on;
plot(t,A*2*pi*Kf*mt+A*2*pi*fc,'r--');
%xlabel('t');ylabel('��Ƶ�ź�΢�ֺ����')
xlabel('t');ylabel('Signal envelope after differentiator')


