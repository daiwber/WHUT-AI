%(7,4)循环码的性能
clear all; close all;
m = 0:-0.5:-3;
pe = 10.^m;

gx=[1 0 1 1];   %g(x)=1+x^2+x^3

%输入信息
MSG = ( sign(randn(100000,4)) +1 )/2;
%循环码编码
d = encode(MSG,7,4,'cyclic',gx);
%d1=reshape(d',1,7*100000);

for k=1:length(pe)
    %产生随机差错的信道
    e = rand(100000,7)< pe(k);
    d2 = rem(d+e,2);
    %译码
    d3 = decode(d2,7,4,'cyclic',gx);
    error(k) = sum( sum(abs(d3-MSG)) );
end
loglog(pe,error/400000);
xlabel('信道误码率');ylabel('译码后误码率');
