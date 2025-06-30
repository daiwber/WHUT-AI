%周期信号（方波）的展开,fb_jinshi.m
close all;
clear all;
N=100;    %取展开式的项数为2N＋1项

T=1;
fs=1/T;
N_sample=128;
dt = T/N_sample;

t=0:dt:10*T-dt;

n=-N:N;
Fn = sinc(n/2).*exp(-j*n*pi/2);
Fn(N+1)=0;

ft = zeros(1,length(t));
for m=-N:N
    ft = ft + Fn(m+N+1)*exp(j*2*pi*m*fs*t);
end

plot(t,ft,'LineWidth',2)
axis([0,5,-1.5,1.5]);
xlabel('t'); ylabel('f(t)');
