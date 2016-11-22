function [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV)

    delta_r=7;
    delta_c=7;
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_r,delta_c);
    %% ֱ���ɽǶȼ���ɼ��Ⱥ���
    
%     scene_power = T_dist_pic(1,:); %Դ�Ĺ�������
%     scene_theta = T_dist_pic(2,:); %Դ��λ������theta
%     scene_phy = T_dist_pic(3,:);   %Դ��λ������phy
%     for k=1:length(extent_UV)
%         visibility_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%�ɼ��Ⱥ������ɣ�û�н��������ƽ��
%     end
%% ��l��m���ɼ��Ⱥ���

    scene_power = T_dist_pic(1,:); %Դ�Ĺ�������
    scene_l = T_dist_pic(2,:); %Դ��λ������l=sin(theta)cos(phy)
    scene_m = T_dist_pic(3,:);   %Դ��λ������m=sin(theta)sin(phy)
    for k=1:length(extent_UV)
        visibility_2D(k)=sum(1./sqrt(1-scene_l.^2-scene_m.^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*scene_l+extent_UV(2,k).*scene_m)));
    end