function [visibility_2D,T_dist_pic]=E_visibility_2D(matfile,pic_scope,extent_UV)

    delta_r=7;
    delta_c=7;
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_r,delta_c);
    %% 直接由角度计算可见度函数
    
%     scene_power = T_dist_pic(1,:); %源的功率向量
%     scene_theta = T_dist_pic(2,:); %源的位置向量theta
%     scene_phy = T_dist_pic(3,:);   %源的位置向量phy
%     for k=1:length(extent_UV)
%         visibility_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%可见度函数生成，没有进行冗余度平均
%     end
%% 由l、m求解可见度函数

    scene_power = T_dist_pic(1,:); %源的功率向量
    scene_l = T_dist_pic(2,:); %源的位置向量l=sin(theta)cos(phy)
    scene_m = T_dist_pic(3,:);   %源的位置向量m=sin(theta)sin(phy)
    for k=1:length(extent_UV)
        visibility_2D(k)=sum(1./sqrt(1-scene_l.^2-scene_m.^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*scene_l+extent_UV(2,k).*scene_m)));
    end