function [final]=neWiener_frames(x,order)

frame_x=frame_wind(x.',256,0.5);
[rows,cols]=size(frame_x);
fin_signal= zeros(rows,cols);

std_noise=0.01;
threshold=2*std_noise;
% window = zeros(256, 1);
window=frame_x(:,1);

for j=1:size(frame_x,2)
    col=frame_x(:,j);
    % find if every window has voice or noise
    if all(abs(col)<threshold)
        window=col;
       
    end 
    
    % apply wiener filter in every window
    my_z=neWiener(col.',window.',order);
    my_z=my_z.';
    fin_signal(:,j)=my_z;
    
  
end 


final=frame_recon(fin_signal,0.5);
end