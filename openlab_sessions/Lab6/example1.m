load fisheriris
x = meas(:,1:2);
gscatter(x(:,1),x(:,2),species,[], [], [], 'on', 'x', 'y')
% legend('Location','best')
title('normal Iris data'), grid on
figure
[pc,score,latent,tsquare] = princomp(meas);
gscatter(score(:,1), score(:,2), species, [], [], [], 'on', 'PC1', 'PC2')
title('Projected Iris data'), grid on