function T_dist_pic=T_dist_2D(matfile,pic_scope,delta_r,delta_c)
%������
%     load(matfile);
% %     pic = abs(A);
%     pic = abs(pic);
% %     T_dist_pic = [;;];
%     T_dist_pic = [;;];
% %     power=[];
%     row_pix = size(pic,1);
%     col_pix = size(pic,2);
%     row = linspace(pic_scope(1,1),pic_scope(1,2),row_pix);
%     col = linspace(pic_scope(2,1),pic_scope(2,2),col_pix);

    load(matfile);%������
    pic = abs(pic);
    T_dist_pic = [;;];
    row_pix = size(pic,1);
    col_pix = size(pic,2);
    %����Ŀ�곡������ķֲ���l��m���о��Ȼ���
    row = linspace(min(imag(pic_scope)),max(imag(pic_scope)),row_pix);
    col = linspace(min(real(pic_scope)),max(real(pic_scope)),col_pix);

    
    for pic_row = 1:delta_r:length(row)-delta_r
        for pic_col = 1:delta_c:length(col)-delta_c
            %���λ��
            %                 pic_point = col(pic_col)+j*row(pic_row);
            vertex=Vertex(pic_row,pic_col,delta_r,delta_c);
            %             pic_point = col(round(sum(vertex(:,2))/4))+j*row(round(sum(vertex(:,1))/4));
            pic_point = col(round(sum(vertex(:,2))/4))+j*row(row_pix-round(sum(vertex(:,1))/4)+1);%������Ԫ��Ч���λ��
            %% ��l��m���ɼ���
            
            if (abs(pic_point/90)<=1)
                power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%������Ԫ��Ч�������
                power = power/row_pix/col_pix*delta_r*delta_c;
                T_dist_source=[power;real(pic_point);imag(pic_point)];%������Ԫ��Ч������¡�l��m
                T_dist_pic = [T_dist_pic T_dist_source];
            end
            %% ֱ���ɽǶȼ���ɼ���
            
            %             if (abs(pic_point/90)<=1)
            %
            %                 power=pic(row_pix-round(sum(vertex(:,1))/4)+1,round(sum(vertex(:,2))/4));
            %                 power = power/row_pix/col_pix*delta_n*delta_n;
% %                      power = delta_n*delta_n*pic(row_pix-pic_row+1,pic_col)/row_pix/col_pix;
%                 theta = abs(pic_point);
%                 phy = angle(pic_point)*180/pi;
%                 T_dist_source = [power;theta;phy];
% 
%                 T_dist_pic = [T_dist_pic T_dist_source];
            end
        end
    end




