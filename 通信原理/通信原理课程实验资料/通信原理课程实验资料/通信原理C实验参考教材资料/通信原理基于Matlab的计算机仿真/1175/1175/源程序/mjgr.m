%ʾ��˫����NRZ�����źž������������ź���ɵ�������Ӱ�켰����ͼ,�ļ�mjgr.m
clear all;
close all;

N =1000;
N_sample=8;     %ÿ��Ԫ��������
Ts=1;
dt = Ts/N_sample;
t=0:dt:(N*N_sample-1)*dt;

gt = ones(1,N_sample);   %���ֻ�������
d = sign(randn(1,N));    %������������
a = sigexpand(d,N_sample); 
st = conv(a,gt);         %���ֻ����ź�

ht1 = 5*sinc(5*(t-5)/Ts);
rt1 = conv(st,ht1);

ht2 = sinc((t-5)/Ts);
rt2 = conv(st,ht2);

eyediagram(rt1+j*rt2,40,5);    %����Matlab����ͼ�ĺ�������40�㣬��ʾ5ֻ��
