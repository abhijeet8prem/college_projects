clc
clear
f=4;
fs=1000;
t=0:1/fs:1;
s=sin(2*pi*f*t);
plot(t,s);%ploting the 
n=length(s);
z=0;


for i=2:n
    if i<n-1
   z = z+(abs(sign(s(i+1))-sign(s(i))));
    end
end
z=floor(z/2)% gettng the value of z right
