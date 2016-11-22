function [visibility,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point)
%   �﷨��
%   [0_2D,T_dist_pic]=V_calculation(matfile,pic_scope,extent_UV)
% 
%   �������ܣ�
%   �˺���Ϊ����ɼ��Ⱥ�����ȡģ�飬����Ϊ��
%   ��ȡĿ�곡����UVƽ��ֲ���Ϣ���������ɼ�����Ϣ��
    
 
%% 1����ȡ�ɼ��Ⱥ���
   %%  ����һ��ͨ��l��m��ȡ�ɼ��Ⱥ���
%     scene_power = T_dist_pic(1,:); %Դ�Ĺ�������
%     scene_l = T_dist_pic(2,:); %Դ��λ������l=sin(theta)cos(phy)
%     scene_m = T_dist_pic(3,:);   %Դ��λ������m=sin(theta)sin(phy)
%     for k=1:length(extent_UV)
%         V_2D(k)=sum(1./sqrt(1-scene_l.^2-scene_m.^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*scene_l+extent_UV(2,k).*scene_m)));
%     end
   
    %% ��������ͨ��theta��phy��ȡ�ɼ��Ⱥ���
%     scene_power = T_dist_pic(1,:); %Դ�Ĺ�������
%     scene_theta = T_dist_pic(2,:); %Դ��λ������theta
%     scene_phy = T_dist_pic(3,:);   %Դ��λ������phy
%     for k=1:length(extent_UV)
%         V_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
%     end
   
    
%% 2����ȡ�ɼ��Ⱥ���ʵ��
    scene_power = T_dist_pic(1,:); %Դ�Ĺ�������
    scene_l1 = T_dist_pic(2,:); %Դ��λ������l(n)
    scene_l2 = T_dist_pic(3,:); %Դ��λ������l(n+1)
    scene_m1 = T_dist_pic(4,:);   %Դ��λ������m(n)
    scene_m2 = T_dist_pic(5,:);   %Դ��λ������m(n+1)
    delta_l=scene_l2-scene_l1;
    delta_m=scene_m2-scene_m1;
  
    visibility = zeros(size(extent_UV));
    count  = zeros(size(extent_UV)); % ����ƽ������
    for k=1:length(uv_point)
        if(uv_point(1,k)==0&&uv_point(2,k)~=0)
            delta_sm=sin(2*pi*uv_point(2,k).*scene_m2)-sin(2*pi*uv_point(2,k).*scene_m1);%sin(2*pi*k2*m(n+1))-sin(2*pi*k2*m(n))
            delta_cm=cos(2*pi*uv_point(2,k).*scene_m2)-cos(2*pi*uv_point(2,k).*scene_m1);%cos(2*pi*k2*m(n+1))-cos(2*pi*k2*m(n))
            V_R2D(k)=1/(2*pi*uv_point(2,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*delta_sm.*delta_l);
            V_I2D(k)=-1/(2*pi*uv_point(2,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*delta_cm.*delta_l);
            V_2D(k)=V_R2D(k)+j*V_I2D(k);
        else if(uv_point(1,k)~=0&&uv_point(2,k)==0)
                delta_sl=sin(2*pi*uv_point(1,k).*scene_l2)-sin(2*pi*uv_point(1,k).*scene_l1);%sin(2*pi*k1*l(n+1))-sin(2*pi*k1*l(n))
                delta_cl=cos(2*pi*uv_point(1,k).*scene_l2)-cos(2*pi*uv_point(1,k).*scene_l1);%cos(2*pi*k1*l(n+1))-cos(2*pi*k1*l(n))
                V_R2D(k)=1/(2*pi*uv_point(1,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*delta_sl.*delta_m);
                V_I2D(k)=-1/(2*pi*uv_point(1,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*delta_cl.*delta_m);
                V_2D(k)=V_R2D(k)+j*V_I2D(k);
            else if(uv_point(1,k)==0&&uv_point(2,k)==0)
                   V_2D(k)=sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*delta_l.*delta_m);
                else
                    delta_sl=sin(2*pi*uv_point(1,k).*scene_l2)-sin(2*pi*uv_point(1,k).*scene_l1);%sin(2*pi*k1*l(n+1))-sin(2*pi*k1*l(n))
                    delta_sm=sin(2*pi*uv_point(2,k).*scene_m2)-sin(2*pi*uv_point(2,k).*scene_m1);%sin(2*pi*k2*m(n+1))-sin(2*pi*k2*m(n))
                    delta_cl=cos(2*pi*uv_point(1,k).*scene_l2)-cos(2*pi*uv_point(1,k).*scene_l1);%cos(2*pi*k1*l(n+1))-cos(2*pi*k1*l(n))
                    delta_cm=cos(2*pi*uv_point(2,k).*scene_m2)-cos(2*pi*uv_point(2,k).*scene_m1);%cos(2*pi*k2*m(n+1))-cos(2*pi*k2*m(n))
                    V_R2D(k)=1/(4*pi^2*uv_point(1,k)*uv_point(2,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*(delta_sl.*delta_sm-delta_cl.*delta_cm));
                    V_I2D(k)=-1/(4*pi^2*uv_point(1,k)*uv_point(2,k))*sum(1./sqrt(1-((scene_l1+scene_l2)/2).^2-((scene_m1+scene_m2)/2).^2).*scene_power.*(delta_cl.*delta_sm+delta_sl.*delta_cm));
                    V_2D(k)=V_R2D(k)+j*V_I2D(k);
                end
            end
        end
    end
    uv_point= uv_point(1,:) + 1i*uv_point(2,:);
    for k = 1:length(uv_point)
        position = FindZero(extent_UV-uv_point(k));
        if (isempty(position) == 0)        % �ҵ���λ�÷ǿ�
            visibility(position) = visibility(position)+V_2D(k);% ����λ����position���Ŀɼ���
            count(position) = count(position) + 1;
        end
    end
    for k = 1:length(count)
        if 0 ~= count(k)
            visibility(k) =visibility(k)/count(k);% ���õ���uvƽ���Ŀɼ�������ƽ��
        end
    end
%     
%     pmax=sqrt(2)*max(real(extent_UV));
%     for pos = 1:length(extent_UV)
%              u = real(extent_UV(pos));
%              v = imag(extent_UV(pos));
%              p=sqrt(u^2+v^2);
%              % �ɼ��Ⱥ����Ӵ�,�����С�rectwin������bartlett������blackman����"hamming","hanning"
% %              switch lower(window_name)
% %              case 'rectwin'% ���δ�
% %                    w=1;
% %              case 'blackman'% 
% %                    w=0.42+0.5*cos(pi*p/pmax)+0.08*cos(2*pi*p/pmax); 
% %              case  'bartlett'% 
% %                    w=1-(p/pmax);
% %              case 'hamming'% 
% %                    w=0.54+0.46*cos(pi*p/pmax); 
% %              case 'hanning'% 
%                    w=0.5+0.5*cos(pi*p/pmax);
% %              end
%              
%              visibility(pos)=visibility(pos)*w;
%     end
    
    
    
    
    
    
    
    
    
    