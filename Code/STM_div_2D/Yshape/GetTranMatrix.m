function [M,inv_M] = GetTranMatrix()

% 定义坐标变换矩阵
% 新坐标由于两个相差120度的向量表示
% 与 OrthGetTranMatrix() 中的坐标垂直

v1 = [cos(pi/6);-sin(pi/6)];
v2 = [0;1];

% 变换矩阵
M = [v1 v2];
% 反变换矩阵
inv_M = inv(M);