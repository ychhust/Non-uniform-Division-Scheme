function [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV,uv_point)
%   �﷨��
%   [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�����Ȳ����ɼ��Ⱥ�����ȡģ�飬����Ϊ��
%   ��ȡĿ�곡������Ŀ�곡����Χ��UV�ֲ���Ϣ�����Ŀ�곡�����Ȳ����ɼ��Ⱥ�����Ϣ��
    
    delta_n=4;%���Ȳ������
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n);
    [visibility_2D,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point);
