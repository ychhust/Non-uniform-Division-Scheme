clear all; close all;clc;

%% �����ϵͳ��������
[ant_num,div,min_spacing,T_rec]=SystemParaDef_2D();

%% ��������
% [matfile,pic_scope]= STMParaDef_2D();
% matfile = 'Earth_data.mat';       %����ͼ�ξ���
% matfile = 'pictest.mat';  
matfile = 'T_2D_Earth.mat'; 

pic_scope = [-0.5-0.5*j 0.5-0.5*j 0.5+0.5*j -0.5+0.5*j];   %����ͼƬ�����º����ҷ�Χ
% extentpoint_rec_power = [400];    %Դ��������K��
% extentpoint_rec_place = [0.1*j 0.1+0.1*j 0.1+0.2*j 0.2j];   %l,m����ϵ�µĶ���λ�ã�������ʾ

%% %%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
fill_zero=15;
[Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,min_spacing,fill_zero);

%% %%%%%%%%%%%%%%%%%%%%չԴ������%%%%%%%%%%%%%%%%%%%%%%%
%% ��һ���������ۺϿ׾�����Ƴ���ɼ��Ȼ��ֹ�ʽ��������ɼ��Ⱥ���
% V0_2D=Ideal_visibility_2D(matfile,pic_scope,extent_UV);
[V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV);
T0 = 2500*FFT2D(V0_2D,x_len,y_len);
%% �ڶ�������Ŀ��ͼƬ���о��Ȳ�����ȡ�ɼ��Ⱥ���
[visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV);
T1 = 2500*FFT2D(visibility_2D,x_len,y_len);
%% ����������Ŀ��ͼƬ���зǾ��Ȳ�����ȡ�ɼ��Ⱥ���
% [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV);
% T2 = 2500*FFT2D(visibility_non_2D,x_len,y_len);
x=[0.5 -0.5];
y=[-0.5 0.5];
figure()
imagesc(x,y,T0)
% set(gca,'XDir','reverse'); 
xlabel('�ӳ���Χ','FontSize',10,'LineWidth',2)
% ylabel('�������£�K��','FontSize',10,'LineWidth',2)
title('�����������·ֲ���K��','FontSize',10,'LineWidth',2)
colorbar
figure()
imagesc(x,y,T1)
% set(gca,'XDir','reverse'); 
xlabel('�ӳ���Χ','FontSize',10,'LineWidth',2)
% ylabel('�������£�K��','FontSize',10,'LineWidth',2)
title('�������·ֲ���K��','FontSize',10,'LineWidth',2)
colorbar
% figure()
% imagesc(T2)
% set(gca,'XDir','reverse'); 
% colorbar
figure()
imagesc(x,y,T0-T1)
% set(gca,'XDir','reverse'); 
xlabel('�ӳ���Χ','FontSize',10,'LineWidth',2)
% ylabel('�������£�K��','FontSize',10,'LineWidth',2)
title('���²в�ֲ�(K)','FontSize',10,'LineWidth',2)
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
% title('����ɼ���ʵ��')
% figure()
% plot(abs(imag(V0_2D)))
% title('����ɼ����鲿')
% figure()
% subplot(2,1,1)
% plot(abs(real(V0_2D)-real(visibility_2D)))
% title('���ȳ������ֿɼ���ʵ�����')
% subplot(2,1,2)
% plot(abs(real(V0_2D)-real(visibility_non_2D)))
% title('�����ȳ������ֿɼ���ʵ�����')
% figure()
% subplot(2,1,1)
% plot(abs(imag(V0_2D)-imag(visibility_2D)))
% title('���ȳ������ֿɼ����鲿���')
% subplot(2,1,2)
% plot(abs(imag(V0_2D)-imag(visibility_non_2D)))
% title('�����ȳ������ֿɼ����鲿���')
