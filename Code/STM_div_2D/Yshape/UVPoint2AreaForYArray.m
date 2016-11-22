function [points_in_A,points_in_B,points_in_C,points_in_D] = UVPoint2AreaForYArray(uv_point,A_area,B_area,C_area,D_area)

% 将采样点划分到四个部分中
% uv_point     uv平面采样点
% A_area       A区域

% points_in_A  第哪些点在A区域内

% uv平面点数
num = length(uv_point);
% 基本位置表格
table = 1:num;

% A区域
% 判断uv采样点是否在该区域内
in_A = inpolygon(real(uv_point),imag(uv_point),A_area(1,:),A_area(2,:));
% 获取该区域内的所有采样点的位置
points_in_A = table(in_A);


% B区域
in_B = inpolygon(real(uv_point),imag(uv_point),B_area(1,:),B_area(2,:));
points_in_B = table(in_B);


% C区域
in_C = inpolygon(real(uv_point),imag(uv_point),C_area(1,:),C_area(2,:));
points_in_C = table(in_C);


% D区域
in_D = inpolygon(real(uv_point),imag(uv_point),D_area(1,:),D_area(2,:));
points_in_D = table(in_D);
