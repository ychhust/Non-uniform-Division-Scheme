function ant_pos=CrossArray_pos(ant_num)

    %ʮ�����󣨲����м䵥Ԫ��
    cell = ant_num/4:-1:1;
    cell1 = (-j)*cell;
    cell2 = cell;
    cell3 = (-1)*cell;
    cell4 = (j)*cell;
    x=[cell1 cell2 cell3 cell4];
    ant_pos =[real(x) ; imag(x)];