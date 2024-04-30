function [output]= wiener_predict_frames(value,x,y,order)

frame_x=frame_wind(x.',256,0.5);
frame_y=frame_wind(y.',256,0.5);

[rows,cols]=size(frame_x);
fin_signal= zeros(rows,cols);

for j =1:size(frame_x,2)
    new_y=frame_y(:,j);
    new_y=new_y.';
    
    my_z=wiener_predict(new_y,order,value);
    my_z=my_z.';
    fin_signal(:,j)=my_z;
    
end 

finb=frame_recon(fin_signal,0.5);

output=finb(1:value);
fprintf('First %d values:\n', value);
disp(output);
end 
