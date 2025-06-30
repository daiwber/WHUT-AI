function s = rayleigh(sigma2,m,n)
%产生瑞利分布的随机变量
%输入参数： 
%       sigma2: 瑞利分布的功率
%       m,n:    输出m×n个样本
x = sqrt(sigma2/2)*randn(m,n);
y = sqrt(sigma2/2)*randn(m,n);
s = sqrt(x.*x+y.*y);