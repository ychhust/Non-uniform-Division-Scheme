function [uv_point,Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,ant_pos,min_spacing,fill_zero)
%   语法：
%   [Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,min_spacing,fill_zero)
% 
%   函数功能：
%   此函数为UV平面及无混叠视场定义模块，功能为：
%   读取天线阵元数目、最小天线间距、补零数目，输出UV平面及无混叠视场分布信息。

    %% UV平面分布
    
    count = 0;
    for p = 1:size(ant_pos,2)% 得到uv平面点的可见度分布
        for q = 1:size(ant_pos,2)
            count = count + 1;
            uv_point(1,count) = ant_pos(1,p)-ant_pos(1,q);% 基线
            uv_point(2,count)= ant_pos(2,p)-ant_pos(2,q);
        end
    end
%     uv_point= uv_point(1,:) + 1i*uv_point(2,:);
    
    %     x_len = ant_num;%普通y型阵列
    x_len = floor((ant_num)/4);%十字型阵(不含中间阵元)分布坐标
    %     x_len = floor((ant_num)/3);%T字型阵(不含中间阵元)分布坐标
    y_len = x_len;
    x_len=x_len+fill_zero;
    y_len=y_len+fill_zero;
    
    % 基线是对称的
    xaxis = -x_len:x_len;
    yaxis = -y_len:y_len;
    % 基线位置
    flag=0;
    for p = 1:length(xaxis)
        for q =1:length(yaxis)
            flag = flag+1;
            extent_UV(flag) = xaxis(p)+j*yaxis(q);%UV平面分布
        end
    end
    % 绝对位置
    extent_UV = extent_UV*min_spacing;
    % 计算视场内分辨率单元点与网格点间的关系，其最值表征无混叠视场范围
    real_Fov = real(extent_UV)/(2*x_len+1)/min_spacing/min_spacing;
    imag_Fov = imag(extent_UV)/(2*y_len+1)/min_spacing/min_spacing;
    Fov = -real_Fov -j*imag_Fov;
    
%     extent_UV=[real(extent_UV);imag(extent_UV)];
    

    
  
