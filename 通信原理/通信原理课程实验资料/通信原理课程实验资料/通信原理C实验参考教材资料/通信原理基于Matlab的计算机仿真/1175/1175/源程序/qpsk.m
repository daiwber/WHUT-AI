%MPSKϵͳϵͳ�ķ���
clear all;
close all;

M=4;     %QPSK

EsN0dB = 3:0.5:10;
EsN0 = 10.^( EsN0dB/10 );
Es = 1;
N0 = 10.^( -EsN0dB/10 );
sigma = sqrt(N0/2);

error = zeros(1,length(EsN0dB));
s_data = zeros(1,length(EsN0dB));

for k=1:length(EsN0dB)
    error(k)=0;
    s_data(k) = 0;
    while error(k)<1000
        %������Դ 1��2��3��4���ȷֲ�
        d = ceil( rand(1,10000)*M );
        %���Ƴ�QPSK�źţ���������ʽ��
        s = sqrt(Es)*exp(j*2*pi/M*(d-1));
        %�����ŵ���������������
        r = s + sigma(k)*( randn(1,length(d)) + j*randn(1,length(d)) );
        %�о�
        for m=1:M    %�������
            rd(m,:) = abs( r - sqrt(Es)*exp(j*2*pi/M*(m-1)) );
        end
        for m=1:length(s)   %�о���������ĵ�
            dd(m) = find( rd(:,m) == min(rd(:,m)) );
            if dd(m)~=d(m)
                error(k) = error(k)+1;
            end
        end
        s_data(k) = s_data(k)+10000;
    end
%    drawnow
%    semilogy(EsN0dB, error./(s_data+eps)); hold on;
end

Pe = error./s_data;
%���ۼ���������ʽ��
Ps = erfc( sqrt(EsN0)*sin(pi/M) );
semilogy(EsN0dB,Pe,'b*-'); hold on;
semilogy(EsN0dB,Ps,'rd-');
xlabel('Es/N0(dB)'); ylabel('������');
legend('������','���ۼ�����');