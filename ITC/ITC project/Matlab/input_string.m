clc
clear
%get the string
prompt= 'please enter the string: ';
str=input(prompt,'s');
display('you have entered');
display(str);

% find the size of the string
a=size(str);
a=a(2);
ch=blanks(a);%blank char array.
count=zeros(1,100);%for frequency of charactes
c=1;
%counter for characters
%initial setup
ch(c)=str(1);
count(1)=1;
c=2;
flag=0;%to find if the char is repeated.

%loop to extract the characters
for i=2:a
   for j=1:c
       
       if(ch(j)==str(i))
           count(j)=count(j)+1;
           flag=1;
       end
   end
   
   if(flag==0)
       ch(c)=str(i);
       count(c)=1;
       c=c+1;
   end 
     flag=0; 
end
%correcting value of c
c=c-1;

display(ch);
