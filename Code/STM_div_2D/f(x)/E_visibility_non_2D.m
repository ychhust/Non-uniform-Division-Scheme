function [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV,uv_point)
%   �﷨��
%   [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�������Ȳ����ɼ��Ⱥ�����ȡģ�飬����Ϊ��
%   ��ȡĿ�곡������Ŀ�곡���ֲ���Χ��UVƽ��ֲ���Ϣ�����Ŀ�곡�������Ȳ����ɼ��Ⱥ�����Ϣ��

    T_dist_pic_non=T_dist_non_2D(matfile,pic_scope);
    [visibility_non_2D,T_dist_pic_non]=V_calculation(T_dist_pic_non,extent_UV,uv_point);
 

    
    

    