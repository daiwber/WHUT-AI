%多径时变   djshb.m
clear all;
close all;
  f = 10;                 %输入的单频信号频率
  dt = 0.01;
  t = 0:dt:1000;            %时间
  L = 20;                  %径数
  taof = 0.1*rand(1,L);     %时延变化频率
  fai0 = rand(1,L)*2*pi;  %路径的初始相位
  st = cos(2*pi*f*t);
  
  for i=1:L
    fai(i,: ) = sin(2*pi*taof(i)*t);
    s(i, : ) = cos(2*pi*f*t + fai(i,: ) + fai0(i) );
  end
  rt = sum(s) /sqrt(L);   %将信号经过20径的结果相加
  figure(1)
  subplot(211)
  plot(t, st); xlabel('t'); ylabel('s(t)'); title('输入单频信号');
  %axis([0 10 -2.5 2.5]);
  subplot(212)
  plot(t,rt); xlabel('t'); ylabel('s(t)'); title('经过20径后接收信号');
  %axis([0 10 -2.5 2.5]);
  figure(2)
  
  [ff sf]=T2F(t,st);
  [ff rf]=T2F(t,rt); 
  subplot(211);
  plot(ff,abs( sf ) ); xlabel('f'); ylabel('s(f)');
  title('输入单频信号频谱');
  axis([-20 20 0 5]);
  subplot(212);
  plot(ff,abs( rf ) ); xlabel('f'); ylabel('r(f)'); 
  axis([-20 20 0 5]);title('多径信道输出信号频谱');
  