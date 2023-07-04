function [fin_signal]=my_wiener(x,y,order)

len=size(x);
rxx=xcorr(x); % autocorrection for x(y with noise)
rxd=xcorr(x,y);
rxx=rxx(len:len+order-1);
rxd=rxd(len:len+order-1);

Rxx = toeplitz(rxx);
w= pinv(Rxx,0.0001)*rxd';
fin_signal=filter(w,1,x);

