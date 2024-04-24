function [final]=neWiener(x,noise,order)
  
  len=length(x);
  rxx=xcorr(x); 
  rss=xcorr(noise);
  rss=rss(length(noise):length(noise)+order-1);

  rxx=rxx(len:len+order-1);
%   ryy=ryy(len:len+order-1);
  ryy=rxx-rss;
 
  Rxx = toeplitz(rxx);
  w=pinv(Rxx,0.0001)*ryy';
  final=filter(w,1,x);
  
end