function [fin_signal]=wiener_predict(d,order,pos)
  
  len=length(d);
  rdd=xcorr(d); % autocorrection for x(y with noise)
  rxx=rdd(len:len+order-1);
  rdd=rdd(len+pos:len+pos+order-1);
 
  Rxx = toeplitz(rxx);
  w=pinv(Rxx,0.0001)*rdd';
  fin_signal=filter(w,1,d);
end
