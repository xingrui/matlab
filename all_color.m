clear
clc
[R, G] = meshgrid(1:255, 1:255);
B = zeros(size(R));
img = zeros([255, 255, 3]);
img(:, :, 1) = R;
img(:, :, 2) = G;
img(:, :, 3) = B;
img = uint8(img);
size(img)
figure;
rs = size(img, 1); cs = size(img, 2);%get row and column count.
sz = 4;%get block size.
ch = sz; cw = sz;
t1 = 1:ch:rs;
t3 = 1:cw:cs;
[a,b] = meshgrid(t1,t3);
img(:, b, :) = 0;
img(a, :, :) = 0;
imshow(img);