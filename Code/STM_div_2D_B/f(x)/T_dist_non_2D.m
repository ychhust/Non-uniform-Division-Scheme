function T_dist_pic=T_dist_non_2D(matfile,pic_scope)

    %矩阵导入
    load(matfile);
    I1 = imread('pic.jpg');
    BW1 = im2bw(I1, graythresh(I1));
    [B1,L1] = bwboundaries(BW1,'noholes');
    M1=cell2mat(B1);
        
%     pic = abs(A);
    pic = abs(pic);
    T_dist_pic = [;;];
    row_pix = size(pic,1);
    col_pix = size(pic,2);
    row = linspace(pic_scope(1,1),pic_scope(1,2),row_pix);
    col = linspace(pic_scope(2,1),pic_scope(2,2),col_pix);
    plot(M1(:,2),M1(:,1),'b', 'LineWidth', 2)
    hold on
    
    delta_r=8;
    delta_c=8;
    delta_n=2;
%     vertex_1=zeros(4,2);
%     vertex_2=zeros(4,2);
    for pic_col=1:delta_c:col_pix-delta_c
        for pic_row=1:delta_r:row_pix-delta_r
            vertex_1=Vertex(pic_row,pic_col,delta_r,delta_c);
            in1=Region_check(vertex_1(:,1),vertex_1(:,2),M1);
            if(sum(in1,2)==0)
                T_dist_pic=Scene_power_2D(pic,vertex_1,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic);
            else
                for m=pic_row:delta_n:pic_row+delta_r-delta_n
                    for n=pic_col:delta_n:pic_col+delta_c-delta_n
                        vertex_2=Vertex(m,n,delta_n,delta_n);
                        in2=Region_check(vertex_2(:,1),vertex_2(:,2),M1);
%                         if(sum(in2,2)>0)
                            
                            T_dist_pic=Scene_power_2D(pic,vertex_2,row,col,delta_n,delta_n,row_pix,col_pix,T_dist_pic);
%                         end
                        
                    end
                end
               
            end
        end
    end
    
  

    
%     for pic_row = 1:delta_n:length(row)
%         for pic_col = 1:delta_n:length(col)
%             %点的位置
%             pic_point = col(pic_col)+j*row(pic_row);
%             if (abs(pic_point/90)<=1)
%                 power = pic(row_pix-pic_row+1,pic_col)/row_pix/col_pix;
%                 theta = abs(pic_point);
%                 phy = angle(pic_point)*180/pi;
%                 T_dist_source = [power;theta;phy];
%                 T_dist_pic = [T_dist_pic T_dist_source];
%             end
%         end
%     end
