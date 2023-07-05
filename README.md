# **DENOISING WITH WIENER FILTER** 


_This repository implements a WIENER FIR filter in MATLAB_



</br>

## **WIENER FILTER**
***
<!-- ![wiener](test.png) -->


* $${  x(n) = input\ signal }$$
* $$ d(n)=reference\ signal $$
* $$ d'(n)=output\  signal $$
* $$ e(n)=error=d(n)-{\hat d(n)} $$

</br>
</br>



$$ d'(n)= \sum_{k=0}^{N-1} W_k(n)x(k-n)$$ 

* $${ x(n)=d(n) - {\hat{d}}(n)}$$


 </br>


 ***
 Assume that ${x(n)}$  and ${d(n)}$ are WSS we want to calculate ${ w(k),\ k=0,1,2,....,N-1.}$ minimize (MSE)
 </br>

 

 *  $${ \xi\ =min_{w(k)} \ E  \{|e(n)|^2\} = min_{w(k)} \ E  \{|d(n)-d'(n)|^2\} = \frac{1}{n}\sum_{m=0}^{n} e^2[m]\ (1) }$$

 Coefficients of Wiener Filter minimize MSE.
  * $${min_{w(k)}  \ \xi\ =min_{w(k)} \ E  \{|e(n)|^2\}} \Rightarrow\frac{\partial \xi\ }{\partial w^{^{*}}(k)} =0  \ ,for \ k=0,1,...,p-1. \ (2) $$

But error ${e(n)}$ is equal with:
* $${e(n)=d(n)- {\hat{d}(n)=d(n)-x(n)*w(n)=d(n)-{ \sum_{l=0}^{p-1} w(l)x(n-l) } \ (3) }} $$

And we have:
* $${ (2)\Rightarrow\frac{\partial E[e(n)e^{^{*}}(n)]}{\partial w^{star}(k)}=0\Rightarrow E[e(n)x^{star}(n-k)]=0 , for \ k=0,1,...,p-1.\ (4) }$$

* $${(4),(3) \Rightarrow E[d(n)x^{star}(n-k)] \ -{ \sum_{l=0}^{p-1} w(l) E[x(n-l)x^{star}(n-k)]} =0\Rightarrow \ r_{dx}(k)- \sum_{l=0}^{p-1} w(l)r_{x}(k-l)=0 \,for \ k=0,1,...,p-1. }$$


