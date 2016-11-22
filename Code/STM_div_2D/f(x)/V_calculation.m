function [visibility,T_dist_pic]=V_calculation(T_dist_pic,extent_UV,uv_point)
%   语法：
%   [0_2D,T_dist_pic]=V_calculation(matfile,pic_scope,extent_UV)
% 
%   函数功能：
%   此函数为理想可见度函数求取模块，功能为：
%   读取目标场景、UV平面分布信息，输出理想可见度信息。
    
 
%% 1、求取可见度函数
   %%  方法一：通过l、m求取可见度函数
%     scene_power = T_dist_pic(1,:); %源的功率向量
%     scene_l = T_dist_pic(2,:); %源的位置向量l=sin(theta)cos(phy)
%     scene_m = T_dist_pic(3,:);   %源的位置向量m=sin(theta)sin(phy)
%     for k=1:length(extent_UV)
%         V_2D(k)=sum(1./sqrt(1-scene_l.^2-scene_m.^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*scene_l+extent_UV(2,k).*scene_m)));
%     end
   
    %% 方法二：通过theta、phy求取可见度函数
%     scene_power = T_dist_pic(1,:); %源的功率向量
%     scene_theta = T_dist_pic(2,:); %源的位置向量theta
%     scene_phy = T_dist_pic(3,:);   %源的位置向量phy
%     for k=1:length(extent_UV)
%         V_2D(k)=sum(1./sqrt(1-(sind(scene_theta).*cosd(scene_phy)).^2-(sind(scene_theta).*sind(scene_phy)).^2).*scene_power.*exp(j*2*pi*(extent_UV(1,k).*sind(scene_theta).*cosd(scene_phy)+extent_UV(2,k).*sind(scene_theta).*sind(scene_phy))));%可见度函数生成，没有进行冗余度平均
%     end
   
    
%% 2、求取可见度函数实部
    scene_power = T_dist_pic(1,:); %源的功率向量
    scene_l1 = T_dist_pic(2,:); %源的位置向量l(n)
    scene_l2 = T_dist_pic(3,:); %源的位置向量l(n+1)
    scene_m1 = T_dist_pic(4,:);   %源的位置向量m(n)
    scene_m2 = T_dist_pic(5,:);   %源的位置向量m(n+1)
    delta_l=scene_l2-scene_l1;
    delta_m=scene_m2-scene_m1;
  
    visibility = zeros(size(extent_UV));
    count  = zeros(size(extent_UV)); % 冗余平均次数
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
        if (isempty(position) == 0)        % 找到的位置非空
            visibility(position) = visibility(position)+V_2D(k);% 更新位置在position处的可见度
            count(position) = count(position) + 1;
        end
    end
    for k = 1:length(count)
        if 0 ~= count(k)
            visibility(k) =visibility(k)/count(k);% 将得到的uv平面点的可见度冗余平均
        end
    end
%     
%     pmax=sqrt(2)*max(real(extent_UV));
%     for pos = 1:length(extent_UV)
%              u = real(extent_UV(pos));
%              v = imag(extent_UV(pos));
%              p=sqrt(u^2+v^2);
%              % 可见度函数加窗,可以有“rectwin”，“bartlett”，“blackman”，"hamming","hanning"
% %              switch lower(window_name)
% %              case 'rectwin'% 矩形窗
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
    
    
    
    
    
    
    
    
    
    