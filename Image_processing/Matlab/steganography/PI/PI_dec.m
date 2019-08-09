% PI decoder

clc
clear
%reading the strgo image
img=imread('lenna1.bmp');

%splitting to 3 channel

red_T=img(: , : ,1);  %red plane
green_T=img(: , : ,2);  %green plane
blue_T=img(: , : ,3);  %blue plane

%extract the code from the r channel
%code=bitand(red_T(1,1),3);
% buf=blanks(1,8);
k=1;
c=1;
code=bitand(red_T(1,1),3);
for j=1:40
    
    for i=1:512
        if(k>4)
            k=1;
            c=c+1;
        end
        
        if(code==1)
            %blue
           temp=dec2bin(bitand(blue_T(j,i),3));
           if(strcmp(temp,'1'))
           buf(c,(2*k)-1:2*k)={0 1};
           elseif(strcmp(temp,'0'))
           buf(c,(2*k)-1:2*k)={0 0};
           elseif(strcmp(temp,'10'))
           buf(c,(2*k)-1:2*k)={1 0};
           elseif(strcmp(temp,'11'))
           buf(c,(2*k)-1:2*k)={1 1};   
           end
           k=k+1;
        end
        
        if(code==2)
            %green         
           temp=dec2bin(bitand(green_T(j,i),3));
           if(strcmp(temp,'1'))
           buf(c,(2*k)-1:2*k)={0 1};
           elseif(strcmp(temp,'0'))
           buf(c,(2*k)-1:2*k)={0 0};
           elseif(strcmp(temp,'10'))
           buf(c,(2*k)-1:2*k)={1 0};
           elseif(strcmp(temp,'11'))
           buf(c,(2*k)-1:2*k)={1 1};   
           end
           k=k+1;
        end
        
        if(code==3)
            %blue & green
           temp=dec2bin(bitand(blue_T(j,i),3));
           if(strcmp(temp,'1'))
           buf(c,(2*k)-1:2*k)={0 1};
           elseif(strcmp(temp,'0'))
           buf(c,(2*k)-1:2*k)={0 0};
           elseif(strcmp(temp,'10'))
           buf(c,(2*k)-1:2*k)={1 0};
           elseif(strcmp(temp,'11'))
           buf(c,(2*k)-1:2*k)={1 1};   
           end
           k=k+1;
           %extracting from green channel
           temp2=dec2bin(bitand(green_T(j,i),3));
           if(strcmp(temp2,'1'))
           buf(c,(2*k)-1:2*k)={0 1};
           elseif(strcmp(temp2,'0'))
           buf(c,(2*k)-1:2*k)={0 0};
           elseif(strcmp(temp2,'10'))
           buf(c,(2*k)-1:2*k)={1 0};
           elseif(strcmp(temp2,'11'))
           buf(c,(2*k)-1:2*k)={1 1};   
           end
           k=k+1;
        end
       
        
    end
end
c=1;
for l=1:40
    for m=1:120
        temp=buf(c,:);
        temp=cell2mat(temp);
        val=0;
        for n=0:7
          val=val+((2^n)*temp(8-n)) ; 
        end
        img2(l,m)=val;
        c=c+1;
        if(c==5120)
        break;
        end
    end
    if(c==5120)
        break;
    end
end
img4=uint8(img2);
imshow(img4);
%folder = 'C:\Users\Abhijeet Prem\Documents\Image Processing\Matlab\porject';
%imwrite(img2,fullfile(folder,'extract.bmp'));