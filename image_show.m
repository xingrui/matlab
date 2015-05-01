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

SHOW_ORG = 1;
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

ONE_TEST = 0;

TEST_QUB = 1;%PASS
TEST_EXP = 1; %PASS
TEST_FOUR = 1; %PASS
TEST_SQUARE = 1; %PASS
TEST_FAT = 1; %PASS
TEST_INV = 1; %PASS

if TEST_QUB
% x^3
f=(x*scale).^3
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(2)];
transform_image(a, 0, 0, f, f_1)
if ONE_TEST
return
end
end

if TEST_EXP
% exp(x)
f=exp(x*2*pi/height)
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(1)+i * height];
transform_image(a, 0, 0, f, f_1)
if ONE_TEST
return
end
end

if TEST_FOUR
% x^4
f=(x*scale).^4
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(3)];
transform_image(a, 0, 0, f, f_1)
if ONE_TEST
return
end
end

if TEST_SQUARE
% x square
f=(x*scale).^2
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(2)];
transform_image(a, 0, 0, f, f_1)
% x square again
f=(x*scale).^2
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(2)];
transform_image(a, -floor(width/2), 0, f, f_1)
if ONE_TEST
return
end
end

if TEST_FAT
% x + k / x
f=x+height.*height./x
syms res;
f2 = solve(f-res);
f_1 = [f2(1) f2(2)];
transform_image(a, -floor(width/2), height/2, f, f_1)
end

if TEST_INV
% x + k / x
MAX_INT=2^32-1;
f=MAX_INT*30./x
syms res;
f2 = solve(f-res);
f_1 = f2(1);
transform_image(a, -floor(width/2), -height/2, f, f_1)
end