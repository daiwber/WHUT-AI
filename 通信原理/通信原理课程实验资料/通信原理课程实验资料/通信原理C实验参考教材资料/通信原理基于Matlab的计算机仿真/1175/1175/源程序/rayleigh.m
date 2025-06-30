function s = rayleigh(sigma2,m,n)
%���������ֲ����������
%��������� 
%       sigma2: �����ֲ��Ĺ���
%       m,n:    ���m��n������
x = sqrt(sigma2/2)*randn(m,n);
y = sqrt(sigma2/2)*randn(m,n);
s = sqrt(x.*x+y.*y);