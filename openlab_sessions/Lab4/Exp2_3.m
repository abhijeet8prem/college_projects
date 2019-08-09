clc
clear
%importng the audio files
[a,fs1]=audioread('a.wav');
[s,fs2]=audioread('s.wav');

%segmenting a
[A,n,t]=segment(a,fs1);

%generating hamming window
h=hamming(n);

%finding zero count of each segment
za=zeros(t,1);

for i=1:t
    for j=1:n
        if j<n-1
        za(i)=za(i)+(abs(sign(A(i,j+1))-sign(A(i,j))))*h(j);
        end
    end
    za(i)=floor(za(i)/2);
end
za

%segmenting b
[B,n,t]=segment(s,fs2);

%generating hamming window
h=hamming(n);

%finding zero count of each segment
zb=zeros(t,1);

for i=1:t
    for j=1:n
        if j<n-1
        zb(i)=zb(i)+(abs(sign(B(i,j+1))-sign(B(i,j))))*h(j);
        end
    end
    zb(i)=floor(zb(i)/2);
end
zb
