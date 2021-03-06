function T = FFT2D(visibility,x_len,y_len)

% 快速二维傅立叶变换
% visibility 可见度
% T          亮温


% 可见度向量转化为方阵
visibility_matrix = reshape(visibility,2*x_len+1,2*y_len+1);

% 二维傅里叶变化
% 傅里叶反演得到图像
T_matrix = real(ifft2(ifftshift(visibility_matrix)));
% 图像搬移
T_matrix = fftshift(T_matrix);

% 方阵转化为向量
% T = reshape(T_matrix,(2*x_len+1)*(2*y_len+1),1);
T=T_matrix;