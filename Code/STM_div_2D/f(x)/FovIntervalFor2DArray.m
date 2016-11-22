function interval = FovIntervalFor2DArray(min_spacing,x_len,y_len)

% 获得Y阵视场范围像素点所围成的六边形，用复数表示

% 边长
r_x = 1/2/min_spacing/(2*x_len);
r_y = 1/2/min_spacing/(2*y_len);

% 得到以0为中心的六边形顶点
interval = [r_x r_x -r_x -r_x] + j*[r_y -r_y -r_y r_y];