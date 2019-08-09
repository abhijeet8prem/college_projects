clc
clear
a=1:20;
n=5;
off=1;
t=length(a)/n
x=zeros(t,n)
for i=1:length(a)/n
    %if()    
    x=a(n*(i-1)+1:n*i);
end
x