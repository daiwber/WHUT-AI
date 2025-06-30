%示意双极性NRZ基带信号经过带宽受限信号造成的码间干扰影响及其眼图,文件mjgr.m
clear all;
close all;

N =1000;
N_sample=8;     %每码元抽样点数
Ts=1;
dt = Ts/N_sample;
t=0:dt:(N*N_sample-1)*dt;

gt = ones(1,N_sample);   %数字基带波形
d = sign(randn(1,N));    %输入数字序列
a = sigexpand(d,N_sample); 
st = conv(a,gt);         %数字基带信号

ht1 = 5*sinc(5*(t-5)/Ts);
rt1 = conv(st,ht1);

ht2 = sinc((t-5)/Ts);
rt2 = conv(st,ht2);

eyediagram(rt1+j*rt2,40,5);    %调用Matlab画眼图的函数，行40点，表示5只眼
