
x=[2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1];
y=[2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];
n=length(x);
subplot(2,1,1)
plot(x,y, 'x')
title('Original Data');
 
xmean=mean(x);
ymean=mean(y);
xnew=x-xmean;
ynew=y-ymean;
a=[xnew;ynew]';
subplot(2,1,2)
plot(xnew,ynew, 'x')
hold on
title('mean is deducted')
 
a1=transpose(a);
cov=(a1*a)/(n-1);
[V,D] = eig(cov);
%finding the principle 
D1=max(D);
[D2,pos]=max(D1);
 
%extracting the eigen vectors corrsponding to max eigen value
   
    Pre_vect = V(:, pos);  
 
%  u2=1;
% u1=1.0846*u2; 
%Finding the angle alpha
% alpha=atan(u2/u1);
alpha=atan(Pre_vect(1)/Pre_vect(2));
%slop
 m=tan(alpha);
%  
% %implementing line eqn
 for i=1:10
     y11(i)=m.*xnew(i);
 end
 plot(xnew,y11)
 hold off



 