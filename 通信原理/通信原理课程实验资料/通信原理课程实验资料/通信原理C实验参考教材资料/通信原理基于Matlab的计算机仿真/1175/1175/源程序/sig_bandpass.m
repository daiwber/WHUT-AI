%��ͨ�źž�����ͨϵͳ�ĵ�Ч������ʾ
clear all;
close all;
dt = 0.01;
t = 0:dt:5;

s1 = exp(-t).*cos(20*pi*t);          %�����ź�
[f1 s1f]= T2F(t,s1);                 %�����źŵ�Ƶ��
s1_lowpass = hilbert(s1).*exp(-j*2*pi*10*t);   %�����źŵĵ�Ч�����ź�
[f2 s2f]=T2F(t,s1_lowpass);          %�����Ч�����źŵ�Ƶ��

h2f = zeros(1,length(s2f));
[a b]=find( abs(s1f)==max(abs(s1f)) ); %�ҵ���ͨ�źŵ�����Ƶ��
h2f( 201-25:201+25 )= 1;
h2f( 301-25:301+25) = 1;
h2f = h2f.*exp(-j*2*pi*f2);           %����������λ��

[t1 h1] = F2T(f2,h2f);                %��ͨϵͳ�ĳ弤��Ӧ
h1_lowpass = hilbert(h1).*exp(-j*2*pi*10*t1); %��Ч����ϵͳ�ĳ弤��Ӧ

figure(1)
subplot(211);
plot(t1,h1,'Linewidth',2);
subplot(212);
yt = sin(30*pi*(t1+eps))./(pi*(eps+t1)) - sin(10*pi*(t1+eps))./(pi*(t1+eps)); %���ݻ��ֵõ��Ĵ�ͨϵͳ�弤��Ӧ
plot(t1, yt,'Linewidth',2)

figure(2)
subplot(221);
plot(t,s1,'Linewidth',2);
xlabel('t'); ylabel('s1(t)'); title('��ͨ�ź�');
subplot(223);
plot(f1,abs(s1f),'Linewidth',2);
xlabel('f'); ylabel('|S1(f)|'); title('��ͨ�źŷ�����');
subplot(222)
plot(t,real(s1_lowpass),'Linewidth',2);
xlabel('t');ylabel('Re[s_l(t)]');title('��Ч�����źŵ�ʵ��');
subplot(224)
plot(f2,abs(s2f),'Linewidth',2);
xlabel('f');ylabel('|S_l(f)|');title('��Ч�����źŵķ�����');
%����ͨϵͳ�����Ч������ͼ
figure(3)
subplot(221)
plot(f2,abs(h2f),'Linewidth',2);
xlabel('f');ylabel('|H(f)|');title('��ͨϵͳ�Ĵ�����Ӧ������');
axis([-50 50 0 1.5]);
subplot(223)
plot(t1,h1,'Linewidth',2);
xlabel('t');ylabel('h(t)');title('��ͨϵͳ�ĳ弤��Ӧ');

subplot(222)
[f3 hlf]=T2F(t1,h1_lowpass);
plot(f3,abs(hlf),'Linewidth',2);
xlabel('f');ylabel('|H_l(f)|');title('��ͨϵͳ�ĵ�Ч����������');

subplot(224)
plot(t1,h1_lowpass,'Linewidth',2);
xlabel('t');ylabel('h_l(t)');title('��ͨϵͳ�ĵ�Ч�����弤��Ӧ');

%������ͨ�źž�����ͨϵͳ����Ӧ �� ��Ч�����źž�����Ч����ϵͳ����Ӧ
tt = 0:dt:t1(end)+t(end);
yt = conv(s1,h1);

figure(4)
subplot(121)
plot(tt,yt,'Linewidth',2);
xlabel('t');ylabel('y(t)');title('��ͨ�ź����ͨϵͳ��Ӧ�ľ��')

ytl = conv(s1_lowpass,h1_lowpass).*exp(j*2*pi*10*tt);
subplot(122)
plot(tt,real(yt),'Linewidth',2);
xlabel('t');ylabel('y_l(t)cos(20*pi*t');title('��Ч�������Ч����ϵͳ��Ӧ�ľ��������Ƶ���ز�')



