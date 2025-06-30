%低通抽样定理
clear all; close all;

dt = 0.01;
t = 0:dt:10;
xt = 0.1*cos(0.15*pi*t)+1.5*sin(2.5*pi*t)+0.5*cos(4*pi*t);
[f,xf] = T2F(t,xt);

%抽样信号，抽样速率为4Hz
fs = 4;
sdt = 1/fs;
t1  = 0:sdt:10;
st = 0.1*cos(0.15*pi*t1)+1.5*sin(2.5*pi*t1)+0.5*cos(4*pi*t1);
[f1,sf] = T2F(t1,st);

%恢复原始信号
t2 = -50:dt:50;
gt = sinc(fs*t2);
stt = sigexpand(st,sdt/dt);
xt_t = conv(stt,gt);

figure(1)
subplot(311);
plot(t,xt); title('原始信号');
subplot(312);
plot(t1,st);title('抽样信号');
subplot(313);
t3 = -50:dt:60+sdt-dt;
plot(t3,xt_t);title('抽样信号恢复');
axis([0 10 -4 4])