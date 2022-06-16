% function to perform median filtering
function J = Medianfilter(I)

% performing padding
K=zeros(size(I)+2);
J=zeros(size(I));

for x=1:size(I,1)
    for y=1:size(I,2)
       K(x+1,y+1)=I(x,y);
    end
end

% put the values in array and find median
 for i= 1:size(K,1)-2
    for j=1:size(K,2)-2
        window=zeros(9,1);
        count=1;
        for x=1:3
            for y=1:3
                window(count)=K(i+x-1,j+y-1);
                count=count+1;
            end
        end
        window=sort(window);
        
        % Place median in output matrix
        J(i,j)=window(5);
    end
 end
 J=uint8(J);
end