function [out]=pcm_encode(x)
%x encode to pcm code
n=length(x);
%-4096<x<4096
for i=1:n
   if x(i)>0
      out(i,1)=1;
   else
      out(i,1)=0;
   end
   
   if abs(x(i))>=0 & abs(x(i))<32
         out(i,2)=0;out(i,3)=0;out(i,4)=0;step=2;st=0;
   elseif 32<=abs(x(i)) & abs(x(i))<64
         out(i,2)=0;out(i,3)=0;out(i,4)=1;step=2;st=32;
   elseif 64<=abs(x(i)) & abs(x(i))<128
         out(i,2)=0;out(i,3)=1;out(i,4)=0;step=4;st=64;
   elseif 128<=abs(x(i)) & abs(x(i)) <256
         out(i,2)=0;out(i,3)=1;out(i,4)=1;step=8;st=128;
   elseif 256<=abs(x(i)) & abs(x(i))<512
         out(i,2)=1;out(i,3)=0;out(i,4)=0;step=16;st=256;
   elseif 512<=abs(x(i)) & abs(x(i))<1024
         out(i,2)=1;out(i,3)=0;out(i,4)=1;step=32;st=512;
   elseif 1024<=abs(x(i)) & abs(x(i))<2048
         out(i,2)=1;out(i,3)=1;out(i,4)=0;step=64;st=1024;
   elseif 2048<=abs(x(i)) & abs(x(i))<4096
         out(i,2)=1;out(i,3)=1;out(i,4)=1;step=128;st=2048;
   else
         fprintf('input overflow');
         out(i,2)=1;out(i,3)=1;out(i,4)=1;step=128;st=2048;
   end
   
   if(abs(x(i))>=4096)
       out(i,2:8) = [1 1 1 1 1 1 1];
   else
       tmp = floor( (abs(x(i))-st)/step );
       t = dec2bin(tmp,4) - 48;  %函数dec2bin输出的是ASCII字符串，48对应0
       out(i,5:8) =t(1:4);
   end
    
%   out(i,5)  = tmp
%   out(i,5)= tmp>=(st+h0*st/2);
%   h1=2*out(i,5)-1;
%   out(i,6)= tmp>=(st+h0*st/2+h1*st/4);
%   h2=2*out(i,6)-1;
%   out(i,7)= tmp>=(st+h0*st/2+h1*st/4+h2*st/8);
%   h3=2*out(i,7)-1;
%   out(i,8)= tmp>=(st+h0*st/2+h1*st/4+h2*st/8+h3*st/16);
      
end
out=reshape(out',1,8*n);
   
   