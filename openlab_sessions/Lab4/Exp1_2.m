clc
clear
clear
[a,fs1]=audioread('a.wav');
[s,fs2]=audioread('s.wav');

% procession of A
[A,t1]=energy(a,fs1);
figure(1);
%ploting the waveform vs energy of the signal
subplot(2,1,1);
plot(a);
title('orginal waveform of A');
subplot(2,1,2);
num=1:t1;
stem(num,A);
title('energy of wavefrorm A');

% procession of S
[S,t2]=energy(s,fs2);
figure(2);
%ploting the waveform vs energy of the signal
subplot(2,1,1);
plot(s);
title('orginal waveform of S');
subplot(2,1,2);
num=1:t2;
stem(num,S);
title('energy of wavefrorm S');