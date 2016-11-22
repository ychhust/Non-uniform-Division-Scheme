function position = FindZero(x)

% 寻找向量里接近0的数

position = [];
% 用于比较的小数
small_num = 10^(-2);

for k = 1:length(x)
    if abs(x(k)) < small_num
        position = k;
    end
end