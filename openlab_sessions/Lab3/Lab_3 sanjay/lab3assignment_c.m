clc;
clear;
[Y,fs]=audioread('speech.wav');
y=length(Y);
n=5;
cnt=1;
row=1;
col=1;
off=2;
t=floor(y/(n-off));
for row=1:t
    for col=1:n
        if(cnt<=y)
            B(row,col)=Y(cnt);
            cnt=cnt+1;
        else
            B(row,col)=0;
        end
    end
    cnt=cnt-off;
end
B