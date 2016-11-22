function [ant_num,min_spacing,T_rec,array_type]=SystemParaDef_2D()
%   语法：
%   [ant_num,div,min_spacing,T_rec]=SystemParaDef_2D()
% 
%   函数功能：
%   此函数为系统参数定义模块，功能为：
%   定义系统天线类型、阵元数目、最小天线间距、接收机亮温等信息。

    array_type = 'y_shape'; %阵列排布类型为十字阵。  *AntennaPositionHELP()        
    ant_num =73;% 阵元数                
    min_spacing =0.5;% 最小间距、基线排列方式单位为波长：  
    T_rec = 300;%接收机温度，即TB。单位：K
 
    