clc
clear
load fisheriris
figure
x = meas(:,3:4);
% choose query point
newpoint = [5 1.45];
[n,d]=knnsearch(x,newpoint,'k',10);
gscatter(x(:,1),x(:,2),species)
line(newpoint(:,1),newpoint(:,2),'marker','x','color','k',...
'markersize',10,'linewidth',2)
line(x(n,1),x(n,2),'color',[.5 .5 .5],'marker','o',...
'linestyle','none','markersize',10)
set(legend,'location','best')
tb=tabulate(species(n,:))
m=cell2mat(tb(:,2))
[val,pos]=max(m)