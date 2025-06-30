function [out] = convencoder(din,trellis)
%����������
%���룺din {0,1}��������
%      trellis  Matlab��ʽ����ṹ(������poly2trellis���)
%��̬Ϊ0
curState = 0;
for k=1:length(din)
    d(k) = trellis.outputs( curState+1,din(k)+1 );
    curState = trellis.nextStates( curState+1, din(k)+1 );
end

N = floor( log2(trellis.numOutputSymbols) );
out = dec2bin(d,N)-48;
out = reshape(out',1,N*length(din));


