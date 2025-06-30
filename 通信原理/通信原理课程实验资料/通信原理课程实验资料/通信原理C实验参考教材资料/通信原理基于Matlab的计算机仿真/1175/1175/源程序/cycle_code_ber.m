%(7,4)ѭ���������
clear all; close all;
m = 0:-0.5:-3;
pe = 10.^m;

gx=[1 0 1 1];   %g(x)=1+x^2+x^3

%������Ϣ
MSG = ( sign(randn(100000,4)) +1 )/2;
%ѭ�������
d = encode(MSG,7,4,'cyclic',gx);
%d1=reshape(d',1,7*100000);

for k=1:length(pe)
    %������������ŵ�
    e = rand(100000,7)< pe(k);
    d2 = rem(d+e,2);
    %����
    d3 = decode(d2,7,4,'cyclic',gx);
    error(k) = sum( sum(abs(d3-MSG)) );
end
loglog(pe,error/400000);
xlabel('�ŵ�������');ylabel('�����������');
