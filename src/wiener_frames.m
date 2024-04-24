function [final] = wiener_frames(x,y,order)

x=x.';
y=y.';
frame_x=frame_wind(x,256,0.5);
frame_y=frame_wind(y,256,0.5);

[rows,cols]=size(frame_x);
fin_signal= zeros(rows,cols);

for j =1:size(frame_x,2)
    new_x=frame_x(:,j);
    new_y=frame_y(:,j);
    new_x=new_x.';
    new_y=new_y.';
    
    my_z=my_wiener(new_x,new_y,order);
    my_z=my_z.';
    fin_signal(:,j)=my_z;
    
end 

final=frame_recon(fin_signal,0.5);
end 