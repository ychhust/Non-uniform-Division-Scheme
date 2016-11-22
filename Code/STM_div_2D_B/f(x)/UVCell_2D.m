function [Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,min_spacing,fill_zero)


    %ʮ������(�����м���Ԫ)
    x_len = floor((ant_num)/4);
    y_len = x_len;
    x_len=x_len+fill_zero;
    y_len=y_len+fill_zero;

    flag = 0;
    % �����ǶԳƵ�
    xaxis = -x_len:x_len;
    yaxis = -y_len:y_len;
    % ����λ��
    for p = 1:length(xaxis)
        for q =1:length(yaxis)
            flag = flag+1;
            extent_UV(flag) = xaxis(p)+j*yaxis(q);
        end
    end
    % ����λ��
    extent_UV = extent_UV*min_spacing;
    % �����ӳ��ڷֱ��ʵ�Ԫ����������Ĺ�ϵ
    % real_Fov = real(extent_UV)/x_len/2/min_spacing/min_spacing;
    % imag_Fov = imag(extent_UV)/y_len/2/min_spacing/min_spacing;
    real_Fov = real(extent_UV)/(2*x_len+1)/min_spacing/min_spacing;
    imag_Fov = imag(extent_UV)/(2*y_len+1)/min_spacing/min_spacing;
    Fov = real_Fov + j*imag_Fov;
    
    extent_UV=[real(extent_UV);imag(extent_UV)];
  
