function Fov=Division(Fov,start_point,end_point,div)
%   语法：
%   Fov=Division(Fov,x_scope,div,start_point,end_point,offset)
%   Fov=Division(Fov,start_point,end_point,div)
% 
%   函数功能：
%   此函数为目标场景均匀划分模块，功能为：
%   读取目标场景分布信息，输出目标场景均匀采样点位置分布信息。


%% 方法一：对sin(2*pi*k*l)进行均匀划分

%     n=find(x_scope>start_point&x_scope<=end_point);
%     if(~isempty(n))
%         x=x_scope(1,n);
%         y=sin(2*pi*(x+offset));
%         y= linspace(min(y),max(y),div);%对sin(2*pi*k*l)进行均匀划分
%         c=1/(2*pi).*asin(y);%sin(2*pi*k*l)均匀划分所对应的l值为不均匀分布
%         c=c-offset;
%         Fov=[Fov c];
%     end
%     
%% 方法二：对sin(2*pi*k*l)中l进行不均匀划分
     c= linspace(start_point,end_point,div+1);
     Fov=[Fov c];
    