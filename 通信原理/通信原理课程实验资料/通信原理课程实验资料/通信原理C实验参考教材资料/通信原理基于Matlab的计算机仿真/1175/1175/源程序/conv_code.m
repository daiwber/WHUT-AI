%����������,(7,5), R=1/2
clear all;close all;
R=1/2;
EbN0dB = 0:1:6;
%BPSK����
EsN0dB = EbN0dB + 10*log10(R);
N0 = 10.^(-EsN0dB/10); %��AWGN�ŵ��ĵ��߹������ܶ�
sigma = sqrt(N0/2);     

%�����Ľṹ
trellis = poly2trellis(3,[7,5]);
error = zeros(1,length(N0));
for k=1:length(N0)
    n = 0; 
    while n<100  %ÿ��������£�����100֡
        %��Դ����
        d1 = (sign(randn(1,1000))+1)/2;
        d = [d1 zeros(1,2)]; %���β����ʹ�����״̬��0
        %�������
        s = convencoder(d,trellis);
        %BPSK������AWGN�ŵ�
        r = (2*s-1) + sigma(k)*randn(1,length(s));
        %����
        dd = viterbi(r,trellis);
        %�������
        error(k) = error(k) + sum( abs( dd(1:length(d1)) - d1) )
        n = n+1       %�������˶���֡
    end
    ber(k) = error(k)/(n*1000);
end
semilogy(EbN0dB,ber);