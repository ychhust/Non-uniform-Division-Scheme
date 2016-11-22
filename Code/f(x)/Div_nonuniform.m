function [T_dist_extent_non,Fov_non]=Div_nonuniform(place_start,place_end,min_spacing,div,distant,Fov0)
%   语法：
%   [T_dist_extent,Fov]=Div_nonuniform(extentpoint_place_start,extentpoint_place_end,min_spacing,div,num,extent_UV,Fov0)
% 
%   函数功能：
%   此函数为目标场景不均匀划分模块，功能为：
%   读取场景亮温、分布信息以及对目标场景不均匀划分点数信息，输出目标场景不均匀划分后的亮温、分布信息。


%% 方法一：对sin(2*pi*k*l)进行均匀划分

%     Fov=[];
%     x_scope=Fov0*extent_UV;%对应sin(2*pi*k*l)中的k*l
%     k0=abs(extent_UV./min_spacing);%最小天线间距的倍数
%     if(k0==0)
%         %待添加
%     else
%         k=-k0;
%         while(k<=k0)
%             if(k==-k0)
%                 Fov=Division(Fov,x_scope,div/(4*k0),0.25*2*k,0.25*(2*k+1),0.25*2*(-k));%单调区域的划分
%             else if(k==k0)
%                     Fov=Division(Fov,x_scope,div/(4*k0),0.25*(2*k-1),0.25*(2*k),0.25*2*(-k));
%                 else
%                     Fov=Division(Fov,x_scope,div/(2*k0),0.25*(2*k-1),0.25*(2*k+1),0.25*2*(-k));
%                 end
%             end
%             k=k+1;
%         end
%     end
%     Fov=Fov/extent_UV;
    
%% 方法二：对sin(2*pi*k*l)中l进行不均匀划分
     Fov_non=[];
     Fov_non=Division(Fov_non,min(Fov0),place_start(1),div/20*3);
     Fov_non=Division(Fov_non,place_start(1),place_end(1),div/20*5.5);
     Fov_non=Division(Fov_non,place_start(2),place_end(2),div/20*2.5);
     Fov_non=Division(Fov_non,place_start(3),place_end(3),div/20*5.5);
     Fov_non=Division(Fov_non,place_end(3),max(Fov0),div/20*3.5);

      
    T_dist_extent_non = [];
    for k = 1:length(place_start)
        for point = 1:length(Fov_non)-1
            if (Fov_non(point)>=place_start(k)) && (Fov_non(point)<place_end(k))
                %求取目标场景内不均匀采样所对应的亮温以及分布信息
                 x=(Fov_non(point+1)+Fov_non(point))/2;
                 delta=sin(2*pi*distant*Fov_non(point+1))-sin(2*pi*distant*Fov_non(point));
                T_dist_extent_non=T_dist(x,delta,T_dist_extent_non);   
            end
        end
    end




