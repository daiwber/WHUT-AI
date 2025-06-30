%例：窄带高斯过程
clear all; close all;
N0=1;            %双边功率谱密度
fc=10;           %中心频率
B=1;             %带宽

dt=0.01;
T=100;
t=0:dt:T-dt;
%产生功率为N0*B的高斯白噪声
P = N0*B;
st = sqrt(P)*randn(1,length(t));
%将上述白噪声经过窄带带通系统，
[f,sf] = T2F(t,st);                     %高斯信号频谱
figure(1)
plot(f,abs(sf));                        %高斯信号的幅频特性

[tt gt]=bpf(f,sf,fc-B/2,fc+B/2);            %高斯信号经过带通系统

glt = hilbert(real(gt));                      %窄带信号的解析信号，调用hilbert函数得到解析信号
glt = glt.*exp(-j*2*pi*fc*tt);

[ff,glf]=T2F( tt, glt );
figure(2)
plot(ff,abs(glf));
xlabel('频率(Hz)'); ylabel('窄带高斯过程样本的幅频特性')

figure(3)
subplot(411);
plot(tt,real(gt));
xlabel('频率(Hz)'); title('窄带高斯过程样本')
subplot(412)
plot(tt,real(glt).*cos(2*pi*fc*tt)-imag(glt).*sin(2*pi*fc*tt))
xlabel('频率(Hz)'); title('由等效基带重构的窄带高斯过程样本')
subplot(413)
plot(tt,real(glt));
xlabel('频率(Hz)'); title('窄带高斯过程样本的同相分量')
subplot(414)
plot(tt,imag(glt));
xlabel('频率(Hz)'); title('窄带高斯过程样本的正交分量')

%求窄带高斯信号功率;注：由于样本的功率近似等于随机过程的功率，因此可能出现一些偏差
P_gt=sum(real(gt).^2)/T;
P_glt_real = sum(real(glt).^2)/T;
P_glt_imag = sum(imag(glt).^2)/T;

%验证窄带高斯过程的同相分量、正交分量的正交性
a = real(glt)*(imag(glt))'/T;

