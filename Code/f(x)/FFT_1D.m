function T=FFT_1D(visibility,x_len,fill_zero)
x_len_raw= x_len + fill_zero; % ������������ 
T = fftshift(ifft(ifftshift(visibility)));%%һά����Ҷ�任
T = real(T);% ȡͼ��ʵ��
T= T*x_len/x_len_raw;% �������������