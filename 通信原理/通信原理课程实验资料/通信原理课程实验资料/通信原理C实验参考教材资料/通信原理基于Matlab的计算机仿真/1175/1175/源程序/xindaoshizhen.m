%�ŵ�ʧ��ʾ��
clear all;close all;

Ts=1;
N_sample = 8;              %ÿ����Ԫ�ĳ�������
dt = Ts/N_sample;          %����ʱ����
N = 1000;                  %��Ԫ��
t = 0:dt:(N*N_sample-1)*dt;

gt1 = ones(1,N_sample);    %NRZ�ǹ��㲨��
gt2 = ones(1,N_sample/2);  %RZ���㲨��
gt2 = [gt2 zeros(1,N_sample/2)];

mt3 = sinc((t-5)/Ts);          % sin(pi*t/Ts)/(pi*t/Ts)���Σ��ض�ȡ10����Ԫ
gt3 = mt3(1:10*N_sample);


d = ( sign( randn(1,N) ) +1 )/2;
data = sigexpand(d,N_sample); %�����м������N_sample-1��0

st1 = conv(data,gt1);
st2 = conv(data,gt2);
d   =  2*d-1;                 %���˫��������
data=  sigexpand(d,N_sample); 
st3 = conv(data,gt3);

xt = st1;
%��ʧ���ŵ�
[f,xf] = T2F(t,xt);
hf1 = exp(-j*pi*f);
yf1 = xf.*hf1;
[t1,yt1] = F2T(f,yf1);

%��Ƶʧ���ŵ�
hf2 = sinc(f).*exp(-j*pi*f);
yf2 = xf.*hf2;
[t2,yt2] = F2T(f,yf2);
%��Ƶʧ�桢Ⱥʱ����ʧ���ŵ�
%hf3 = exp(j*pi*f+j*0.1*pi);
f1 = find(f<0);

hf3 = exp( -j*pi*f+j*pi );
hf3(f1) = exp( -j*pi*f(f1)-j*pi );

yf3 = xf.*hf3;
[t3,yt3]=F2T(f,yf3);
%��Ƶ��Ⱥʱ��ʧ���ŵ�
hf4 = exp(-j*pi*f.*f-j*pi*f+j*pi);
yf4 = xf.*hf4;
[t4,yt4]=F2T(f,yf4);

figure(1)
subplot(221)
plotyy(f,abs(hf1),f,angle(hf1)/pi);ylabel('��Ƶ����Ƶ����');
title('������ʧ���ŵ�');grid on;

subplot(222)
plot(t1,real(yt1) );title('�����ŵ��������ź�');
axis([0,20,-1.2 1.2]);grid on;

subplot(223)
plotyy(f,abs(hf2),f,angle(hf2)/pi);ylabel('��Ƶ����Ƶ����');
title('��Ƶʧ���ŵ�');grid on; xlabel('f')

subplot(224)
plot(t2,real(yt2)); 
axis([0,20,-1.2 1.2]);grid on;xlabel('t');

figure(2)
subplot(221);
plotyy(f,abs(hf3),f,angle(hf3)/pi);ylabel('��Ƶ����Ƶ����');
title('��Ƶʧ�桢Ⱥʱ����ʧ���ŵ�');grid on;
subplot(222);
plot(t3,real(yt3));title('�����ŵ��������ź�');
axis([0,20,-1.2 1.2]);grid on;

subplot(223)
plotyy(f,abs(hf4),f,angle(hf4)/pi);ylabel('��Ƶ����Ƶ����');
title('��Ƶʧ�桢Ⱥʱ��ʧ���ŵ�');grid on;xlabel('f');
subplot(224);
plot(t4,real(yt4));
axis([0,20,-1.2 1.2]);grid on;xlabel('t');
