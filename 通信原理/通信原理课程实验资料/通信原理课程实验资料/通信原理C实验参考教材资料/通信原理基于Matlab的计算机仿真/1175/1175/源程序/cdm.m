%码分多址复用示意 cdm.m
clear all; close all;
Ts = 1;
N = 4;       %用户数

%产生用户数据, 1000bits
randn('state',sum(100*clock));
d1 = sign(randn(1,100000));
d2 = sign(randn(1,100000));
d3 = sign(randn(1,100000));
d4 = sign(randn(1,100000));
dd = [d1;d2;d3;d4]';

%产生4阶walsh码
w = hadamard(4);         %调用Matlab函数
w = w/2;                 %能量归一化  
%用户数据复合
s = [d1;d2;d3;d4]'*w;  %复合
ss = reshape(s',1,4*100000);
stairs(ss);              %A点波形
axis([0 40 -2.2 2.2]);
xlabel('t/Tc'); ylabel('CDM复合信号');
EsN0dB = 0:8;
%经过信道
for k=1:length(EsN0dB)
    sigma(k) = sqrt( 10.^(-EsN0dB(k)/10)/2 );
    r = s + sigma(k)*randn(100000,4);
    %用户数据分开
    y = r*w;           %y中每列为每个用户的数据
    %判决
    d = sign(y);
    %计数（AWGN信道下，每个用户性能都相同）
    error(k) = sum(sum(abs(d-dd)/2));
    ber(k) = error(k)/400000;
end
figure(2)
semilogy(EsN0dB,ber);
xlabel('Es/N0(dB)'); ylabel('误码率');





