function [s] = transform_image(src_img, x_offset, y_offset, f, inv_functions)
DEBUG = 1;
SHOW_OLD = 1;
if nargin < 5;error('param can not less than four');end
MAX_DEST_IMAGE_EDGE_LEN = 500;

%x positive direction is right.
%y positive direction is top.
%init variables

%two point indexes.
%1. index of the point in the image which likes [1:pic_width]
%2. real axis location of the point in coordinate.

src_img_size = size(src_img);
src_img_height = src_img_size(1);
src_img_width = src_img_size(2);

% clean one point for simplify processing:
% need not write particular logic for value not in f(x).
% but just set these value org index to [1 1]
src_img(1,1,1)=0;
src_img(1,1,2)=0;
src_img(1,1,3)=0;

src_x_axis=x_offset:src_img_width+x_offset - 1;
src_y_axis=y_offset:src_img_height+y_offset - 1;
[X,Y]=meshgrid(src_x_axis,src_y_axis);
src_axis=X+i*Y;

[dest_of_src_axis, border] = get_dest_image_axis(f, src_axis);
left_border = border(1);
bottom_border = border(2);
right_border = border(3);
top_border = border(4);

%calculate scale rate
distance_i=right_border-left_border;
distance_j=top_border-bottom_border;
max_distance = distance_i;
if distance_j > max_distance
   max_distance = distance_j;
end

rate = max_distance / MAX_DEST_IMAGE_EDGE_LEN;
dest_img_width=ceil(distance_i/rate);
dest_img_height=ceil(distance_j/rate);
dest_img_size = [dest_img_height dest_img_width];
dest_x_index = 1:dest_img_width;
dest_y_index = 1:dest_img_height;
[X,Y]=meshgrid(dest_x_index, dest_y_index);
dest_axis=(X+i*Y).*rate+left_border+i*bottom_border;
dest_image = zeros([dest_img_height dest_img_width 3]);

inv_f_size = prod(size(inv_functions));

for inv_index = 1 : inv_f_size
inv_fun = inv_functions(inv_index);
dest_image2 = get_dest_image_data(dest_axis, inv_fun, x_offset, y_offset, src_img);
dest_image = dest_image + double(dest_image2);
end

dest_image = uint8(dest_image);

figure('NumberTitle', 'off', 'Name', char(f));
imshow(dest_image);
axis xy
axis on

if SHOW_OLD
dest_image_old = get_dest_image_data_old(src_img, dest_img_size, dest_of_src_axis, border, rate);
figure('NumberTitle', 'off', 'Name', char(f));
imshow(dest_image_old);
axis xy
axis on
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[dest_image] = get_dest_image_data_old(src_img, dest_img_size, dest_of_src_axis, border, rate)
dest_image=zeros([dest_img_size 3]);
dest_img_height = dest_img_size(1);
dest_img_width = dest_img_size(2);
R=src_img(:,:,1);
G=src_img(:,:,2);
B=src_img(:,:,3);

src_img_size = size(src_img);
src_img_height = src_img_size(1);
src_img_width = src_img_size(2);

imag_part = imag(dest_of_src_axis);
real_part = real(dest_of_src_axis);

left_border = border(1);
bottom_border = border(2);

X=floor((imag_part-bottom_border)/rate);
Y=floor((real_part-left_border)/rate);

X(find(X<=0))=1;
Y(find(Y<=0))=1;
X(find(X>dest_img_height))=1;
Y(find(Y>dest_img_width))=1;
org_size=size(X);
R_index=ones(org_size);
G_index=ones(org_size)*2;
B_index=ones(org_size)*3;

index=sub2ind([dest_img_size 3], [X X X], [Y Y Y], [R_index, G_index, B_index]);
org_index = reshape(1:prod(src_img_size), src_img_size);
dest_image(index) = src_img(org_index);

dest_image=uint8(dest_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[dest_of_src_axis, border] = get_dest_image_axis(f, src_axis)
MAX_INT=2^32-1;
MIN_INT=-2^32+1;
dest_of_src_axis = subs(f, src_axis + eps);
real_part = real(dest_of_src_axis);
imag_part = imag(dest_of_src_axis);
imag_part(find(isnan(imag_part))) = 0;
real_part(find(isnan(real_part))) = 0;
imag_part(find(imag_part == Inf)) = 0;
real_part(find(real_part == Inf)) = 0;
imag_part(find(imag_part == -Inf)) = 0;
real_part(find(real_part == -Inf)) = 0;
dest_of_src_axis = real_part + i * imag_part;
border = [min(real_part(:)) min(imag_part(:)) max(real_part(:)) max(imag_part(:))];
border(find(border < MIN_INT)) = MIN_INT;
border(find(border > MAX_INT)) = MAX_INT;
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[dest_image] = get_dest_image_data(dest_axis, f_1, x_offset, y_offset, src_img)
src_img_size = size(src_img);
src_img_height = src_img_size(1);
src_img_width = src_img_size(2);
org_Z=subs(f_1, dest_axis + eps)-x_offset-i*y_offset + 1 + i;
org_x=round(imag(org_Z));
org_y=round(real(org_Z));

org_x_bak=org_x;
org_y_bak=org_y;

org_x(find(org_x_bak<1)) = 1;
org_x(find(org_x_bak>src_img_height)) = 1;
org_y(find(org_y_bak<1)) = 1;
org_y(find(org_y_bak>src_img_width)) = 1;
org_y(find(org_x_bak<1)) = 1;
org_y(find(org_x_bak>src_img_height)) = 1;
org_x(find(org_y_bak<1)) = 1;
org_x(find(org_y_bak>src_img_width)) = 1;

org_size=size(org_x);
size(org_y);
size(src_img);
R_index=ones(org_size);
G_index=ones(org_size)*2;
B_index=ones(org_size)*3;

index=sub2ind(size(src_img), [org_x org_x org_x], [org_y org_y org_y], [R_index G_index B_index]);

dest_image=src_img(index);
dest_image=reshape(dest_image, org_size(1), org_size(2), 3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
