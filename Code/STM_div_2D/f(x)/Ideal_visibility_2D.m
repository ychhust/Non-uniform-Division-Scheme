function [V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV,uv_point)
%   �﷨��
%   [V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV)
% 
%   �������ܣ�
%   �˺���Ϊ����ɼ��Ⱥ�����ȡģ�飬����Ϊ��
%   ��ȡĿ�곡����UVƽ��ֲ���Ϣ���������ɼ�����Ϣ��
    
    delta_n=1;
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n);
    [V0_2D,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point);