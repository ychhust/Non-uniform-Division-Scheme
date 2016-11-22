function  T = HFFT(visibility)

% 快速六边形傅立叶变换
% visibility 可见度
% T          亮温

% 天线个数
ant_num = sqrt(length(visibility));

% 可见度向量转化为方阵
visibility_matrix = reshape(visibility,ant_num,ant_num);

% 二维快速傅立叶变换
T_matrix = real(ifft2(visibility_matrix));

% 方阵转化为向量
T = reshape(T_matrix,ant_num*ant_num,1);
% T=T_matrix;