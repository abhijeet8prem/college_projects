% channel 1: green
% channel 2: blue
clc;
clear;
close all;
%cover=input('Enter the cover image','s');
img=imread('lenna.bmp');
% pr='Enter the secret message: ';
% ch=input(pr,'s');
% msg=dec2bin(ch);
% display('the message in binary:');
% msg
img2=imread('test.png');
img2=rgb2gray(img2);
figure(1)
imshow(img2);
msg1=[1 0 1 1 0 1 1 0
     1 1 0 1 1 0 1 0
     1 1 1 1 0 0 1 0
     1 0 1 0 1 0 1 0
     1 1 1 1 0 1 0 1
     1 1 1 1 1 0 1 1];
%msg1=dec2bin(img2);

% figure(4)
% imshow(img);
%y=imread(msg);
red_T=img(: , : ,1);  %red plane
green_T=img(: , : ,2);  %green plane
blue_T=img(: , : ,3);  %blue plane

red=img(: , : ,1);  %red plane
green=img(: , : ,2);  %green plane
blue=img(: , : ,3);  %blue plane
W_img= length(img);
% figure(1)
% imshow(red);
% figure(2)
% imshow(green);
% figure(3)
% imshow(blue);

%code=input('enter the code: ');

si=size(msg1);
%if()
si=si(1);
i=1;
j=1;
k=1;
mask=252;
num=0;
for c=1:2
    %genetatng random code for encoding.
    i=1;
    num=0;
    while(num<8)
    code=mod(round(rand(1)*10),4);
    if (code==0)
    code=1;
    end
    code
    msg=msg1(c,:)

    %if(code==1 || code==2 || code==0)
%     case 2
        %for i=1:4
            if(k>W_img)
               k=1;
               j=j+1;
            end 
            
            if (code ==0)
              % not hinding anything
                temp=bitand(red(j,k),mask);
                red(j,k)=bitor(temp,0);
                k=k+1
            
            elseif(code==1)
                
                if(num>=8)
                   num=0;
                   i=1;
                end
                
                %No hidden data in green,2 bits of hidden data in blue
                Mdec=msg(2*i-1)*2+msg(2*i)*1;
                %Mdec=str2num(msg(2*i-1))*2+str2num(msg(2*i))*1;
                temp=bitand(blue(j,k),mask);
                blue(j,k)=bitor(temp,Mdec);

                temp=bitand(red(j,k),mask);
                red(j,k)=bitor(temp,1);
                k=k+1
                i=i+1
                num=num+2
            elseif(code==2)
                
                if(num>=8)
                   num=0;
                   i=1;
                end
                %2 bits of hidden data in green 1
                Mdec=msg(2*i-1)*2+msg(2*i)*1;
                %Mdec=str2num(msg(2*i-1))*2+str2num(msg(2*i))*1;
                temp=bitand(green(j,k),mask);
                green(j,k)=bitor(temp,Mdec);

                temp=bitand(red(j,k),mask);
                red(j,k)=bitor(temp,2);
                k=k+1
                i=i+1
                num=num+2
            end
            
        %end
   % end
    
    if(code==3)   
        
         %for i=1:2
             
             if(num>=8)
               num=0;
               i=1;
             end
            
            %2 bits of hidden data in blue and green
            Mdec1=msg(4*i-3)*2+msg(4*i-2)*1;
            Mdec2=msg(4*i-1)*2+msg(4*i)*1;
            %Mdec1=str2num(msg(4*i-3))*2+str2num(msg(4*i-2))*1;
            %Mdec2=str2num(msg(4*i-1))*2+str2num(msg(4*i))*1;
            temp=bitand(blue(j,k),mask);
            blue(j,k)=bitor(temp,Mdec1);
            temp=bitand(green(j,k),mask);
            green(j,k)=bitor(temp,Mdec2); 
            
            temp=bitand(red(j,k),mask);
            red(j,k)=bitor(temp,3);
            k=k+1
            i=1+1
            num=num+4
         end
    end
   end      
%end

% Recombine separate color channels into an RGB image.
rgbImage = cat(3, red, green, blue);
figure(2)
imshow(rgbImage);
figure(3)
imshow(img);

% writing the file
 folder = 'C:\Users\Abhijeet Prem\Documents\Image Processing\Matlab\porject';
 imwrite(rgbImage,fullfile(folder,'lenna1.bmp'));