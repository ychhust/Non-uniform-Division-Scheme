clear all; clc;close all; 
 
%% �����ϵͳ��������
[ant_num,div,min_spacing,T_rec]=SystemParaDef1D();
%% ��������
[extentpoint_place_start,extentpoint_place_end,num]=STMParaDef1D();

%% ͨ��������������      
ant_pos = 0:ant_num-1;%����ֱ����

%% ���ݲ�������
fill_zero = 0;% �������

%% %%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
x_len = ant_num-1;%����ֱ����
extent_UV = -x_len:x_len;
extent_UV = extent_UV*min_spacing;% ����λ�� 
Fov0 = -extent_UV/(2*x_len+1)/min_spacing/min_spacing;% �����ӳ��ڷֱ��ʵ�Ԫ����������Ĺ�ϵ

%% %%%%%%%%%%%%%%%%%չԴ������%%%%%%%
%% ��һ���������ۺϿ׾�����Ƴ���ɼ��Ȼ��ֹ�ʽ��������ɼ��Ⱥ���
delta_x=2;
V0=[];
V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,num,V0);   

%% �ڶ�����ͨ�����޻���ӳ����в����ֻ�����ȡʵ�ʵĿɼ��Ⱥ���
% angle_range = T_dist_extent(2,:); 
% antenna_pos =  min_spacing*ant_pos;
% coef_vector = ones(size(angle_range));%%�������߷���ͼ֮ȫ������
N=length(div);
V1=zeros(1,N);
V2=zeros(1,N);
for i=1:N
%% ����һ��ͨ����������A��ȡ�ɼ��Ⱥ���
% visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector);
        
%% ��������ͨ���ۺϿ׾��ɼ��ȱ��ʽ���ɼ��Ⱥ���  
    [T_dist_extent,Fov]=Div_nonuniform(extentpoint_place_start,extentpoint_place_end,min_spacing,div(i),num,extent_UV(30+delta_x),Fov0);
    visibility_non=E_visibility_non(T_dist_extent,extent_UV(30+delta_x));
    V1_non(i)=real(visibility_non);
    V2(i)=imag(visibility_non);
end
save visibility_non V1_non
%% �������������ɼ��Ⱥ�����ʵ�����鲿�볡�����ֵ���֮��Ĺ�ϵ
Vr=ones(1,N)*real(V0(30+delta_x));%%%%%%%%%%%%%%%
Vi=ones(1,N)*imag(V0(30+delta_x));
save visibility_ideal Vr
% Draw_pic
 Draw_pic_non
%% ���Ĳ���ͨ���ɼ��Ⱥ������ݻ�ȡ��������
% T0=FFT_1D(V0,x_len,fill_zero);
% T1=FFT_1D(visibility_non,x_len,fill_zero);
% Draw_T
