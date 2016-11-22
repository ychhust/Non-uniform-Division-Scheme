function [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV,uv_point)
%   语法：
%   [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV)
% 
%   函数功能：
%   此函数为目标场景均匀采样可见度函数求取模块，功能为：
%   读取目标场景矩阵、目标场景范围、UV分布信息，输出目标场景均匀采样可见度函数信息。
    
    delta_n=4;%均匀采样间隔
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n);
    [visibility_2D,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point);
