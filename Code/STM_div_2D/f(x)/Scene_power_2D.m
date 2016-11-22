function T_dist_pic=Scene_power_2D(pic,vertex,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic)
%   语法：
%   T_dist_pic=Scene_power_2D(pic,vertex,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic)
% 
%   函数功能：
%   此函数为二维场景不均匀采样点亮温模块，功能为：
%   读取目标场景、采样单元顶点、采样间隔信息，输出二维场景不均匀采样点亮温及分布信息。

    
    pic_point = col(round(sum(vertex(:,2))/4))+j*row(row_pix-round(sum(vertex(:,1))/4)+1);
%     pic_point = col(sum(vertex(:,2))/4)+j*row(row_pix-sum(vertex(:,1))/4+1);
%     pic_point = sum(col(vertex(1,2))+col(vertex(2,2))+col(vertex(3,2))+col(vertex(4,2)))/4+j*sum(row(row_pix-vertex(1,1))+row(row_pix-vertex(2,1))+row(row_pix-vertex(3,1))+row(row_pix-vertex(4,1)))/4;
    %% 方法一：直接求取l、m信息
%     if (abs(pic_point/90)<=1)
%         power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%采样单元等效点的亮温
%         power = power/row_pix/col_pix*delta_c*delta_r;
%         T_dist_source = [power;real(pic_point);imag(pic_point)];%采样单元等效点的亮温、l、m
%         T_dist_pic = [T_dist_pic T_dist_source];
%         
%     end


    %% 方法二：通过l、m求取theta、phy
%     if (abs(pic_point/90)<=1)
%         power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%采样单元等效点的亮温
%         power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
%         power = power/row_pix/col_pix*delta_c*delta_r;
%         theta = asind(abs(pic_point));
%         phy = angle(pic_point)*180/pi;
%         T_dist_source = [power;theta;phy];%采样单元等效点的亮温、theta、phy
%         T_dist_pic = [T_dist_pic T_dist_source];
%     end
    %% 方法三：通过l、m求取可见度函数实部
        power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
        T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
        T_dist_pic = [T_dist_pic T_dist_source];
