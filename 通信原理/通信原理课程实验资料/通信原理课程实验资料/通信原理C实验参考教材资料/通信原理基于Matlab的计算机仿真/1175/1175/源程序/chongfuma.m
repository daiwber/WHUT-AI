%n重复码性能
n=5;
m = 0:-0.5:-3;
pe = 10.^m;

%信道
d = (sign(randn(1,100000))+1)/2;  %编码输入
s = [d;d;d;d;d];                  %重复5次
s = reshape(s,1,5*length(d));     %将s变成一个序列

%信道误码的仿真
for k=1:length(pe)
    err = rand(1,length(d)*5);
    err = err<pe(k);              %信道误码的随机图样
    r = rem(s+err,2);                    
    r = reshape(r,5,length(d));
    dd = sum(r) > 2;              %大数判决
    error(k) = sum( abs(dd-d) ) / length(d);
end
loglog(pe,error);
xlabel('信道误码率');ylabel('译码后误码率');