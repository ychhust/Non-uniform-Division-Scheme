function [V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV,uv_point)
%   语法：
%   [V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV)
% 
%   函数功能：
%   此函数为理想可见度函数求取模块，功能为：
%   读取目标场景、UV平面分布信息，输出理想可见度信息。
    
    delta_n=1;
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n);
    [V0_2D,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point);