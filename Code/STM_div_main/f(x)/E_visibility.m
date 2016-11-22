function [visibility_T,T_dist_extent_R,T_dist_extent_T]=E_visibility(visibility_T,place_start,place_end,Fov_0,div,distant)
%   �﷨��
%   [visibility,T_dist_extent]=E_visibility(place_start,place_end,Fov0,div,distant)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�����Ȼ���ʱ�ɼ��Ⱥ���ʵ����ȡģ�飬����Ϊ��
%   ��ȡ�޻���ӳ���Ŀ�곡���ֲ������ֵ������������߼�����Ϣ������ɼ��Ⱥ�����Ϣ��

    Fov=[];
    Fov=Division(Fov,-Fov_0,Fov_0,div);
    T_dist_extent_R=[];
    T_dist_extent_T= [];
  
    
    for k=1:length(place_start)
        for point = 1:length(Fov)-1
            if (Fov(point)>=place_start(k)&&Fov(point)<place_end(k))
                x=(Fov(point+1)+Fov(point))/2;
                delta_r=sin(2*pi*distant*Fov(point+1))-sin(2*pi*distant*Fov(point));
                delta_i=cos(2*pi*distant*Fov(point+1))-cos(2*pi*distant*Fov(point));
                %                delta=Fov(point+1)-Fov(point);
                %% ��ͷ���һ�����λ������
                %                 extentpoint_power_R=Scene_power(place_start,place_end,x,distant);
                %                 c1 = [extentpoint_power_R*delta ;x];
                %                 T_dist_extent_R = [T_dist_extent_R c1];
                %% ��ͷ����������λ������
                p1=Scene_power(place_start,place_end,Fov(point));
                p2=Scene_power(place_start,place_end,Fov(point+1));
                extentpoint_power_T=(p1+p2)/2;
                if(distant==0)
                    delta=Fov(point+1)-Fov(point);
                    c1 = [extentpoint_power_T*delta ;x];
                    T_dist_extent_T= [T_dist_extent_T c1];
                else
                    
                    c1 = [extentpoint_power_T*(delta_r-j*delta_i) ;x];
                    T_dist_extent_T= [T_dist_extent_T c1];
                end
            end
        end
    end
    %     visibility_R=sum(1/(2*pi*distant)*T_dist_extent_R(1,:)./sqrt(1-T_dist_extent_R(2,:).^2));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
    %     visibility_T=sum(1/(2*pi*distant)*T_dist_extent_T(1,:)./sqrt(1-T_dist_extent_T(2,:).^2));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
    %     visibility_R=sum(1/(2*pi*distant)*T_dist_extent_R(1,:));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
    if(distant==0)
        v=sum(T_dist_extent_T(1,:));
        visibility_T=[visibility_T v];
    else
        v=sum(1/(2*pi*distant)*T_dist_extent_T(1,:));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
        visibility_T=[visibility_T v];
    end