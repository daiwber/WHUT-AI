%m���з�����
function [out] = mgenerate(g,state,N)
%���� g: m�������ɶ���ʽ
%  state: �Ĵ�����ʼ״̬
%     N: ������г���
generator = dec2bin(g) - 48;
M = length(g);                
curState = dec2bin(state,M-1) - 48;

for k=1:N
    out(k) = curState(M);
    a = rem( generator(2:end).*curState,2 );
    curState = [a curState(1:M-2)];
end