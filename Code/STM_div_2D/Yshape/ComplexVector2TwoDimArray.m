function y = ComplexVector2TwoDimArray(x)

% 将n*2的矩阵转化为n*1的复数向量
% 矩阵第一行表示复数的实部，第二行表示复数的虚部
% 反函数 y = TwoDimArray2ComplexVector(x)

y = [real(x) ; imag(x)];