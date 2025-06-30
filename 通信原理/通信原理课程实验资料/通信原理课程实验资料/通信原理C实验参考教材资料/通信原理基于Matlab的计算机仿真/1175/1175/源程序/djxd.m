%�����źž����ྶ�ŵ�
clear all;close all;

Ts=8;
N_sample = 16;              %ÿ����Ԫ�ĳ�������
dt = Ts/N_sample;          %����ʱ����
N = 1000;                  %��Ԫ��
t = 0:dt:(N*N_sample-1)*dt;
dLen = length(t);

gt1 = ones(1,N_sample);    %NRZ�ǹ��㲨��

d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %�����м������N_sample-1��0
st1 = conv(data,gt1);
[f sf1] = T2F(t,st1(1:dLen));

%3���ŵ�
m=[0.5 0.707 0.5];
tao =[ 0 1 2];
hf = m(1)*exp(-j*2*pi*f*tao(1)) +m(2)* exp(-j*2*pi*f*tao(2))+...
     m(3)* exp(-j*2*pi*f*tao(3));

%�źž���3���ŵ�

%yt1 = m(1)*st1(1:dLen)+m(2)*[zeros(1,N_sample), st1(1:dLen-N_sample)]+...
%      m(3)*[zeros(1,2*N_sample), st1(1:dLen-2*N_sample)];
yt1 = m(1)*st1(1:dLen)+m(2)*[zeros(1,2), st1(1:dLen-2)]+...
      m(3)*[zeros(1,4), st1(1:dLen-4)];
[f yf1] = T2F(t,yt1);
  
figure(1)
subplot(221)
plot(t,st1(1:dLen),'LineWidth',2);
axis([20 150 0 1.2]);title('�����ź�');
subplot(223)
plot(t,yt1,'LineWidth',2);
axis([20 150 0 2]);title('�����ŵ�����ź�');xlabel('t');
subplot(222);
plot(f,abs(sf1),'LineWidth',2);
axis([-2 2 0 300]);title('�����źŷ�����');
subplot(224);
plot(f,abs(yf1),'LineWidth',2);
axis([-2 2 0 300]);title('����źŷ�����');xlabel('f');
figure(2)
subplot(211)
plot(f,abs(hf),'LineWidth',2);
axis([-2 2 0 2]);title('�ŵ���Ƶ����');xlabel('f');
subplot(212)
plot(f,angle(hf)/pi);title('�ŵ���Ƶ����');xlabel('f');
axis([-2 2 -1 1]);



