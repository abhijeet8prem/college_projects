clc
clear
clear
a=1:20;
n=5;
off=3;
v=1;
ln=length(a);
t=floor(ln/(n-off));
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
x