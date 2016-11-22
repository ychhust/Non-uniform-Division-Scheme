function [V0_2D,T_dist_pic]=Ideal_visibility_2D(matfile,pic_scope,extent_UV)

    delta_r=1;
    delta_c=1;
    T_dist_pic=T_dist_2D(matfile,pic_scope,delta_r,delta_c);
    %% 直接由角度求解可见度函数
    
%     scene_power = T_dist_pic(1,:); %源的功率向量
%     scene_theta = T_dist_pic(2,:); %源的位置向量theta
%     scene_phy = T_dist_pic(3,:);   %源的位置向量phy
%     for k=1:length(extent_UV)
%         visibility_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%可见度函数生成，没有进行冗余度平均
%     end
%     V0_2D=visibility_2D;
%% 由l、m求解可见度函数

    scene_power = T_dist_pic(1,:); %源的功率向量
    scene_l = T_dist_pic(2,:); %源的位置向量l=sin(theta)cos(phy)
    scene_m = T_dist_pic(3,:);   %源的位置向量m=sin(theta)sin(phy)
    for k=1:length(extent_UV)
        visibility_2D(k)=sum(1./sqrt(1-scene_l.^2-scene_m.^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*scene_l+extent_UV(2,k).*scene_m)));
    end
    V0_2D=visibility_2D;
    
% power=[];
%     for k=1:length(extent_UV)
%         for i=1:length(scene_power)-1
% %         T_dist_pic=T_dist_2D(matfile,pic_scope,delta_n,extent_UV(1,k),extent_UV(2,k));
%           s=(sin(2*pi*extent_UV(1,k)*scene_theta(i+1))-sin(2*pi*extent_UV(1,k)*scene_theta(i)))*(sin(2*pi*extent_UV(2,k)*scene_phy(i+1))-sin(2*pi*extent_UV(2,k)*scene_phy(i)));
%           c=(cos(2*pi*extent_UV(1,k)*scene_theta(i+1))-cos(2*pi*extent_UV(1,k)*scene_theta(i)))*(cos(2*pi*extent_UV(2,k)*scene_phy(i+1))-cos(2*pi*extent_UV(2,k)*scene_phy(i)));
%           p=scene_power(i)/sqrt(1-((scene_theta(i+1)+scene_theta(i))/2)^2-((scene_phy(i+1)+scene_phy(i))/2)^2);
%           power=[power p*s*c];
%         end
%        V0_2D(k)=1/(4*pi^2*extent_UV(1,k)*extent_UV(2,k))*sum(power);
%     end