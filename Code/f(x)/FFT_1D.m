function T=FFT_1D(visibility,x_len,fill_zero)
x_len_raw= x_len + fill_zero; % 补零后的天线数 
T = fftshift(ifft(ifftshift(visibility)));%%一维傅里叶变换
T = real(T);% 取图像实部
T= T*x_len/x_len_raw;% 补偿补零的能量