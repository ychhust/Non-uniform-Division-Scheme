% tic
clear all; clc;
close all; 
 
%% �����ϵͳ��������
[ant_num,div,min_spacing,T_rec]=SystemParaDef1D();

%% ��������
[extentpoint_place_start,extentpoint_place_end,num]=STMParaDef1D();
  
%% %%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
x_len = ant_num-1;%����ֱ����
extent_UV = -x_len:x_len;
extent_UV = extent_UV*min_spacing;% ����λ�� 
Fov0 = extent_UV/(2*x_len+1)/min_spacing/min_spacing;% �����ӳ��ڷֱ��ʵ�Ԫ����������Ĺ�ϵ
Fov_0 = 1/2/min_spacing;% �����޻���ӳ���Χ

%% %%%%%%%%%%%%%%%%%%%%չԴ������%%%%%%%%%%%%%%%%%%%%%%%
%% ��һ���������ۺϿ׾�����Ƴ���ɼ��Ȼ��ֹ�ʽ��������ɼ��Ⱥ���
% delta_x=-x_len:x_len;
V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,Fov_0); 

%% �ڶ�����ͨ�����޻���ӳ����л�����ȡʵ�ʵĿɼ��Ⱥ���

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
 
    %% ��Ŀ�곡�����Ȼ���ʱ�ɼ��ȵ���ȡ�������������²в
TB_Error

% toc    
%% �������������ɼ��Ⱥ����볡�����ֵ���֮��Ĺ�ϵ
% V_withDivisions

%% ���Ĳ��������������ֵ�ͳ�ƹ���
%% ��һ���֣������ɼ�������ֵ�滮�ֵ�����ͳ�ƹ���
% VError_withDivisions

%% �ڶ����֣������ɼ�������ֵ����ߵı仯����
% VError_withBaseline

% Draw_pic
