clear ; close all;clc;

%% �����ϵͳ��������
[ant_num,min_spacing,T_rec,array_type]=SystemParaDef_2D();

%% ��������
matfile = 'E:\�ۺϿ׾������\�ٶ���ͬ����\�Ǿ��Ȼ����㷨\����\STM_div_2D\Earth_data.mat';       %����ͼ�ξ���
pic_scope = [-0.4-0.4*j 0.4-0.4*j 0.4+0.4*j -0.4+0.4*j];   %����ͼƬ��l��m��Χ������l=sin(theta)sin(phy)��m=sin(theta)cos(phy)

%% %%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
fill_zero=0;%������Ŀ
% ant_num=ant_num+fill_zero;
%UVƽ�漰�޻���ӳ��ֲ�
ant_pos=antpos_Generate(array_type,ant_num);
ant_pos =ant_pos *min_spacing;
% [uv_point,Fov,extent_UV,x_len,y_len]=UVCell_2D(ant_num,ant_pos,min_spacing,fill_zero);
[extent_UV,Fov,uv_point]= GenerateUVCellofYShape(min_spacing,ant_num,ant_pos);
multiplier=1522.843;
offset=-29.573;
%% %%%%%%%%%%%%%%%%%%%%չԴ������%%%%%%%%%%%%%%%%%%%%%%%
%% ��һ���������ۺϿ׾�����Ƴ���ɼ��Ȼ��ֹ�ʽ��������ɼ��Ⱥ���
[V0_2D,T_dist_pic0]=Ideal_visibility_2D(matfile,pic_scope,extent_UV,uv_point);%����ɼ��Ⱥ�����ȡ
% T0 =multiplier*FFT2D(V0_2D,x_len,y_len)+offset;%��ά����Ҷ�任����Ŀ�곡������
T0 = multiplier*HFFT(V0_2D)+offset;  
%% �ڶ�������Ŀ��ͼƬ���о��Ȳ�����ȡ�ɼ��Ⱥ���
[visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV,uv_point);%Ŀ�곡�����Ȼ��ֿɼ��Ⱥ�����ȡ
% T1 =multiplier*FFT2D(visibility_2D,x_len,y_len)+offset;
T1 = multiplier*HFFT(visibility_2D)+offset; 
%% ����������Ŀ��ͼƬ���зǾ��Ȳ�����ȡ�ɼ��Ⱥ���
[visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV,uv_point);%Ŀ�곡�������Ȼ��ֿɼ��Ⱥ�����ȡ
% T2 =multiplier*FFT2D(visibility_non_2D,x_len,y_len)+offset;
T2 = multiplier*HFFT(visibility_non_2D)+offset; 


Draw_picture_2D

