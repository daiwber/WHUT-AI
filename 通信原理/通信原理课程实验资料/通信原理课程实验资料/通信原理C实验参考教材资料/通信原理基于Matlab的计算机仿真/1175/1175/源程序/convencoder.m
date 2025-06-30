function [out] = convencoder(din,trellis)
%卷积码编码器
%输入：din {0,1}序列码流
%      trellis  Matlab格式网格结构(可以用poly2trellis获得)
%初态为0
curState = 0;
for k=1:length(din)
    d(k) = trellis.outputs( curState+1,din(k)+1 );
    curState = trellis.nextStates( curState+1, din(k)+1 );
end

N = floor( log2(trellis.numOutputSymbols) );
out = dec2bin(d,N)-48;
out = reshape(out',1,N*length(din));


