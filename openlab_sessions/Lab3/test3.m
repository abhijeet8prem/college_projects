%consider an array of numbers from 1-20, segment this array to array with 5
%elemsnts 

clc
clear
clear
[a,fs]=audioread('sky.wav');
n=0.03*fs;
off=0.01*fs;
v=1;
ln=length(a);
t=floor(ln/(n-off));
%segmenting 
for i=1:t
    for j=1:n
        if v<=ln
        x(i,j)=a(v);
        v=v+1;
        else
         x(i,j)=0; 
        end
    end
    v=v-off;
end

%generating hamming window
h=hamming(n);

%multipling with hamming window
for i=1:t
    for j=1:n
        z(i,j)=x(i,j)*h(j);
    end
end

%fnding energy
E=zeros(1,t);
for i=1:t
    for j=1:n
        E(i)=E(i)+(z(i,j))^2;
    end
end

%ploting the waveform vs energy of the signal
subplot(2,1,1);
plot(a);
title('orginal waveform');
subplot(2,1,2);
num=1:t;
stem(num,E);
title('energy of wavefrorm');