% function to add salt and pepper noise
function J = snp(I,d)
J=I;                                                                                                                                                                                                                            
    [row,col] = size(I);
    d = d*row*col;  

    % randomly add whilte/black pixels
    for i=1:d
        y_pos = round(1 + (col-1).*rand());
        x_pos = round(1 + (row-1).*rand());
        flag = rand('single');
        if flag<=0.5
            J(x_pos,y_pos) = 255;
        else
            J(x_pos,y_pos) = 0;
        end
    end
end