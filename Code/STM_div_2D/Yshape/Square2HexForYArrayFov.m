function Fov_move = Square2HexForYArrayFov(Fov_point,tab_E,tab_F,tab_G,tab_H);

% 正方形搬移成六边形

% 初始化
Fov_move = Fov_point;
%天线数
num = sqrt(length(Fov_point));

% 搬移
% E 区域保持不变
% Fov_move(tab_E) = Fov_point(tab_E);

% F 区域 x轴 减周期
Fov_move(tab_F) = Fov_point(tab_F)- num;

% G 区域 x轴 y轴 减周期
Fov_move(tab_G) = Fov_point(tab_G)- num - num*j;

% H 区域  y轴 减周期
Fov_move(tab_H) = Fov_point(tab_H)- num*j;