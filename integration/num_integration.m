clc;
clear;
range = 2 * pi;
split_count = 100;
angle = 0 : range / split_count : range;
points = 4 .* cos(angle) + 6 * i * sin(angle);
points = 1000 * exp(angle * i);
plot(points, '>');
axis equal;
figure;

res = 1 ./ (points .^ 1);
res = conj(points);
plot(res, '*');
axis equal;

figure;
start_point = 0;
inte_res = [start_point];
for i=1:length(res)-1
	point = points(i+1) - points(i);
	direct = (res(i) + res(i+1))/2;
	step = point * direct;
	start_point = start_point + step;
	inte_res = [inte_res start_point];
end;
inte_res;
plot(inte_res, '<')
axis equal;