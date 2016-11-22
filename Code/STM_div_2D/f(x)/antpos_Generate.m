function ant_pos=antpos_Generate(array_type,ant_num)

    switch array_type
        
%         case 'mrla'
%             %最小冗余阵
%             ant_pos = SRMGenerateMRLAAntennaPos(array_num);
%  
        case 'ula'
            %均匀直线阵
            ant_pos = [0:ant_num-1];
   
        case 'Y_shape'
            %交错Y型阵
            cell = ant_num/3-1:-1:0;
            cell1 = (-j)*cell;
            cell2 = (cell+1)*exp(j*pi/6);
            cell3 = cell*exp(j*pi*5/6)+j;
            ant_pos =[real([cell1 cell2 cell3]);imag([cell1 cell2 cell3])];
    
        case 'y_shape'
            %普通Y型阵
            cell = (ant_num-1)/3:-1:1;
            cell1 = (-j)*cell;
            cell2 = cell*exp(j*pi/6);
            cell3 = cell*exp(j*pi*5/6);
            ant_pos =[real([0 cell1 cell2 cell3]);imag([0 cell1 cell2 cell3])];
   
        case 'T_shape'
            %T型阵
            cell = (ant_num-1)/3:-1:1;
            cell1 = (-j)*cell;
            cell2 = cell;
            cell3 = (-1)*cell;
            ant_pos =[real([0 cell1 cell2 cell3]);imag([0 cell1 cell2 cell3])];
    
        case 'O_shape'
            %圆形阵
            cell_angle = 0:ant_num-1;
            cell = exp(j*cell_angle*2*pi/ant_num);
            ant_pos =[real(cell1);imag(cell1)];

        case 'cross_shape'
            %十字型阵
            cell = (ant_num-1)/4:-1:1;
            cell1 = (-j)*cell;
            cell2 = cell;
            cell3 = (-1)*cell;
            cell4 = (j)*cell;
            ant_pos =[real([0 cell1 cell2 cell3 cell4]);imag([0 cell1 cell2 cell3 cell4])];
            
        case 'Cross_shape'
            %十字型阵（不含中间单元）
            cell = ant_num/4:-1:1;
            cell1 = (-j)*cell;
            cell2 = cell;
            cell3 = (-1)*cell;
            cell4 = (j)*cell;
            ant_pos =[real([cell1 cell2 cell3 cell4]);imag([cell1 cell2 cell3 cell4])];           
 
    end