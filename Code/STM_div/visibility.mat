clear ; close all;clc;

%% 辐射计系统参数定义
[ant_num,min_spacing,T_rec,array_type]=SystemParaDef_2D();

%% 场景定义
matfile = 'E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_data.mat';       %导入图形矩阵
pic_scope = [-0.4-0.4*j 0.4-0.4*j 0.4+0.4*j -0.4+0.4*j];   %导入图片的l、m范围，其中l=sin(theta)sin(phy)、m=sin(theta)cos(phy)

%% %%%%%%%%%%%%%%%%%%%仿真运算%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 场景部分
fill_zero=0;%补零数目
% ant_num=ant_num+fill_zero;
%UV平面及无混叠视场分布
ant_pos=antpos_Generate(array_type,ant_num);
ant_pos =ant_pos *min_spacing;
% [uv_point,Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,ant_pos,min_spacing,fill_zero);
[extent_UV,Fov,uv_point]= GenerateUVCellofYShape(min_spacing,ant_num,ant_pos);
multiplier=1522.843;
offset=-29.573;
%% %%%%%%%%%%%%%%%%%%%%展源处理部分%%%%%%%%%%%%%%%%%%%%%%%
%% 第一步：根据综合孔径辐射计成像可见度积分公式计算理想可见度函数
[V0_2D,T_dist_pic0]=Ideal_visibility_2D(matfile,pic_scope,extent_UV,uv_point);%理想可见度函数求取
% T0 =multiplier*FFT2D(V0_2D,x_len,y_len)+offset;%二维傅里叶变换反演目标场景亮温
T0 = multiplier*HFFT(V0_2D)+offset;  
%% 第二步：对目标图片进行均匀采样求取可见度函数
[visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV,uv_point);%目标场景均匀划分可见度函数求取
% T1 =multiplier*FFT2D(visibility_2D,x_len,y_len)+offset;
T1 = multiplier*HFFT(visibility_2D)+offset; 
%% 第三步：对目标图片进行非均匀采样求取可见度函数
[visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV,uv_point);%目标场景不均匀划分可见度函数求取
% T2 =multiplier*FFT2D(visibility_non_2D,x_len,y_len)+offset;
T2 = multiplier*HFFT(visibility_non_2D)+offset; 


Draw_picture_2D

