%�ྶʱ��   djshb.m
clear all;
close all;
  f = 10;                 %����ĵ�Ƶ�ź�Ƶ��
  dt = 0.01;
  t = 0:dt:1000;            %ʱ��
  L = 20;                  %����
  taof = 0.1*rand(1,L);     %ʱ�ӱ仯Ƶ��
  fai0 = rand(1,L)*2*pi;  %·���ĳ�ʼ��λ
  st = cos(2*pi*f*t);
  
  for i=1:L
    fai(i,: ) = sin(2*pi*taof(i)*t);
    s(i, : ) = cos(2*pi*f*t + fai(i,: ) + fai0(i) );
  end
  rt = sum(s) /sqrt(L);   %���źž���20���Ľ�����
  figure(1)
  subplot(211)
  plot(t, st); xlabel('t'); ylabel('s(t)'); title('���뵥Ƶ�ź�');
  %axis([0 10 -2.5 2.5]);
  subplot(212)
  plot(t,rt); xlabel('t'); ylabel('s(t)'); title('����20��������ź�');
  %axis([0 10 -2.5 2.5]);
  figure(2)
  
  [ff sf]=T2F(t,st);
  [ff rf]=T2F(t,rt); 
  subplot(211);
  plot(ff,abs( sf ) ); xlabel('f'); ylabel('s(f)');
  title('���뵥Ƶ�ź�Ƶ��');
  axis([-20 20 0 5]);
  subplot(212);
  plot(ff,abs( rf ) ); xlabel('f'); ylabel('r(f)'); 
  axis([-20 20 0 5]);title('�ྶ�ŵ�����ź�Ƶ��');
  