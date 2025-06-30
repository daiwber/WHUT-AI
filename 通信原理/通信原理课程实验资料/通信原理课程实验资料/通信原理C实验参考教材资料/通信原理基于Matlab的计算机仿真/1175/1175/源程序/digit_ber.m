%���ֻ������ջ�������
clear all;
close all;
EbN0dB =0:0.5:10;
N0 = 10.^(-EbN0dB/10);
sigma = sqrt(N0/2);
%���ۼ����������
Pb = 0.5*erfc(sqrt(1./N0));
%����������
for n=1:length(EbN0dB)
    a = sign(randn(1,100000));             %�����ȸ���Դ��1����1
    rk = a + sigma(n)*randn(1,100000);     %��ɢ��Ч����ģ��
    dec_a = sign(rk);                       %�о�
    ber(n) = sum( abs(a-dec_a)/2 )/length(a); %����������
end
    
semilogy(EbN0dB,Pb);
hold;
semilogy(EbN0dB,ber,'rd-');
legend('����ֵ','������');
xlabel('Eb/N0(dB)');ylabel('Pb');
