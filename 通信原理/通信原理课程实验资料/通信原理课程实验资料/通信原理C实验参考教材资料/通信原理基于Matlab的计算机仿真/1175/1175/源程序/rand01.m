function s=rand01(p,m,n)
%产生一个(p,1-p)的0－1随机变量
%输入参数： 
%       p:  0－1分布中0的概率
%       m,n:产生的随机变量样本个数m×n   
%输出： 产生的随机变量样本矢量
x = rand(m,n);
s = ( sign( x-p+eps )+1 )/2;