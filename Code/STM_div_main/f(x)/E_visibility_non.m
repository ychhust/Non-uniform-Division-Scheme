function [visibility_non_T]=E_visibility_non(visibility_non_T,place_start,place_end,min_spacing,div,distant,Fov_0)
%   �﷨��
%   visibility_non=E_visibility_non(T_dist_extent,extent_UV)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�������Ȼ���ʱ�ɼ��Ⱥ���ʵ����ȡģ�飬����Ϊ��
%   ��ȡ�޻���ӳ���Ŀ�곡���ֲ������ֵ������������߼�����Ϣ������ɼ��Ⱥ�����Ϣ��

%% ����һ����sin(2*pi*k*l)���о��Ȼ���

%     Fov_non=[];
%     x_scope=Fov0*distant;%��Ӧsin(2*pi*k*l)�е�k*l
%     k0=abs(distant/min_spacing);%��С���߼��ı���
%     if(k0==0)
%         %�����
%     else
%         k=-k0;
%         while(k<=k0)
%             if(k==-k0)
%                 Fov_non=Division(Fov_non,x_scope,div/(4*k0),0.25*2*k,0.25*(2*k+1),0.25*2*(-k));%��������Ļ���
%             else if(k==k0)
%                     Fov_non=Division(Fov_non,x_scope,div/(4*k0),0.25*(2*k-1),0.25*(2*k),0.25*2*(-k));
%                 else
%                     Fov_non=Division(Fov_non,x_scope,div/(2*k0),0.25*(2*k-1),0.25*(2*k+1),0.25*2*(-k));
%                 end
%             end
%             k=k+1;
%         end
%     end
%     Fov_non=Fov_non/distant;
    
%% ����������sin(2*pi*k*l)��l���в����Ȼ���
     Fov_non=[];
     Fov_non=Division(Fov_non,-Fov_0,place_start(1),ceil(div/20*0.5));
     Fov_non=Division(Fov_non,place_start(1),place_end(1),ceil(div/20*3));
     Fov_non=Division(Fov_non,place_start(2),place_end(2),div/20*5);
     Fov_non=Division(Fov_non,place_start(3),place_end(3),div/20*5);
     Fov_non=Division(Fov_non,place_start(4),place_end(4),div/20*5);
     Fov_non=Division(Fov_non,place_start(5),place_end(5),ceil(div/20*1));
     Fov_non=Division(Fov_non,place_end(5),Fov_0,ceil(div/20*0.5));
     
     T_dist_extent_non_T = [];
     
     for k=1:length(place_start)
         for point = 1:length(Fov_non)-1
             if (Fov_non(point)>=place_start(k)&&Fov_non(point)<place_end(k))
                 %��ȡĿ�곡���ڲ����Ȳ�������Ӧ�������Լ��ֲ���Ϣ
                 x=(Fov_non(point+1)+Fov_non(point))/2;
                  delta_r=sin(2*pi*distant*Fov_non(point+1))-sin(2*pi*distant*Fov_non(point));
                  delta_i=cos(2*pi*distant*Fov_non(point+1))-cos(2*pi*distant*Fov_non(point));
%                 delta=Fov_non(point+1)-Fov_non(point);
%                  %% ��ͷ���һ�����λ������
%                  extentpoint_power_R=Scene_power(place_start,place_end,x,distant);
%                  c1 = [extentpoint_power_R*delta ; x];
%                  T_dist_extent_non_R = [T_dist_extent_non_R c1];
                 %% ��ͷ����������λ������
                 p1=Scene_power(place_start,place_end,Fov_non(point));
                 p2=Scene_power(place_start,place_end,Fov_non(point+1));
                 extentpoint_power_T=(p1+p2)/2;
                 if(distant==0)
                    delta=Fov_non(point+1)-Fov_non(point);
                    c1 = [extentpoint_power_T*delta ;x];
                    T_dist_extent_non_T= [T_dist_extent_non_T c1];
                else
                    
                   c1 = [extentpoint_power_T*(delta_r-j*delta_i) ; x];
                 T_dist_extent_non_T = [T_dist_extent_non_T c1];
                end
                 
             end
         end
     end
       
%      visibility_non_T=sum(1/(2*pi*distant)*T_dist_extent_non_T(1,:));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
%      visibility_non_R=sum(1/(2*pi*distant)*T_dist_extent_non_R(1,:));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��

if(distant==0)
        v=sum(T_dist_extent_non_T(1,:));
        visibility_non_T=[visibility_non_T v];
    else
        v=sum(1/(2*pi*distant)*T_dist_extent_non_T(1,:));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
        visibility_non_T=[visibility_non_T v];
    end