function T_dist_extent=Div_uniform(place_start,place_end,Fov0,div,distant)
%   �﷨��
%  T_dist_extent=Div_uniform(extentpoint_place_start,extentpoint_place_end,Fov0,div,num)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�����Ȼ���ģ�飬����Ϊ��
%   ��ȡĿ�곡���ֲ������ֵ�����Ϣ�����Ŀ�곡��ÿ������������¼��ֲ���Ϣ��

    x_scope = [min(Fov0) max(Fov0)]; % x �᷶Χ   
    Fov = linspace(x_scope(1),x_scope(2),div+1);% ��������������
    T_dist_extent = [];

    for k = 1:length(place_start)
        for point = 1:length(Fov)-1
            if (Fov(point)>=place_start(k)) && (Fov(point)<place_end(k))
                x=(Fov(point+1)+Fov(point))/2;
                delta=sin(2*pi*distant*Fov(point+1))-sin(2*pi*distant*Fov(point));
                T_dist_extent=T_dist(x,delta,T_dist_extent);
            end
        end
    end

