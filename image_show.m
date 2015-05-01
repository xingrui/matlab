%a=imread('test.bmp');
%return
clc
clear
src_a=imread('images/autonavi.jpg');
src_a=imread('images/test.bmp');
src_a=imread('images/test.jpg');
src_a=imread('images/small.png');
src_a=imread('images/dog.jpg');
a(:,:,1)=flipud(src_a(:,:,1));
a(:,:,2)=flipud(src_a(:,:,2));
a(:,:,3)=flipud(src_a(:,:,3));
set(0,'RecursionLimit',500);

SHOW_ORG = 1
if SHOW_ORG
figure,imshow(a);
axis xy
axis on
end

img_size = size(a);
height=img_size(1);
width=img_size(2);

diagonal_len = sqrt(height*height + width * width);
scale = 100/diagonal_len;
%define symbol function
syms x

ONE_TEST = 0

TEST_QUB = 0 %PASS
TEST_EXP = 0 %PASS
TEST_FOUR = 1 %PASS
TEST_SQUARE = 0 %PASS
TEST_FAT = 0 %PASS
TEST_INV = 1 %PASS

if TEST_QUB
% x^3
f=(x*scale).^3
transform_image(a, 0, 0, f, 2)
if ONE_TEST
return
end
end

if TEST_EXP
% exp(x)
f=exp(x*2*pi/height)
sub_process = x + i * height;
transform_image(a, 0, 0, f, 1, sub_process)
if ONE_TEST
return
end
end

if TEST_FOUR
% x^4
f=(x*scale).^4
transform_image(a, 0, 0, f, 3)
if ONE_TEST
return
end
end

if TEST_SQUARE
% x square
f=(x*scale).^2
transform_image(a, 0, 0, f)
% x square again
f=(x*scale).^2
transform_image(a, -floor(width/2), 0, f, 2)
if ONE_TEST
return
end
end

if TEST_FAT
% x + k / x
f=x+height.*height./x
transform_image(a, -floor(width/2), height/2, f, 2)
end

if TEST_INV
% x + k / x
MAX_INT=2^32-1;
f=MAX_INT*30./x
transform_image(a, -floor(width/2), -height/2, f)
end