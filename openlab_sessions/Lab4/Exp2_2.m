clc
clear
%importng the audio files
[a,fs]=audioread('speech.wav');

%segmenting wave
[A,n,t]=segment(a,fs);

%generating hamming window
h=hamming(n);

%finding zero count of each segment
z=zeros(t,1);

for i=1:t
    for j=1:n
        if j<n-1
        z(i)=z(i)+(abs(sign(A(i,j+1))-sign(A(i,j))))*h(j);
        end
    end
    z(i)=floor(z(i)/2);
end
z
