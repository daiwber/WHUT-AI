%信道失真示意
clear all;close all;

Ts=1;
N_sample = 8;              %每个码元的抽样点数
dt = Ts/N_sample;          %抽样时间间隔
N = 1000;                  %码元数
t = 0:dt:(N*N_sample-1)*dt;

gt1 = ones(1,N_sample);    %NRZ非归零波形
gt2 = ones(1,N_sample/2);  %RZ归零波形
gt2 = [gt2 zeros(1,N_sample/2)];

mt3 = sinc((t-5)/Ts);          % sin(pi*t/Ts)/(pi*t/Ts)波形，截段取10个码元
gt3 = mt3(1:10*N_sample);


d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %对序列间隔插入N_sample-1个0

st1 = conv(data,gt1);
st2 = conv(data,gt2);
d   =  2*d-1;                 %变成双极性序列
data=  sigexpand(d,N_sample); 
st3 = conv(data,gt3);

xt = st1;
%无失真信道
[f,xf] = T2F(t,xt);
hf1 = exp(-j*pi*f);
yf1 = xf.*hf1;
[t1,yt1] = F2T(f,yf1);

%幅频失真信道
hf2 = sinc(f).*exp(-j*pi*f);
yf2 = xf.*hf2;
[t2,yt2] = F2T(f,yf2);
%相频失真、群时延无失真信道
%hf3 = exp(j*pi*f+j*0.1*pi);
f1 = find(f<0);

hf3 = exp( -j*pi*f+j*pi );
hf3(f1) = exp( -j*pi*f(f1)-j*pi );

yf3 = xf.*hf3;
[t3,yt3]=F2T(f,yf3);
%相频、群时延失真信道
hf4 = exp(-j*pi*f.*f-j*pi*f+j*pi);
yf4 = xf.*hf4;
[t4,yt4]=F2T(f,yf4);

figure(1)
subplot(221)
plotyy(f,abs(hf1),f,angle(hf1)/pi);ylabel('幅频、相频特性');
title('线性无失真信道');grid on;

subplot(222)
plot(t1,real(yt1) );title('经过信道后的输出信号');
axis([0,20,-1.2 1.2]);grid on;

subplot(223)
plotyy(f,abs(hf2),f,angle(hf2)/pi);ylabel('幅频、相频特性');
title('幅频失真信道');grid on; xlabel('f')

subplot(224)
plot(t2,real(yt2)); 
axis([0,20,-1.2 1.2]);grid on;xlabel('t');

figure(2)
subplot(221);
plotyy(f,abs(hf3),f,angle(hf3)/pi);ylabel('幅频、相频特性');
title('相频失真、群时延无失真信道');grid on;
subplot(222);
plot(t3,real(yt3));title('经过信道后的输出信号');
axis([0,20,-1.2 1.2]);grid on;

subplot(223)
plotyy(f,abs(hf4),f,angle(hf4)/pi);ylabel('幅频、相频特性');
title('相频失真、群时延失真信道');grid on;xlabel('f');
subplot(224);
plot(t4,real(yt4));
axis([0,20,-1.2 1.2]);grid on;xlabel('t');
