function [s] = transform_image(src_img, x_offset, y_offset, f)
%x positive direction is right.
%y positive direction is top.
%init variables

%two point indexes.
%1. index of the point in the image which likes [1:pic_width]
%2. real axis location of the point in coordinate.

src_img_size = size(src_img);
src_img_height = src_img_size(1)
src_img_width = src_img_size(2)

R=src_img(:,:,1);
G=src_img(:,:,2);
B=src_img(:,:,3);

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
left_border = border(1)
bottom_border = border(2)
right_border = border(3)
top_border = border(4)

%calculate scale rate
distance_i=right_border-left_border
distance_j=top_border-bottom_border
max_distance = distance_i;
if distance_j > max_distance
   max_distance = distance_j;
end

syms res
f_2 = solve(f-res)
f_1 = finverse(f)

rate = max_distance / 400
dest_img_width=ceil(distance_i/rate)
dest_img_height=ceil(distance_j/rate)
dest_img_size = [dest_img_width dest_img_height]
dest_x_index = 1:dest_img_width;
dest_y_index = 1:dest_img_height;
[X,Y]=meshgrid(dest_x_index, dest_y_index);
dest_axis=(X+i*Y).*rate+left_border+i*bottom_border;
dest_image1 = get_dest_image_data(dest_axis, f_1, x_offset, y_offset, src_img);
dest_image2 = get_dest_image_data(dest_axis, f_1 * exp(i*pi/2), x_offset, y_offset, src_img);

dest_image = uint8(double(dest_image1) + double(dest_image2));
size(dest_image)

figure,imshow(dest_image);
axis xy
axis on
show_image_old(src_img, dest_axis,bottom_border,left_border,R,G,B,rate, src_img_height, src_img_width);
return
function[] = show_image_old(src_img, dest_img_size, ,dest_img_width,imag_part, real_part,bottom_border,left_border,R,G,B,rate, src_img_height, src_img_width)
dest_image=zeros(dest_img_height,dest_img_width,3);
for i1 = 1:src_img_height
   for j1 = 1:src_img_width
      % use this method to implement continue logic.
      for MAGIC_NUM=1:1
         %z1 = Z(i1, j1);
         x = imag_part(i1, j1) - bottom_border;
         y = real_part(i1, j1) - left_border;
         dest_x = floor(x / rate);
         dest_y = floor(y / rate);
         if dest_x < 1
            break
         end
         if dest_y < 1
            break
         end
         if dest_x > dest_img_height
            break
         end
         if dest_y > dest_img_width
            break
         end
         dest_image(dest_x, dest_y, 1) = R(i1, j1);
         dest_image(dest_x, dest_y, 2) = G(i1, j1);
         dest_image(dest_x, dest_y, 3) = B(i1, j1);
      end
   end
end
dest_image=uint8(dest_image);
figure,imshow(dest_image);
axis xy
axis on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[dest_of_src_axis, border] = get_dest_image_axis(f, src_axis)
MAX_INT=2^32-1;
MIN_INT=-2^32+1;
dest_of_src_axis = subs(f, src_axis);
real_part = real(dest_of_src_axis);
imag_part = imag(dest_of_src_axis);
border = [min(min(real_part)) min(min(imag_part)) max(max(real_part)) max(max(imag_part))];
border(find(border < MIN_INT)) = MIN_INT;
border(find(border > MAX_INT)) = MAX_INT;
return

function[dest_image] = get_dest_image_data(dest_axis, f_1, x_offset, y_offset, src_img)
src_img_size = size(src_img);
src_img_height = src_img_size(1);
src_img_width = src_img_size(2);
org_Z=subs(f_1, dest_axis)-x_offset-i*y_offset + 1 + i;
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

max(max(org_x))
min(min(org_x))
max(max(org_y))
min(min(org_y))

org_size=size(org_x)
size(org_y)
size(src_img)
R_index=ones(org_size);
G_index=ones(org_size)*2;
B_index=ones(org_size)*3;

index=sub2ind(size(src_img), [org_x org_x org_x], [org_y org_y org_y], [R_index G_index B_index]);

dest_image=src_img(index);
dest_image=reshape(dest_image, org_size(1), org_size(2), 3);
return

%*************************************************
%*************************************************
%*************************************************
%*************************************************
%*************************************************
%*************************************************
%*************************************************
function[] = grid_insert_value()
DEST_X = floor((real_part - left_border)/rate);
DEST_Y = floor((imag_part - bottom_border)/rate);
DEST_R = double(R)/255;
DEST_G = double(G)/255;
DEST_B = double(B)/255;
size(DEST_X)
size(DEST_Y)
size(DEST_R)
size(DEST_G)
size(DEST_B)



x_data=[]
y_data=[]
r_data=[]
g_data=[]
b_data=[]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%DEBUG%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Z=griddata(x_data, y_data, r_data, (1:dest_img_width)', 1:dest_img_height, 'v4');
return
%griddata(DEST_X, DEST_Y, DEST_R, (1:1)', 1:1);
Z=griddata(DEST_X(:), DEST_Y(:), DEST_R(:), (1:dest_img_width)', 1:dest_img_height, 'v4');
return
size(Z)
Z(find(isnan(Z)==1)) = 0;
Z(find(Z>1)) = 1;
Z(find(Z<0)) = 0;
dest_image(:,:,1) = Z;

Z=griddata(DEST_X, DEST_Y, DEST_G, (1:dest_img_width)', 1:dest_img_height);
Z(find(isnan(Z)==1)) = 0;
Z(find(Z>1)) = 1;
Z(find(Z<0)) = 0;
dest_image(:,:,2) = Z;

Z=griddata(DEST_X, DEST_Y, DEST_B, (1:dest_img_width)', 1:dest_img_height);
Z(find(isnan(Z)==1)) = 0;
Z(find(Z>1)) = 1;
Z(find(Z<0)) = 0;
dest_image(:,:,3)=Z;

figure,imshow(dest_image);
axis xy
axis on

function[] =inner_test()
return