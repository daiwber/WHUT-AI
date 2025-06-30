%数字信号经过多径信道
clear all;close all;

Ts=8;
N_sample = 16;              %每个码元的抽样点数
dt = Ts/N_sample;          %抽样时间间隔
N = 1000;                  %码元数
t = 0:dt:(N*N_sample-1)*dt;
dLen = length(t);

gt1 = ones(1,N_sample);    %NRZ非归零波形

d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %对序列间隔插入N_sample-1个0
st1 = conv(data,gt1);
[f sf1] = T2F(t,st1(1:dLen));

%3径信道
m=[0.5 0.707 0.5];
tao =[ 0 1 2];
hf = m(1)*exp(-j*2*pi*f*tao(1)) +m(2)* exp(-j*2*pi*f*tao(2))+...
     m(3)* exp(-j*2*pi*f*tao(3));

%信号经过3径信道

%yt1 = m(1)*st1(1:dLen)+m(2)*[zeros(1,N_sample), st1(1:dLen-N_sample)]+...
%      m(3)*[zeros(1,2*N_sample), st1(1:dLen-2*N_sample)];
yt1 = m(1)*st1(1:dLen)+m(2)*[zeros(1,2), st1(1:dLen-2)]+...
      m(3)*[zeros(1,4), st1(1:dLen-4)];
[f yf1] = T2F(t,yt1);
  
figure(1)
subplot(221)
plot(t,st1(1:dLen),'LineWidth',2);
axis([20 150 0 1.2]);title('输入信号');
subplot(223)
plot(t,yt1,'LineWidth',2);
axis([20 150 0 2]);title('经过信道输出信号');xlabel('t');
subplot(222);
plot(f,abs(sf1),'LineWidth',2);
axis([-2 2 0 300]);title('输入信号幅度谱');
subplot(224);
plot(f,abs(yf1),'LineWidth',2);
axis([-2 2 0 300]);title('输出信号幅度谱');xlabel('f');
figure(2)
subplot(211)
plot(f,abs(hf),'LineWidth',2);
axis([-2 2 0 2]);title('信道幅频特性');xlabel('f');
subplot(212)
plot(f,angle(hf)/pi);title('信道相频特性');xlabel('f');
axis([-2 2 -1 1]);



