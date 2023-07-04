function [fin_signal]=new_wiener(x,noise_corr,order)
len=size(x);
rxx=xcorr(x);
rxd=rxx-noise_corr;
rxx=rxx(len:len+order-1);
rxd=rxd(len:len+order-1);

Rxx = toeplitz(rxx);
w= pinv(Rxx,0.0001)*rxd';
fin_signal=filter(w,1,x);