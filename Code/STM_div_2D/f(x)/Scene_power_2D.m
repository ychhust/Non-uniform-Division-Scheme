function T_dist_pic=Scene_power_2D(pic,vertex,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic)
%   �﷨��
%   T_dist_pic=Scene_power_2D(pic,vertex,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic)
% 
%   �������ܣ�
%   �˺���Ϊ��ά���������Ȳ���������ģ�飬����Ϊ��
%   ��ȡĿ�곡����������Ԫ���㡢���������Ϣ�������ά���������Ȳ��������¼��ֲ���Ϣ��

    
    pic_point = col(round(sum(vertex(:,2))/4))+j*row(row_pix-round(sum(vertex(:,1))/4)+1);
%     pic_point = col(sum(vertex(:,2))/4)+j*row(row_pix-sum(vertex(:,1))/4+1);
%     pic_point = sum(col(vertex(1,2))+col(vertex(2,2))+col(vertex(3,2))+col(vertex(4,2)))/4+j*sum(row(row_pix-vertex(1,1))+row(row_pix-vertex(2,1))+row(row_pix-vertex(3,1))+row(row_pix-vertex(4,1)))/4;
    %% ����һ��ֱ����ȡl��m��Ϣ
%     if (abs(pic_point/90)<=1)
%         power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%������Ԫ��Ч�������
%         power = power/row_pix/col_pix*delta_c*delta_r;
%         T_dist_source = [power;real(pic_point);imag(pic_point)];%������Ԫ��Ч������¡�l��m
%         T_dist_pic = [T_dist_pic T_dist_source];
%         
%     end


    %% ��������ͨ��l��m��ȡtheta��phy
%     if (abs(pic_point/90)<=1)
%         power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));%������Ԫ��Ч�������
%         power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%������Ԫ��Ч�������
%         power = power/row_pix/col_pix*delta_c*delta_r;
%         theta = asind(abs(pic_point));
%         phy = angle(pic_point)*180/pi;
%         T_dist_source = [power;theta;phy];%������Ԫ��Ч������¡�theta��phy
%         T_dist_pic = [T_dist_pic T_dist_source];
%     end
    %% ��������ͨ��l��m��ȡ�ɼ��Ⱥ���ʵ��
        power=(pic(vertex(1,1),vertex(1,2))+pic(vertex(2,1),vertex(2,2))+pic(vertex(3,1),vertex(3,2))+pic(vertex(4,1),vertex(4,2)))/4;%������Ԫ��Ч�������
        T_dist_source = [power;col(vertex(1,2));col(vertex(3,2));row(row_pix-vertex(3,1)+1);row(row_pix-vertex(1,1)+1)];%������Ԫ�����l��m
        T_dist_pic = [T_dist_pic T_dist_source];
