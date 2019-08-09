clc
 [a,fs1]=audioread('A.wav');
% [s,fs2]=audioread('s.wav');
% 
% %finding energy
 E1=energy(a,fs1);
 me=mean(E1);
% E2=energy(s,fs2);
% 
% %findng zero crssing
 za=zerocrossing(a,fs1);
 ma=mean(za);
% zs=zerocrossing(s,fs2);
% %  za=[za' zeros(1,length(E1)-length(za))]
% A=[E1 
%     za'];
% A=A';
% 
% S=[E2 
%     zs'];
% S=S';
% 
% meas=[A 
%     S];
% species=cell(85,1);
% for i=1:length(meas)
%     if i<=length(A)
%         species(i)=['A'];
%     else
%         species(i)=['S'];
%     end
% end
ds = dataset('XLSFile','dataset.xlsx');
C = dataset2cell(ds); 
C=C(2:length(C),:);
species=cell(C(:,1));

figure
x = cell2mat(C(:,2:3));
%[pc,score,latent,tsquare] = princomp(x);
%x=score;
% choose query point
newpoint = [4.22040000000000,44.3019000000000]
[n,d]=knnsearch(x,newpoint,'k',20);
gscatter(x(:,1),x(:,2),species)
line(newpoint(:,1),newpoint(:,2),'marker','x','color','k',...
'markersize',10,'linewidth',2)
line(x(n,1),x(n,2),'color',[.5 .5 .5],'marker','o',...
'linestyle','none','markersize',10)
set(legend,'location','best')
tb=tabulate(species(n,:))
m=cell2mat(tb(:,2))
[val,pos]=max(m)