clc;
clear;
figure(1);
[Y,fs]=audioread('speech.wav');
y=length(Y);
ns=0.03*fs;%no of samples in 30ms
off=0.01*fs; %offset for each sample
cnt=1;
row=1;
col=1;
t=floor(y/(ns-off));
for row=1:t  %to segment the speech
    for col=1:ns
        if(cnt<=y)
            X(row,col)=Y(cnt);
            cnt=cnt+1;
        else
            X(row,col)=0;
        end
%         figure(row);
%         stem(X);
    end
    cnt=cnt-off;
end 
h=hamming(ns); %to create window function

%windowing on segments
for row=1:t
    for col=1:ns
        A(row,col)=X(row,col)*h(col);
    end
end
%finding energy plot
E=zeros(1,t);
for row=1:t
    for col=1:ns
        E(row)=E(row)+A(row,col)^2;
    end
end
num=1:t;
subplot(2,1,1);
plot(Y);
title('Audio Signal');
subplot(2,1,2);
stem(num,E);
title('Energy plot of audio signal');