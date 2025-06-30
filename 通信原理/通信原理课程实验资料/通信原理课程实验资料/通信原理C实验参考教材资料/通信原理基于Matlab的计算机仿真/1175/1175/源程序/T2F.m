function [f,sf]= T2F(t,st)
%This is a function using the FFT function to calculate a signal's Fourier
%Translation
%Input is the time and the signal vectors,the length of time must greater
%than 2
%Output is the frequency and the signal spectrum
dt = t(2)-t(1);
T=t(end);
df = 1/T;
N = length(st);

%f=-N/2*df+df/2:df:N/2*df-df/2;
f=-N/2*df:df:N/2*df-df;

sf = fft(st);
sf = T/N*fftshift(sf);

%dff = df/8;
%ff = -50*df:dff:50*df;
%mf = sinc(ff*T);
%sf = conv(mf,sf)

%NN = length(f)+length(ff)-1;
%f = -NN/2*dff:dff:NN/2*dff-dff;


