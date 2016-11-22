% tic
clear all; clc;
close all; 
 
%% 辐射计系统参数定义
[ant_num,div,min_spacing,T_rec]=SystemParaDef1D();

%% 场景定义
[extentpoint_place_start,extentpoint_place_end,num]=STMParaDef1D();
  
%% %%%%%%%%%%%%%%%%%%%仿真运算%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 场景部分
x_len = ant_num-1;%均匀直线阵
extent_UV = -x_len:x_len;
extent_UV = extent_UV*min_spacing;% 绝对位置 
Fov0 = extent_UV/(2*x_len+1)/min_spacing/min_spacing;% 计算视场内分辨率单元点与网格点间的关系
Fov_0 = 1/2/min_spacing;% 计算无混叠视场范围

%% %%%%%%%%%%%%%%%%%%%%展源处理部分%%%%%%%%%%%%%%%%%%%%%%%
%% 第一步：根据综合孔径辐射计成像可见度积分公式计算理想可见度函数
% delta_x=-x_len:x_len;
V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,Fov_0); 

%% 第二步：通过对无混叠视场进行划分求取实际的可见度函数

N=length(div);
Vr_R=zeros(1,N);
Vi_R=zeros(1,N);
Vr_T=zeros(1,N);
Vi_T=zeros(1,N);
Vr_non_R=zeros(1,N);
Vi_non_R=zeros(1,N);
Vr_non_T=zeros(1,N);
Vi_non_T=zeros(1,N);

visibility_T=[];
visibility_non_T=[];
 
    %% 对目标场景均匀划分时可见度的求取（用于求反演亮温残差）
TB_Error

% toc    
%% 第三步：分析可见度函数与场景划分点数之间的关系
% V_withDivisions

%% 第四步：分析场景划分的统计规律
%% 第一部分：分析可见度误差均值随划分点数的统计规律
% VError_withDivisions

%% 第二部分：分析可见度误差均值随基线的变化规律
% VError_withBaseline

% Draw_pic
