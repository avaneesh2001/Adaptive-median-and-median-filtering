%%
function imag = AdaptiveMedianfilter(image,MaxSizeFilter)
%A daptiveFilter(image,MaxSizeFilter)
% remove noise by changing the size of filter
% MaxSizeFilter : maximum size of filter 
% AdaptiveFilter will start with 3*3 window
% and still if noise is isnt removed the window size is increased
% until MaxSizeFilter and the process of removing  noise is repeated.
global imag;
global imageTemp;
[x,y]=size(image);
imag=double(image);
imag=MFilter(MaxSizeFilter);
 
Q = MaxSizeFilter-ceil(MaxSizeFilter/2);%cut image
imag=imag(Q:Q+x-1,Q:Q+y-1);
imag = uint8(imag);
end


%%
function out=MFilter(MaxSizeFilter)% x: row number and y:col number
global imag;
global imageTemp;
[xb,yb]=size(imag);
imageTemp=zeros(xb,yb);
imag=Padding(MaxSizeFilter);
 
Start=MaxSizeFilter-floor(MaxSizeFilter/2);
                                            
for i=Start:Start+(xb-1)
    for j=Start:Start+(yb-1)
               
        Calc(3,MaxSizeFilter,i,j);
               
    end
end
out=imageTemp;
end

%%
function Calc(FilterSize,MaxFilterSize,i,j)
global imageTemp;
global imag;
 
            Zxy=0;
            
            justification=ceil((FilterSize-1)/2);
            Neighberhood=imag(i-justification:i+justification,j-justification:j+justification);
            sorted=sort(Neighberhood(:));
            
            % obtain variables for computation
            Zmin=sorted(1);
            Zmax=sorted(end);
            Zmed=median(sorted);
            Zxy=imag(i,j);
            
            B1=Zxy-Zmin;
            B2=Zxy-Zmax;
            if(B1>0 && B2<0)
                imageTemp(i,j)=Zxy;
                return;
            else
                A1=Zmed-Zmin;
                A2=Zmed-Zmax;
                if(A1>0 && A2<0)
                    imageTemp(i,j)=Zmed;
                    return;
                else
                    if(FilterSize<MaxFilterSize)
                        FilterSize=FilterSize+2;
                        Calc(FilterSize,MaxFilterSize,i,j);
                        return;
                    else
                        imageTemp(i,j)=Zmed;
                    end
                end
            end
end

%% 
function output=Padding(maxPadd)
global imag;
 
 Pad=floor((maxPadd-1)/2);
 while(Pad)
     imag=[imag(:,1) imag imag(:,end)]; 
     imag=[imag(1,:);imag;imag(end,:)]; 
     Pad=Pad-1;
 end
 output=imag;

end