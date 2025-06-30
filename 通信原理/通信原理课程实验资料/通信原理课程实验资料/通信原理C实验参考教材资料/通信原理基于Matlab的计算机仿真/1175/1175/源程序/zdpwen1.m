%����խ����˹����
clear all; close all;
N0=1;            %˫�߹������ܶ�
fc=10;           %����Ƶ��
B=1;             %����

dt=0.01;
T=100;
t=0:dt:T-dt;
%��������ΪN0*B�ĸ�˹������
P = N0*B;
st = sqrt(P)*randn(1,length(t));
%����������������խ����ͨϵͳ��
[f,sf] = T2F(t,st);                     %��˹�ź�Ƶ��
figure(1)
plot(f,abs(sf));                        %��˹�źŵķ�Ƶ����

[tt gt]=bpf(f,sf,fc-B/2,fc+B/2);            %��˹�źž�����ͨϵͳ

glt = hilbert(real(gt));                      %խ���źŵĽ����źţ�����hilbert�����õ������ź�
glt = glt.*exp(-j*2*pi*fc*tt);

[ff,glf]=T2F( tt, glt );
figure(2)
plot(ff,abs(glf));
xlabel('Ƶ��(Hz)'); ylabel('խ����˹���������ķ�Ƶ����')

figure(3)
subplot(411);
plot(tt,real(gt));
xlabel('Ƶ��(Hz)'); title('խ����˹��������')
subplot(412)
plot(tt,real(glt).*cos(2*pi*fc*tt)-imag(glt).*sin(2*pi*fc*tt))
xlabel('Ƶ��(Hz)'); title('�ɵ�Ч�����ع���խ����˹��������')
subplot(413)
plot(tt,real(glt));
xlabel('Ƶ��(Hz)'); title('խ����˹����������ͬ�����')
subplot(414)
plot(tt,imag(glt));
xlabel('Ƶ��(Hz)'); title('խ����˹������������������')

%��խ����˹�źŹ���;ע�����������Ĺ��ʽ��Ƶ���������̵Ĺ��ʣ���˿��ܳ���һЩƫ��
P_gt=sum(real(gt).^2)/T;
P_glt_real = sum(real(glt).^2)/T;
P_glt_imag = sum(imag(glt).^2)/T;

%��֤խ����˹���̵�ͬ�����������������������
a = real(glt)*(imag(glt))'/T;

