function y = TwoDimArray2ComplexVector(x)

% 将n*1的复数向量转化为n*2的矩阵
% 矩阵第一行表示复数的实部，第二行表示复数的虚部
% 反函数 y = ComplexVector2TwoDimArray(x)

y = x(1,:) + j*x(2,:);