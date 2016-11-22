function [uv_point,Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,ant_pos,min_spacing,fill_zero)
%   �﷨��
%   [Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,min_spacing,fill_zero)
% 
%   �������ܣ�
%   �˺���ΪUVƽ�漰�޻���ӳ�����ģ�飬����Ϊ��
%   ��ȡ������Ԫ��Ŀ����С���߼�ࡢ������Ŀ�����UVƽ�漰�޻���ӳ��ֲ���Ϣ��

    %% UVƽ��ֲ�
    
    count = 0;
    for p = 1:size(ant_pos,2)% �õ�uvƽ���Ŀɼ��ȷֲ�
        for q = 1:size(ant_pos,2)
            count = count + 1;
            uv_point(1,count) = ant_pos(1,p)-ant_pos(1,q);% ����
            uv_point(2,count)= ant_pos(2,p)-ant_pos(2,q);
        end
    end
%     uv_point= uv_point(1,:) + 1i*uv_point(2,:);
    
    %     x_len = ant_num;%��ͨy������
    x_len = floor((ant_num)/4);%ʮ������(�����м���Ԫ)�ֲ�����
    %     x_len = floor((ant_num)/3);%T������(�����м���Ԫ)�ֲ�����
    y_len = x_len;
    x_len=x_len+fill_zero;
    y_len=y_len+fill_zero;
    
    % �����ǶԳƵ�
    xaxis = -x_len:x_len;
    yaxis = -y_len:y_len;
    % ����λ��
    flag=0;
    for p = 1:length(xaxis)
        for q =1:length(yaxis)
            flag = flag+1;
            extent_UV(flag) = xaxis(p)+j*yaxis(q);%UVƽ��ֲ�
        end
    end
    % ����λ��
    extent_UV = extent_UV*min_spacing;
    % �����ӳ��ڷֱ��ʵ�Ԫ����������Ĺ�ϵ������ֵ�����޻���ӳ���Χ
    real_Fov = real(extent_UV)/(2*x_len+1)/min_spacing/min_spacing;
    imag_Fov = imag(extent_UV)/(2*y_len+1)/min_spacing/min_spacing;
    Fov = -real_Fov -j*imag_Fov;
    
%     extent_UV=[real(extent_UV);imag(extent_UV)];
    

    
  
