% 序列长度
base_num = 10
sequence_length = round(base_num * pi * 2);
% 位置编码维度
d_model = 1024;

% 初始化位置编码矩阵
positional_encoding = zeros(sequence_length, d_model);

% 生成位置编码
for pos = 1:sequence_length
    for i = 1:floor(d_model / 2)
        denominator = power(base_num, (2 * (i - 1)) / d_model);
        positional_encoding(pos, 2 * i - 1) = sin((pos-1) / denominator);
        positional_encoding(pos, 2 * i) = cos((pos-1) / denominator);
    end
end

% 可视化位置编码
positional_encoding(1, 2:2:50)
surf(positional_encoding(1:2, 2:2:end));
surf(positional_encoding(:, 1:2:end));
% surf(positional_encoding(:, 1:2:end));
%imagesc(positional_encoding);
colorbar;
xlabel('Position Encoding Dimension');
ylabel('Position in Sequence');
title('Positional Encoding Visualization');
pause(100)
