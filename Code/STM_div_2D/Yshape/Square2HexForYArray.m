function uv_move = Square2HexForYArray(uv_point,tab_A,tab_B,tab_C,tab_D);

% 正方形搬移成六边形
% 与Hex2SquareForYArray互为反变换的图形划分函数


% 初始化
uv_move = uv_point;
%天线数
num = sqrt(length(uv_point));

% 搬移
% A 区域保持不变
% uv_move(tab_A) = uv_point(tab_A);

% B 区域 x轴 减周期
uv_move(tab_B) = uv_point(tab_B)- num;

% C 区域 x轴 y轴 减周期
uv_move(tab_C) = uv_point(tab_C)- num - num*j;

% D 区域  y轴 减周期
uv_move(tab_D) = uv_point(tab_D)- num*j;
