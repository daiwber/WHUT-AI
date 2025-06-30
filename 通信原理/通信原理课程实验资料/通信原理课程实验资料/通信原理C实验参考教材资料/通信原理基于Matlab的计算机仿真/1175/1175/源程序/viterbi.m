function [out] = viterbi(r,trellis)
%软判决译码方式，2PSK,
N = log2(trellis.numOutputSymbols);
L = length(r)/N;
numStates = trellis.numStates;
numInputs = trellis.numInputSymbols;
mem = log2(numStates);

cur_metric= zeros(1,numStates)+Inf;
cur_metric(1)=0;

next_metric = -ones(1,numStates);
path = zeros(numStates,L);
sur_path = zeros(numStates,L);

for k=1:L                    %译码时刻
    for st = 1:numStates     %状态
        for i=0:numInputs-1   %输入
            dout = dec2bin( trellis.outputs(st,i+1),N )- 48;
            dout = 2*dout-1;
            dist = sum( (r((k-1)*N+1:k*N) - dout ).^2 ); %计算欧式距离s
            nextState = trellis.nextStates(st,i+1) +1;
            x = cur_metric(st) + dist;
            
            if next_metric(nextState)<0   %判断下一状态是否新写入？
                next_metric(nextState) = x;
                sur_path(nextState,1:k) = [path(st,1:k-1) i];
            else
                if x < next_metric(nextState)  %比较，输入支路的度量
                   next_metric(nextState) = x;
                   sur_path(nextState,1:k) = [path(st,1:k-1) i];
                end
            end
        end
    end
    cur_metric = next_metric;
    next_metric = -ones(1,numStates);
    path = sur_path;
end

out = path(1,:);