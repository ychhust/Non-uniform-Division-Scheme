function vertex=Vertex(pic_row,pic_col,delta_r,delta_c)

    vertex=zeros(4,2);
    vertex(1,1)=pic_row;
    vertex(1,2)=pic_col;
    vertex(2,1)=pic_row;
    vertex(2,2)=pic_col+delta_c;
    vertex(3,1)=pic_row+delta_r;
    vertex(3,2)=pic_col+delta_c;
    vertex(4,1)=pic_row+delta_r;
    vertex(4,2)=pic_col;