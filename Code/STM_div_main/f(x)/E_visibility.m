function [visibility_T,T_dist_extent_R,T_dist_extent_T]=E_visibility(visibility_T,place_start,place_end,Fov_0,div,distant)
%   语法：
%   [visibility,T_dist_extent]=E_visibility(place_start,place_end,Fov0,div,distant)
% 
%   函数功能：
%   此函数为目标场景均匀划分时可见度函数实部求取模块，功能为：
%   读取无混叠视场、目标场景分布、划分点数、接收天线间距等信息，输出可见度函数信息。

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
                %% 求和方法一：矩形积分求和
                %                 extentpoint_power_R=Scene_power(place_start,place_end,x,distant);
                %                 c1 = [extentpoint_power_R*delta ;x];
                %                 T_dist_extent_R = [T_dist_extent_R c1];
                %% 求和方法二：梯形积分求和
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
    %     visibility_R=sum(1/(2*pi*distant)*T_dist_extent_R(1,:)./sqrt(1-T_dist_extent_R(2,:).^2));%可见度函数生成，没有进行冗余度平均
    %     visibility_T=sum(1/(2*pi*distant)*T_dist_extent_T(1,:)./sqrt(1-T_dist_extent_T(2,:).^2));%可见度函数生成，没有进行冗余度平均
    %     visibility_R=sum(1/(2*pi*distant)*T_dist_extent_R(1,:));%可见度函数生成，没有进行冗余度平均
    if(distant==0)
        v=sum(T_dist_extent_T(1,:));
        visibility_T=[visibility_T v];
    else
        v=sum(1/(2*pi*distant)*T_dist_extent_T(1,:));%可见度函数生成，没有进行冗余度平均
        visibility_T=[visibility_T v];
    end