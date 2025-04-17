
%mesh(x,y,z)
%plot3(x,y,z)
deep_model = 3
base = 2
length = 100
t = linspace(0, 6, length)
%print(t)
x = sin(t ./ (base .^ (0 / (deep_model - 1))))
y = cos(t ./ (base .^ (0 / (deep_model - 1))))
plot3(x, y, linspace(0, 0, length), markerstyle = '*')
hold on;
x = sin(t ./ (base .^ (1 / (deep_model - 1))))
y = cos(t ./ (base .^ (1 / (deep_model - 1))))
plot3(x, y, linspace(1, 1, length), markerstyle = '+')
hold on;
x = sin(t ./ (base .^ (2 / (deep_model - 1))))
y = cos(t ./ (base .^ (2 / (deep_model - 1))))
plot3(x, y, linspace(2, 2, length), markerstyle = '.')
axis tight equal
pause(100)
