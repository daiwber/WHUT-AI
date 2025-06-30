%yantu  单极性码
close all
clear all
Ts=1;
eyenum=10;
codenum=2000;
tsample=4;
dt=0.2;
t=-eyenum/2:dt:eyenum/2;
%ht=1/Ts*sinc(t/Ts);
%定义基带传输脉冲为升余弦alpha=0.4
alpha=input('输入滚降系数alpha=(缺省为1)');
if isempty(alpha)
   alpha=1;
end


pp=cos(alpha*pi*t/Ts);
pp1=1./(1-4*t.*t*alpha*alpha/Ts/Ts);
ht=1/Ts*sinc(t/Ts).*pp.*pp1;
%ht=1/Ts*sinc(t/Ts)+1/Ts*sinc((t-Ts)/Ts);

%产生+1、0的数字信号
%code=(sign(randn(1,codenum))+1)/2+0.1*randn(1,codenum);
code=sign(randn(1,codenum))+0.05*randn(1,codenum);

%画眼图
figure(1)
hold on
xlabel('Ts');
ylabel('rt');

title('升余弦成形眼图');
grid
for n=1:codenum/eyenum
  ss=zeros(1,length(ht)+Ts/dt);
   
  for m=1:eyenum
     tmp=code((n-1)*eyenum+m)*ht;
     tmp1=ss((m*Ts/dt+1):length(ss))+tmp;
     ss =[ss(1:(m*Ts/dt)) tmp1 zeros(1,Ts/dt)];
  end
  drawnow
  kk=1:length(ss);
  plot(kk*dt-dt,ss);hold on
  clear ss;
  axis([5 15 -3 3]);
  %pause
end

      
   