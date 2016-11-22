function interval = FovIntervalForY(ant_num,min_spacing)

% 获得Y阵视场范围像素点所围成的六边形，用复数表示

% 半径
% r = 1/sqrt(3)/ant_num/min_spacing;
r = 2/3/ant_num/min_spacing;
% 角度
angle = pi/6:pi/3:11*pi/6;
% 得到以0为中心的六边形顶点
interval = r*exp(j*angle);
