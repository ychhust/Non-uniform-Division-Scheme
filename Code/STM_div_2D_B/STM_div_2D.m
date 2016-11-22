clear all; close all;clc;

%% 辐射计系统参数定义
[ant_num,div,min_spacing,T_rec]=SystemParaDef_2D();

%% 场景定义
% [matfile,pic_scope]= STMParaDef_2D();
% matfile = 'Earth_data.mat';       %导入图形矩阵
% matfile = 'pictest.mat';  
matfile = 'T_2D_Earth.mat'; 

pic_scope = [-0.5-0.5*j 0.5-0.5*j 0.5+0.5*j -0.5+0.5*j];   %导入图片的上下和左右范围
% extentpoint_rec_power = [400];    %源的能量（K）
% extentpoint_rec_place = [0.1*j 0.1+0.1*j 0.1+0.2*j 0.2j];   %l,m坐标系下的顶点位置，复数表示

%% %%%%%%%%%%%%%%%%%%%仿真运算%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 场景部分
fill_zero=15;
[Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,min_spacing,fill_zero);

%% %%%%%%%%%%%%%%%%%%%%展源处理部分%%%%%%%%%%%%%%%%%%%%%%%
%% 第一步：根据综合孔径辐射计成像可见度积分公式计算理想可见度函数
% V0_2D=Ideal_visibility_2D(matfile,pic_scope,extent_UV);
[V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV);
T0 = 2500*FFT2D(V0_2D,x_len,y_len);
%% 第二步：对目标图片进行均匀采样求取可见度函数
[visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV);
T1 = 2500*FFT2D(visibility_2D,x_len,y_len);
%% 第三步：对目标图片进行非均匀采样求取可见度函数
% [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV);
% T2 = 2500*FFT2D(visibility_non_2D,x_len,y_len);
x=[0.5 -0.5];
y=[-0.5 0.5];
figure()
imagesc(x,y,T0)
% set(gca,'XDir','reverse'); 
xlabel('视场范围','FontSize',10,'LineWidth',2)
% ylabel('反演亮温（K）','FontSize',10,'LineWidth',2)
title('地球理想亮温分布（K）','FontSize',10,'LineWidth',2)
colorbar
figure()
imagesc(x,y,T1)
% set(gca,'XDir','reverse'); 
xlabel('视场范围','FontSize',10,'LineWidth',2)
% ylabel('反演亮温（K）','FontSize',10,'LineWidth',2)
title('地球亮温分布（K）','FontSize',10,'LineWidth',2)
colorbar
% figure()
% imagesc(T2)
% set(gca,'XDir','reverse'); 
% colorbar
figure()
imagesc(x,y,T0-T1)
% set(gca,'XDir','reverse'); 
xlabel('视场范围','FontSize',10,'LineWidth',2)
% ylabel('反演亮温（K）','FontSize',10,'LineWidth',2)
title('亮温残差分布(K)','FontSize',10,'LineWidth',2)
colorbar
% figure()
% imagesc(T0-T2)
% set(gca,'XDir','reverse'); 
% colorbar
% figure()
% imagesc(T2)
% set(gca,'XDir','reverse'); 
% colorbar
% figure()
% plot(abs(real(V0_2D)))
% title('理想可见度实部')
% figure()
% plot(abs(imag(V0_2D)))
% title('理想可见度虚部')
% figure()
% subplot(2,1,1)
% plot(abs(real(V0_2D)-real(visibility_2D)))
% title('均匀场景划分可见度实部误差')
% subplot(2,1,2)
% plot(abs(real(V0_2D)-real(visibility_non_2D)))
% title('不均匀场景划分可见度实部误差')
% figure()
% subplot(2,1,1)
% plot(abs(imag(V0_2D)-imag(visibility_2D)))
% title('均匀场景划分可见度虚部误差')
% subplot(2,1,2)
% plot(abs(imag(V0_2D)-imag(visibility_non_2D)))
% title('不均匀场景划分可见度虚部误差')
