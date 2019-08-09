% function [c]=cepstrum(Y,fs)
figure(1);
[Y,fs]=audioread('speech.wav');
y=length(Y);
ns=0.030*2*fs;%no of samples in 30ms
off=floor(0.01*fs); %offset for each sample= 50%
cnt=1;

t=floor(y/(ns-off));
%to segment the speech
for i=1:t  
    for j=1:ns
        if(cnt<=y)
            X(i,j)=Y(cnt);
            cnt=cnt+1;
        else
            X(i,j)=0;
        end
    end
    cnt=cnt-off;
end
subplot(2,2,1);
plot(X(1,2100:ns));
title('sample');
h=hamming(ns); %to create window function
%windowing on segments
for i=1:t
    for j=1:ns
        A(i,j)=X(i,j)*h(j);
    end
end
subplot(2,2,2);
plot(A(1,2100:ns));
title('sample after windowing');

N=1024;
k=1:512;
fx=fft(A(1,2100:ns),N);
f=k*(fs/N);
subplot(2,2,3);
plot(f(1:512),abs(fx(1:512)));
title('FFT of windowed sample');

C=log(fx);
subplot(2,2,4);
plot(f(1:512),abs(C(1:512)));
title('logarithmic sample');
%getting cepstrum
c=ifft((C),N);
sm=smooth(c);
% subplot(3,2,5);
figure(2);
plot(1:length(c),c);
title('cepstrum by IDFT');

%Liftering
figure(3);
%window 
w=ones(1,30);
ce=c(1:30);

cx=fft(ce(1:30),N);
f=k*(fs/N);
subplot(2,1,1);
plot(f,abs(cx(1:512)));
title('fft of cspectrum');
cL=log(abs(cx(1:512)));
subplot(2,1,2);
plot(f,cL);
title('Log of cspectrum');
[pks,locs]=findpeaks(cL,'MinPeakDistance',50);
hold on;

stem(f(locs),pks,'*');
[pk1,mloc]=max(pks)
loc1=locs(mloc)
pks(mloc)=0;
[pk2,mloc]=max(pks)
loc2=locs(mloc)
pks(mloc)=0;
[pk3,mloc]=max(pks)
loc3=locs(mloc)

% high time lifting 
figure(4);
lc=length(c);
for i=1:lc
    if i>=30 && i<=lc/2
        wh(i)=1;
    else  
        wh(i)=0;
    end
end
ch=wh.*c;
%ch=smooth(ch);
plot(1:300,ch(1:300));
[cpks,clocs]=max(ch(1:300));

pith=(1/clocs)*fs
