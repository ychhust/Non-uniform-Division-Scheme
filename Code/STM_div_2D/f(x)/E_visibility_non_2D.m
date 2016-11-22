function [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV,uv_point)
%   语法：
%   [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV)
% 
%   函数功能：
%   此函数为目标场景不均匀采样可见度函数求取模块，功能为：
%   读取目标场景矩阵、目标场景分布范围、UV平面分布信息，输出目标场景不均匀采样可见度函数信息。

    T_dist_pic_non=T_dist_non_2D(matfile,pic_scope);
    [visibility_non_2D,T_dist_pic_non]=V_calculation(T_dist_pic_non,extent_UV,uv_point);
 

    
    

    