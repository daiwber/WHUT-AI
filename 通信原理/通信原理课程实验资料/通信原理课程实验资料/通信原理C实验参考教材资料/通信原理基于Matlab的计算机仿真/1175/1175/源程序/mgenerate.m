%m序列发生器
function [out] = mgenerate(g,state,N)
%输入 g: m序列生成多项式
%  state: 寄存器初始状态
%     N: 输出序列长度
generator = dec2bin(g) - 48;
M = length(g);                
curState = dec2bin(state,M-1) - 48;

for k=1:N
    out(k) = curState(M);
    a = rem( generator(2:end).*curState,2 );
    curState = [a curState(1:M-2)];
end