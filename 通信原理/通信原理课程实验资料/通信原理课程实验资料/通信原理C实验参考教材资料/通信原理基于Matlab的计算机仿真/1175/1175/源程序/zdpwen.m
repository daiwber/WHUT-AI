%例：窄带高斯过程
clear all; close all;
N0=1;            %双边功率谱密度
fc=10;           %中心频率
B=1;             %带宽

dt=0.01;
T=100;
t=0:dt:T-dt;
%产生高斯白噪声，由于白噪声的信号功率为无穷大，因此这里只用较大的近似值近似
P = N0*100*B;
st = sqrt(P)*randn(1,length(t));
%将上述白噪声经过窄带带通系统，
[f,sf] = T2F(t,st);
figure(1)
plot(f,abs(sf));
hf = zeros(1,length(f));
df = f(2)-f(1);                      %频域抽样点的间隔
bf = floor((fc-B/2)/df):floor((fc+B/2)/df);
bf1 = bf + floor(f(end)/df)+1;
bf2 = -bf+ floor(f(end)/df)+1;
hf(bf1)=1;
hf(bf2)=1;

hf = hf.*exp(-j*2*pi*f*15);          %

gf = hf.*sf;
[tt,gt]=F2T(f,gf);

glt = real(gt) + j*hilbert(real(gt));
glt = glt.*exp(-j*2*pi*fc*tt);

[ff glf]=T2F(tt,glt);
[t1,glt]=lpf(ff,glf,1);

[ff glf]=T2F(tt,glt);
figure(2)
plot(ff,abs(glf));

%[tt,ht]=F2T(f,hf);
figure(3)
subplot(411);
plot(tt,real(gt));
subplot(413)
plot(tt,real(glt));
subplot(414)
plot(tt,imag(glt));
subplot(412)
plot(tt,real(glt).*cos(2*pi*fc*tt)-imag(glt).*sin(2*pi*fc*tt))

