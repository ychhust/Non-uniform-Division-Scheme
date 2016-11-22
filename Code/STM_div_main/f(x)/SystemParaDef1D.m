function [ant_num,div,min_spacing,T_rec]=SystemParaDef1D()

    array_type = 'ula'; %阵列排布类型。  *AntennaPositionHELP()        
    ant_num =30;% 阵元数                
%     div =(3:60)*20;%空间theta角度不均匀划分
    div =1000;%空间theta角度不均匀划分
    min_spacing =0.5;% 最小间距、基线排列方式单位为波长：  
    T_rec = 300;%接收机温度，即TB。单位：K
    %分析可见度函数与划分点数关系时的循环次数