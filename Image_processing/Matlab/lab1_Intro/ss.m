I= imread('Lenna_(test_image).png');
I1=I(1:size(I,1)/2,1:size(I,2)/2,:);
I2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);
I3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);
I4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);

subplot(2,2,1); imshow(ul);
subplot(2,2,2); imshow(ur);
subplot(2,2,3); imshow(ll);
subplot(2,2,4); imshow(lr);

% Reading input sub-images
ul = imread('Lena_Upper_Left.jpg');
ur = imread('Lena_Upper_Right.jpg');
ll= imread('Lena_Lower_Left.jpg');
lr = imread('Lena_Lower_Right.jpg');
% Initialize a image buffer for final stitched image.
[Row Col Layer] = size(ul);
Output = zeros(Row * 2, Col * 2, Layer);