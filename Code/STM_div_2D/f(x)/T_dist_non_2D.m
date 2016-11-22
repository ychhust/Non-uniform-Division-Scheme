function T_dist_pic=T_dist_non_2D(matfile,pic_scope)
%   语法：
%   T_dist_pic=T_dist_non_2D(matfile,pic_scope)
% 
%   函数功能：
%   此函数为二维场景不均匀采样点分布模块，功能为：
%   读取目标场景矩阵、目标场景分布范围信息，输出二维目标场景不均匀采样点分布信息。

    
    load(matfile);%矩阵导入
    %求取亮温过渡区域的边界
    I1 = imread('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\pic.jpg');
    BW1 = im2bw(I1, graythresh(I1));
    [B1,L1] = bwboundaries(BW1,'noholes');
    M1=cell2mat(B1);
    
    pic = abs(A+110);
    T_dist_pic = [;;;;];
    row_pix = size(pic,1);
    col_pix = size(pic,2);
    %按照目标场景矩阵的分布对l、m进行均匀划分
    row = linspace(min(imag(pic_scope)),max(imag(pic_scope)),row_pix);
    col = linspace(min(real(pic_scope)),max(real(pic_scope)),col_pix);
    figure()
    plot(M1(:,2),M1(:,1),'r', 'LineWidth', 2)
    hold on
    set(gca,'YDir','reverse')
    
    %采样间隔
    delta_r=8;
    delta_c=8;
    delta_n1=4;
    delta_n2=2;
    
    delta=1;
    start=3;
%     for pic_row = 1:delta:start
%         for pic_col = 1:delta:col_pix-1
%             %点的位置
%             if(pic_row+delta>row_pix||pic_col+delta>col_pix)
%                 delta_1=min([delta,row_pix-pic_row]);
%                 delta_2=min([delta,col_pix-pic_col]);
%                 vertex=Vertex(pic_row,pic_col,delta_1,delta_2);
%             else
%                 vertex=Vertex(pic_row,pic_col,delta,delta);%采样单元的顶点信息
%             end
%             in=Region_check(vertex(:,1),vertex(:,2),B1);
%             power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
%             T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
%             T_dist_pic = [T_dist_pic T_dist_source];
%             
%         end
%     end
    
%     for pic_row = start+delta:delta:row_pix-1
%         for pic_col = 1:delta:start
%             %点的位置
%             if(pic_row+delta>row_pix||pic_col+delta>col_pix)
%                 delta_j=min([delta,row_pix-pic_row]);
%                 delta_k=min([delta,col_pix-pic_col]);
%                 vertex=Vertex(pic_row,pic_col,delta_j,delta_k);
%             else
%                 vertex=Vertex(pic_row,pic_col,delta,delta);%采样单元的顶点信息
%             end
%             in=Region_check(vertex(:,1),vertex(:,2),B1);
%             power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%采样单元等效点的亮温
%             T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%采样单元顶点的l、m
%             T_dist_pic = [T_dist_pic T_dist_source];
%             
%         end
%     end
%     
    
     
    for pic_row=1:delta_r:row_pix-1
        for pic_col=1:delta_c:col_pix-1
            if(pic_row+delta_r>row_pix||pic_col+delta_c>col_pix)
                delta_x=min([delta_r,row_pix-pic_row]);
                delta_y=min([delta_c,col_pix-pic_col]);
                vertex_1=Vertex(pic_row,pic_col,delta_x,delta_y);%采样单元的四个顶点位置
            else
                vertex_1=Vertex(pic_row,pic_col,delta_r,delta_c);%采样单元的四个顶点位置
            end
            
            in1=Region_check(vertex_1(:,1),vertex_1(:,2),B1);%判断采样单元的四个顶点是否都在亮温过渡区域内
            if(sum(in1,2)==0)
                %采样单元不在亮温过渡区域内时等效采样点的亮温及位置信息
                T_dist_pic=Scene_power_2D(pic,vertex_1,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic);
            else
                %采样单元在亮温过渡区域内需要进行再次划分
                m_end=min([pic_row+delta_r,row_pix]);
                n_end=min([pic_col+delta_c,col_pix]);
                for m=pic_row:delta_n1:m_end-1
                    for n=pic_col:delta_n1:n_end-1
                        if(m+delta_n1>row_pix||n+delta_n1>col_pix)
                            delta_m=min([delta_n1,row_pix-m]);
                            delta_n=min([delta_n1,col_pix-n]);
                            vertex_2=Vertex(m,n,delta_m,delta_n);%小采样单元的四个顶点位置
                        else
                            vertex_2=Vertex(m,n,delta_n1,delta_n1);%小采样单元的四个顶点位置
                        end
                        
                        in2=Region_check(vertex_2(:,1),vertex_2(:,2),B1);
                        if(sum(in2,2)==0)
                            T_dist_pic=Scene_power_2D(pic,vertex_2,row,col,delta_n1,delta_n1,row_pix,col_pix,T_dist_pic);
                        else
                            j_end=min([m+delta_n1,row_pix]);
                            k_end=min([n+delta_n1,col_pix]);
                            for j=m:delta_n2:j_end-1
                                for k=n:delta_n2:k_end-1
                                    if(j+delta_n2>pic_row||k+delta_n2>col_pix)
                                        delta_j=min([delta_n2,row_pix-j]);
                                        delta_k=min([delta_n2,col_pix-k]);
                                        vertex_3=Vertex(j,k,delta_j,delta_k);%小采样单元的四个顶点位置
                                    else
                                        vertex_3=Vertex(j,k,delta_n2,delta_n2);%小采样单元的四个顶点位置
                                    end
                                    in3=Region_check(vertex_3(:,1),vertex_3(:,2),B1);
                                    T_dist_pic=Scene_power_2D(pic,vertex_3,row,col,delta_n2,delta_n2,row_pix,col_pix,T_dist_pic);
                                end
                            end
                            
                        end
                    end
                end
            end
        end
    end
    
  

    


