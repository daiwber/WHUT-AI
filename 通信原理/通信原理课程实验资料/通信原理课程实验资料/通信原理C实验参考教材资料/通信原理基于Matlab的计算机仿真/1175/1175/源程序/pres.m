%������Ӧ�ź���ͼʾ��
clear all; close all;
Ts=1;
N_sample=16;
eye_num = 11;

N_data=1000;

dt = Ts/N_sample;
t = -5*Ts:dt:5*Ts;

%����˫���������ź�
d = sign(randn(1,N_data));
dd= sigexpand(d,N_sample);
%������Ӧϵͳ�����Ӧ
ht = sinc((t+eps)/Ts)./(1- (t+eps)./Ts);
ht( 6*N_sample+1 ) = 1;
st = conv(dd,ht);
tt = -5*Ts:dt:(N_data+5)*N_sample*dt-dt;

figure(1)
subplot(211);
plot(tt,st);
axis([0 20 -3 3]);xlabel('t/Ts');ylabel('������Ӧ�����ź�');
subplot(212)
%����ͼ
ss=zeros(1,eye_num*N_sample);
ttt = 0:dt:eye_num*N_sample*dt-dt;
for k=5:50
    ss = st(k*N_sample+1:(k+eye_num)*N_sample);
    drawnow;
    plot(ttt,ss); hold on;
end
%plot(ttt,ss);
xlabel('t/Ts');ylabel('������Ӧ�ź���ͼ');





