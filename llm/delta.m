% 信息来自 https://juejin.cn/post/7241859817563258917

% 定义不同的维度d
d_values = [16, 32, 64, 96, 128];
% 定义Δt的范围，对应文中的k
delta_t = -1000:1000;
num_delta_t = length(delta_t);
num_d = length(d_values);
% 预分配存储点积结果的矩阵
dot_product_results = zeros(num_delta_t, num_d);

% 计算不同维度下，不同Δt对应的位置向量点积
for i = 1:num_d
    d = d_values(i);
    for j = 1:num_delta_t
        sum_dot_product = 0;
        for k = 0:(d/2 - 1)
            omega_k = 1 / 10000^(2*k/d);
            sum_dot_product = sum_dot_product + cos(omega_k * delta_t(j));
        end
        dot_product_results(j, i) = sum_dot_product;
    end
end

% 绘图
figure;
hold on;
for i = 1:num_d
    plot(delta_t, dot_product_results(:, i), 'DisplayName', ['d = ', num2str(d_values(i))]);
end
xlabel('Δt (k)');
ylabel('点积结果');
title('不同维度下位置向量点积与Δt的关系');
legend;
hold off;
pause(100)
