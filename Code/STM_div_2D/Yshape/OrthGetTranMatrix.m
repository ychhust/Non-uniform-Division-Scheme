function [M,inv_M] = OrthGetTranMatrix()

% 定义坐标变换矩阵
% 新坐标由于两个相差60度的向量表示
% 与 GetTranMatrix() 中的坐标垂直

v1 = [cos(pi/3);sin(pi/3)];
v2 = [1;0];

% 变换矩阵
M = [v1 v2];
% 反变换矩阵
inv_M = inv(M);