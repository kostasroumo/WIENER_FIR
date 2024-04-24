function [start_idx,end_idx]=find_silence(x,space)
N=length(x);
std_noise=0.01;
threshold=2*std_noise;
start_idx=0;
end_idx=0;

for i =1:(N-space)
    segment=x(i:i+space);
    if all(abs(segment)<threshold)
        
        start_idx=i;
        end_idx=i+space;
        break;
    end 
    
end 
end