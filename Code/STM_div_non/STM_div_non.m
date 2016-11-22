clear all; clc;close all; 
 
%% 辐射计系统参数定义
[ant_num,div,min_spacing,T_rec]=SystemParaDef1D();
%% 场景定义
[extentpoint_place_start,extentpoint_place_end,num]=STMParaDef1D();

%% 通道及误差参数定义      
ant_pos = 0:ant_num-1;%均匀直线阵

%% 反演参数定义
fill_zero = 0;% 补零个数

%% %%%%%%%%%%%%%%%%%%%仿真运算%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 场景部分
x_len = ant_num-1;%均匀直线阵
extent_UV = -x_len:x_len;
extent_UV = extent_UV*min_spacing;% 绝对位置 
Fov0 = -extent_UV/(2*x_len+1)/min_spacing/min_spacing;% 计算视场内分辨率单元点与网格点间的关系

%% %%%%%%%%%%%%%%%%%展源处理部分%%%%%%%
%% 第一步：根据综合孔径辐射计成像可见度积分公式计算理想可见度函数
delta_x=2;
V0=[];
V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,num,V0);   

%% 第二步：通过对无混叠视场进行不均分划分求取实际的可见度函数
% angle_range = T_dist_extent(2,:); 
% antenna_pos =  min_spacing*ant_pos;
% coef_vector = ones(size(angle_range));%%产生天线方向图之全向天线
N=length(div);
V1=zeros(1,N);
V2=zeros(1,N);
for i=1:N
%% 方法一：通过引导向量A求取可见度函数
% visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector);
        
%% 方法二：通过综合孔径可见度表达式求解可见度函数  
    [T_dist_extent,Fov]=Div_nonuniform(extentpoint_place_start,extentpoint_place_end,min_spacing,div(i),num,extent_UV(30+delta_x),Fov0);
    visibility_non=E_visibility_non(T_dist_extent,extent_UV(30+delta_x));
    V1_non(i)=real(visibility_non);
    V2(i)=imag(visibility_non);
end
save visibility_non V1_non
%% 第三步：分析可见度函数的实部、虚部与场景划分点数之间的关系
Vr=ones(1,N)*real(V0(30+delta_x));%%%%%%%%%%%%%%%
Vi=ones(1,N)*imag(V0(30+delta_x));
save visibility_ideal Vr
% Draw_pic
 Draw_pic_non
%% 第四步：通过可见度函数反演获取场景亮温
% T0=FFT_1D(V0,x_len,fill_zero);
% T1=FFT_1D(visibility_non,x_len,fill_zero);
% Draw_T
