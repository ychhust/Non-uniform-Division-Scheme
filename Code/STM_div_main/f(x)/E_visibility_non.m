function [visibility_non_T]=E_visibility_non(visibility_non_T,place_start,place_end,min_spacing,div,distant,Fov_0)
%   语法：
%   visibility_non=E_visibility_non(T_dist_extent,extent_UV)
% 
%   函数功能：
%   此函数为目标场景不均匀划分时可见度函数实部求取模块，功能为：
%   读取无混叠视场、目标场景分布、划分点数、接收天线间距等信息，输出可见度函数信息。

%% 方法一：对sin(2*pi*k*l)进行均匀划分

%     Fov_non=[];
%     x_scope=Fov0*distant;%对应sin(2*pi*k*l)中的k*l
%     k0=abs(distant/min_spacing);%最小天线间距的倍数
%     if(k0==0)
%         %待添加
%     else
%         k=-k0;
%         while(k<=k0)
%             if(k==-k0)
%                 Fov_non=Division(Fov_non,x_scope,div/(4*k0),0.25*2*k,0.25*(2*k+1),0.25*2*(-k));%单调区域的划分
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
    
%% 方法二：对sin(2*pi*k*l)中l进行不均匀划分
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
                 %求取目标场景内不均匀采样所对应的亮温以及分布信息
                 x=(Fov_non(point+1)+Fov_non(point))/2;
                  delta_r=sin(2*pi*distant*Fov_non(point+1))-sin(2*pi*distant*Fov_non(point));
                  delta_i=cos(2*pi*distant*Fov_non(point+1))-cos(2*pi*distant*Fov_non(point));
%                 delta=Fov_non(point+1)-Fov_non(point);
%                  %% 求和方法一：矩形积分求和
%                  extentpoint_power_R=Scene_power(place_start,place_end,x,distant);
%                  c1 = [extentpoint_power_R*delta ; x];
%                  T_dist_extent_non_R = [T_dist_extent_non_R c1];
                 %% 求和方法二：梯形积分求和
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
       
%      visibility_non_T=sum(1/(2*pi*distant)*T_dist_extent_non_T(1,:));%可见度函数生成，没有进行冗余度平均
%      visibility_non_R=sum(1/(2*pi*distant)*T_dist_extent_non_R(1,:));%可见度函数生成，没有进行冗余度平均

if(distant==0)
        v=sum(T_dist_extent_non_T(1,:));
        visibility_non_T=[visibility_non_T v];
    else
        v=sum(1/(2*pi*distant)*T_dist_extent_non_T(1,:));%可见度函数生成，没有进行冗余度平均
        visibility_non_T=[visibility_non_T v];
    end