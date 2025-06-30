%��ֶ�ַ����ʾ�� cdm.m
clear all; close all;
Ts = 1;
N = 4;       %�û���

%�����û�����, 1000bits
randn('state',sum(100*clock));
d1 = sign(randn(1,100000));
d2 = sign(randn(1,100000));
d3 = sign(randn(1,100000));
d4 = sign(randn(1,100000));
dd = [d1;d2;d3;d4]';

%����4��walsh��
w = hadamard(4);         %����Matlab����
w = w/2;                 %������һ��  
%�û����ݸ���
s = [d1;d2;d3;d4]'*w;  %����
ss = reshape(s',1,4*100000);
stairs(ss);              %A�㲨��
axis([0 40 -2.2 2.2]);
xlabel('t/Tc'); ylabel('CDM�����ź�');
EsN0dB = 0:8;
%�����ŵ�
for k=1:length(EsN0dB)
    sigma(k) = sqrt( 10.^(-EsN0dB(k)/10)/2 );
    r = s + sigma(k)*randn(100000,4);
    %�û����ݷֿ�
    y = r*w;           %y��ÿ��Ϊÿ���û�������
    %�о�
    d = sign(y);
    %������AWGN�ŵ��£�ÿ���û����ܶ���ͬ��
    error(k) = sum(sum(abs(d-dd)/2));
    ber(k) = error(k)/400000;
end
figure(2)
semilogy(EsN0dB,ber);
xlabel('Es/N0(dB)'); ylabel('������');





