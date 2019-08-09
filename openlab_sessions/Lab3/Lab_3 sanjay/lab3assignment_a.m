%question1
clc;
clear;
Y=1:20;
row=1;
col=1;
for arycnt=1:20
    A(row,col)=Y(arycnt);
    col=col+1;
   if (mod(Y(arycnt),5)==0)
       row=row+1;
       col=1;
   end;    
end
A

%Qustion 2
clc;
clear;
Y=1:20;
y=length(Y);
n=5;
cnt=1;
row=1;
col=1;
off=2;
t=floor(y/(n-off));
for row=1:t
    for col=1:n
        if(cnt<=y)
            B(row,col)=Y(cnt);
            cnt=cnt+1;
        else
            B(row,col)=0;
        end
    end
    cnt=cnt-off;
end
B