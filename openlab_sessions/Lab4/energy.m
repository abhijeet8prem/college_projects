function[E,t]=energy(a,fs)
n=0.03*fs;
off=floor(0.015*fs);
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