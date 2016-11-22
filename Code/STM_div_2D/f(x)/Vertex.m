function vertex=Vertex(pic_row,pic_col,delta_r,delta_c)
%   语法：
%   vertex=Vertex(pic_row,pic_col,delta_r,delta_c)
% 
%   函数功能：
%   此函数为采样模块顶点分布模块，功能为：
%   读取目标场景矩阵分布、采样间隔信息，输出采样模块四个顶点信息。

    vertex=zeros(4,2);
%     采样单元四个顶点位置
    vertex(1,1)=pic_row;
    vertex(1,2)=pic_col;
    vertex(2,1)=pic_row;
    vertex(2,2)=pic_col+delta_c;
    vertex(3,1)=pic_row+delta_r;
    vertex(3,2)=pic_col+delta_c;
    vertex(4,1)=pic_row+delta_r;
    vertex(4,2)=pic_col;