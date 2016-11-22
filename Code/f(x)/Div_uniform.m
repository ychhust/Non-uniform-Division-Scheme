function T_dist_extent=Div_uniform(place_start,place_end,Fov0,div,distant)
%   语法：
%  T_dist_extent=Div_uniform(extentpoint_place_start,extentpoint_place_end,Fov0,div,num)
% 
%   函数功能：
%   此函数为目标场景均匀划分模块，功能为：
%   读取目标场景分布及划分点数信息，输出目标场景每个采样点的亮温及分布信息。

    x_scope = [min(Fov0) max(Fov0)]; % x 轴范围   
    Fov = linspace(x_scope(1),x_scope(2),div+1);% 按给定份数划分
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

