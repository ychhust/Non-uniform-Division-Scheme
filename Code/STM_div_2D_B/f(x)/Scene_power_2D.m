function T_dist_pic=Scene_power_2D(pic,vertex,row,col,delta_r,delta_c,row_pix,col_pix,T_dist_pic)

    pic_point = col(round(sum(vertex(:,2))/4))+j*row(row_pix-round(sum(vertex(:,1))/4)+1);
%     pic_point = col(pic_col)+j*row(row_pix-pic_row+1);
    if (abs(pic_point/90)<=1)
%         power = delta_r*delta_c*pic(pic_row,pic_col)/row_pix/col_pix;
        power=pic(round(sum(vertex(:,1))/4),round(sum(vertex(:,2))/4));
        power = power/row_pix/col_pix*delta_c*delta_r;
        theta = abs(pic_point);
        phy = angle(pic_point)*180/pi;
        T_dist_source = [power;theta;phy];
        T_dist_pic = [T_dist_pic T_dist_source];
    end