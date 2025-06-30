%n�ظ�������
n=5;
m = 0:-0.5:-3;
pe = 10.^m;

%�ŵ�
d = (sign(randn(1,100000))+1)/2;  %��������
s = [d;d;d;d;d];                  %�ظ�5��
s = reshape(s,1,5*length(d));     %��s���һ������

%�ŵ�����ķ���
for k=1:length(pe)
    err = rand(1,length(d)*5);
    err = err<pe(k);              %�ŵ���������ͼ��
    r = rem(s+err,2);                    
    r = reshape(r,5,length(d));
    dd = sum(r) > 2;              %�����о�
    error(k) = sum( abs(dd-d) ) / length(d);
end
loglog(pe,error);
xlabel('�ŵ�������');ylabel('�����������');