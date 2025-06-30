%show the pcm encode and decode
%show the pcm encode and decode
clear all
close all
dt = 1/4096;
t=0:dt:2;
%vm1=-70:1:0;    %输入的正弦信号幅度不同
vm1 = 0;
vm = 10.^(vm1/20); 
v = 1;          %量化区间为[-1,+1]

figure(1)
for k=1:length(vm)
  for m=1:1
      x=vm(k)*sin(2*pi*t+2*pi*rand(1));
      sxx = floor(x*4096);
      y = pcm_encode(sxx);
      yy = pcm_decode(y,v);
 
      nq(m)=sum((x-yy).*(x-yy))/length(x);
      sq(m)=mean(yy.^2);
      snr(m)=(sq(m)/nq(m));
      drawnow
      subplot(211)
      plot(t,x);
      title('sample sequence');
      subplot(212)
      stairs(t,yy)
      title('pcm decode sequence');
  end
      snrq(k)=10*log10( mean(snr) );
end

figure(2)
plot(vm1,snrq);
axis([-60 0 0 60]);
grid;
