clc;
clear;
range = 2 * pi;
split_count = 20;
angle = 0 : range / split_count : range;
points = 4 .* cos(angle) + 6 * i * sin(angle);
points = 10 * exp(angle * i);
hold on;
step = points(2:end) - points(1:end -1);
start_point = points(1:end - 1);
quiver(real(start_point),imag(start_point),real(step),imag(step),0);
%plot(points, '>');
axis equal;
figure;

res = conj(points);
m = -0.2;
n = m + 1;
points .^ n;
res = 1 ./ (points .^ n);
step = res(2:end) - res(1:end -1);
start_point = res(1:end - 1);
quiver(real(start_point),imag(start_point),real(step),imag(step),0);
%plot(res);
axis equal;

figure;
start_point = 0;
inte_res = [start_point];
hold on;
for i=1:length(res)-1
	point = points(i+1) - points(i);
	direct = (res(i) + res(i+1))/2;
	step = point * direct;
	start_point = start_point + step;
	inte_res = [inte_res start_point];
	quiver(real(start_point),imag(start_point),real(step),imag(step),0);
end;
inte_res;
%plot(inte_res, '<')
%plot(inte_res)
axis equal;