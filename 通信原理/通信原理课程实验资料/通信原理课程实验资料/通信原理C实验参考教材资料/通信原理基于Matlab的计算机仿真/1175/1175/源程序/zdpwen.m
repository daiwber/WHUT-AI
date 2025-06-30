%����խ����˹����
clear all; close all;
N0=1;            %˫�߹������ܶ�
fc=10;           %����Ƶ��
B=1;             %����

dt=0.01;
T=100;
t=0:dt:T-dt;
%������˹�����������ڰ��������źŹ���Ϊ������������ֻ�ýϴ�Ľ���ֵ����
P = N0*100*B;
st = sqrt(P)*randn(1,length(t));
%����������������խ����ͨϵͳ��
[f,sf] = T2F(t,st);
figure(1)
plot(f,abs(sf));
hf = zeros(1,length(f));
df = f(2)-f(1);                      %Ƶ�������ļ��
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

