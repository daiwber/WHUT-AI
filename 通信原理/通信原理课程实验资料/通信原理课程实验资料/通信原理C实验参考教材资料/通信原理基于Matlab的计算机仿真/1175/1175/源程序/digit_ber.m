%数字基带接收机得性能
clear all;
close all;
EbN0dB =0:0.5:10;
N0 = 10.^(-EbN0dB/10);
sigma = sqrt(N0/2);
%理论计算的误码率
Pb = 0.5*erfc(sqrt(1./N0));
%仿真误码率
for n=1:length(EbN0dB)
    a = sign(randn(1,100000));             %产生等概信源＋1、－1
    rk = a + sigma(n)*randn(1,100000);     %离散等效接收模型
    dec_a = sign(rk);                       %判决
    ber(n) = sum( abs(a-dec_a)/2 )/length(a); %计算误码率
end
    
semilogy(EbN0dB,Pb);
hold;
semilogy(EbN0dB,ber,'rd-');
legend('理论值','仿真结果');
xlabel('Eb/N0(dB)');ylabel('Pb');
