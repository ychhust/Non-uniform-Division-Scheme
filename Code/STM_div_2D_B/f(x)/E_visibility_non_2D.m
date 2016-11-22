function [visibility_non_2D,T_dist_pic_non]=E_visibility_non_2D(matfile,pic_scope,extent_UV)

    T_dist_pic_non=T_dist_non_2D(matfile,pic_scope);
    scene_power = T_dist_pic_non(1,:); %源的功率向量
    scene_theta = T_dist_pic_non(2,:); %源的位置向量theta
    scene_phy = T_dist_pic_non(3,:);   %源的位置向量phy
    for k=1:length(extent_UV)
        visibility_non_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%可见度函数生成，没有进行冗余度平均
    end
    