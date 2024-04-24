function [fin_signal]=my_wiener(x,d,order)
 
  len=length(x);
  rxx=xcorr(x); % autocorrection for x(y with noise)
  rxd=xcorr(d);
  rxx=rxx(len:len+order-1);
  rxd=rxd(len:len+order-1);
 
  Rxx = toeplitz(rxx);
  w=pinv(Rxx,0.0001)*rxd';
  fin_signal=filter(w,1,x);
  
end
