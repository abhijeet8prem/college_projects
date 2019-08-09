clc
clear
% generating a random array dataset for x and y.
data_set= rand(10,2);
data_set=data_set.*10;
% data_set=[2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1
% 2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9];

% data_set=[1 2 3 4 5 6 7 8 9 10
%      2 1 4 3 5 4 6 8 7 9];


figure(1)
subplot(2,1,1)
scatter(data_set(:,1),data_set(:,2),'x');
title('orginal data');

%finding mean
mean_x=mean(data_set(:,1));
mean_y=mean(data_set(:,2));

%adjustng with respect to mean
new_x=data_set(:,1)-mean_x;
new_y=data_set(:,2)-mean_y;

new_data=[new_x new_y];

%figure(2)
subplot(2,1,2);
scatter(new_x,new_y,'x');
title('New Data with PCA Line');
hold on;

data_trans=transpose(new_data);
cov=(data_trans*new_data)/(9);

[vect,lam]=eig(cov);
%fnding max in each eigen vector
Lam_Max=max(lam);
%now finding the 
[L_maxim,pos]=max(Lam_Max);

%extracting the principle vector corresponding to lambda max
Pre_vect = vect(:, pos); 

%finding the slop, assuming u2=1; V1/V2 will give the const term.
slop=Pre_vect(1)/Pre_vect(2);

u2=1;
u1=(Pre_vect(2)/Pre_vect(1))*u2;

%finding correspondng y points 
for i=1:10
    y(i)=slop.*new_x(i); % where const is taken to be 0
end
plot(new_x,y)


 e=[u2 u1];
 modifieddata=(e*data_trans)'
%plot(new_x,modifieddata,'x');
hold off
