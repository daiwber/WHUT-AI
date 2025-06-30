%卷积码的性能,(7,5), R=1/2
clear all;close all;
R=1/2;
EbN0dB = 0:1:6;
%BPSK调制
EsN0dB = EbN0dB + 10*log10(R);
N0 = 10.^(-EsN0dB/10); %求AWGN信道的单边功率谱密度
sigma = sqrt(N0/2);     

%卷积码的结构
trellis = poly2trellis(3,[7,5]);
error = zeros(1,length(N0));
for k=1:length(N0)
    n = 0; 
    while n<100  %每个信噪比下，仿真100帧
        %信源产生
        d1 = (sign(randn(1,1000))+1)/2;
        d = [d1 zeros(1,2)]; %添加尾比特使编码后状态归0
        %卷码编码
        s = convencoder(d,trellis);
        %BPSK、经过AWGN信道
        r = (2*s-1) + sigma(k)*randn(1,length(s));
        %译码
        dd = viterbi(r,trellis);
        %误码计数
        error(k) = error(k) + sum( abs( dd(1:length(d1)) - d1) )
        n = n+1       %计数仿了多少帧
    end
    ber(k) = error(k)/(n*1000);
end
semilogy(EbN0dB,ber);