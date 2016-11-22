function T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n)
%   语法：
%   T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n)
% 
%   函数功能：
%   此函数为二维场景采样点分布模块，功能为：
%   读取目标场景、UV平面分布、采样间隔信息，输出二维目标场景采样点分布信息。

    load(matfile);%矩阵导入
    pic = abs(A+110);
    T_dist_pic = [;;;;];
    row_pix = size(pic,1);
    col_pix = size(pic,2);
    %按照目标场景矩阵的分布对l、m进行均匀划分
    row = linspace(min(imag(pic_scope)),max(imag(pic_scope)),row_pix);
    col = linspace(min(real(pic_scope)),max(real(pic_scope)),col_pix);
%     delta=2;
%     delta=min([delta,delta_n]);
%     
%     for pic_row = 1:delta:3
%         for pic_col = 1:delta:col_pix-1
%             %点的位置
%             if(pic_row+delta>row_pix||pic_col+delta>col_pix)
%                 delta_x=min([delta,row_pix-pic_row]);
%                 delta_y=min([delta,col_pix-pic_col]);
%                 vertex=Vertex(pic_row,pic_col,delta_x,delta_y);
%             else
%                 vertex=Vertex(pic_row,pic_col,delta,delta);%采样单元的顶点信息
%             end
%             power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
%             T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
%             T_dist_pic = [T_dist_pic T_dist_source];
%             
%         end
%     end
%     
%     for pic_row = 3+delta:delta:row_pix-1
%         for pic_col = 1:delta:3
%             %点的位置
%             if(pic_row+delta>row_pix||pic_col+delta>col_pix)
%                 delta_j=min([delta,row_pix-pic_row]);
%                 delta_k=min([delta,col_pix-pic_col]);
%                 vertex=Vertex(pic_row,pic_col,delta_j,delta_k);
%             else
%                 vertex=Vertex(pic_row,pic_col,delta,delta);%采样单元的顶点信息
%             end
%             power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
%             T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
%             T_dist_pic = [T_dist_pic T_dist_source];
%             
%         end
%     end
%     
    
    for pic_row = 1:delta_n:row_pix-1
        for pic_col = 1:delta_n:col_pix-1
            %点的位置
            if(pic_row+delta_n>row_pix||pic_col+delta_n>col_pix)
                delta_r=min([delta_n,row_pix-pic_row]);
                delta_c=min([delta_n,col_pix-pic_col]);
                vertex=Vertex(pic_row,pic_col,delta_r,delta_c);
            else
                vertex=Vertex(pic_row,pic_col,delta_n,delta_n);%采样单元的顶点信息
            end
            pic_point = col(round(sum(vertex(:,2))/4))+j*row(row_pix-round(sum(vertex(:,1))/4)+1);
          %% 方法一：直接求取l、m信息
%             if (abs(pic_point/90)<=1)
%                 power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%采样单元等效点的亮温
%                 power = power/row_pix/col_pix*delta_n*delta_n;
%                 T_dist_source=[power;real(pic_point);imag(pic_point)];%采样单元等效点的亮温、l、m
%                 T_dist_pic = [T_dist_pic T_dist_source];
%             end
            %% 方法二：通过l、m求取theta、phy
%             if (abs(pic_point/90)<=1)
% %                 power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%采样单元等效点的亮温
%                 power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
% %                 power=pic(pic_row,pic_col);
%                 power = power/row_pix/col_pix*delta_n*delta_n;
%                 theta = asind(abs(pic_point));
%                 phy = angle(pic_point)*180/pi;
%                 T_dist_source = [power;theta;phy];%采样单元等效点的亮温、theta、phy
%                 T_dist_pic = [T_dist_pic T_dist_source];
%             end
            %% 方法三：通过l、m求取可见度实部
                power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
                T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
                T_dist_pic = [T_dist_pic T_dist_source];

        end
    end

