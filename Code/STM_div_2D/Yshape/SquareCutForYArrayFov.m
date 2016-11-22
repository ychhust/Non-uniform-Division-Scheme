function [E_area,F_area,G_area,H_area] = SquareCutForYArrayFov(num)

% 分割正方形区域成四个部分(视场范围)
% 与HexCutForYArrayFov互为反变换的图形划分函数

% 划分说明见文档《划分方式图示》

% 定义一个小数
s = 10^(-2)/num;

% 正方形分割点
p1 = [0;0]  -  [s;s];
p2 = [1/2;0] - [0;s]; 
p3 = [1;0]  +  [s;-s];
p4 = [1/3;1/3];
p5 = [0;1/2] - [s;0];
p6 = [1;1/2] + [s;0];
p7 = [2/3;2/3];
p8 = [0;1]  + [-s;s];
p9 = [1/2;1] + [0;s]; 
p10 = [1;1] +  [s;s];

% 区域A
% 区域A的多边形由下列坐标点围成
E_area = [p1 p2 p4 p5 p1] * (num-1);
% 区域B
F_area = [p2 p3 p6 p7 p4 p2] * (num-1);
% 区域C
G_area = [p7 p6 p10 p9 p7] * (num-1);
% 区域D
H_area = [p5 p4 p7 p9 p8 p5] * (num-1);