function [t st]=lpf(f,sf,B)
%This function filter an input data using a lowpass filter at frequency
%domain
%Inputs:
%     f:  frequency samples
%     sf: input data spectrum samples
%     B:  lowpass's bandwidth with a rectangle lowpass
%Outputs:
%     t: frequency samples
%     st: output data's time samples
df = f(2)-f(1);
T = 1/df;
hf = zeros(1,length(f));

bf = [-floor( B/df ): floor( B/df )] + floor( length(f)/2 );
hf(bf)=1;

yf=hf.*sf;
[t,st]=F2T(f,yf);
st = real(st);

