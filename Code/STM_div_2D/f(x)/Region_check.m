function In=Region_check(x,y,B1)
%   语法：
%   in1=Region_check(x,y,M1)
% 
%   函数功能：
%   此函数为亮温过渡区域求取模块，功能为：
%   读取采样点坐标、过渡区域边界信息，输出采样点是否属于亮温过渡区域信息。


%     in=inpolygon( y,x,M1(:,2),M1(:,1));%点在区域内则in=1
%     plot(y(~in),x(~in),'r.')
%     plot(y(in),x(in),'g.')
    
    In=[];
    for k=1:length(B1)
        boundary=B1{k};
        in=inpolygon( y,x,boundary(:,2),boundary(:,1));%点在区域内则in=1
        plot(y(~in),x(~in),'r.')
        plot(y(in),x(in),'g.')
        hold on
        In=[In in];
    end
    set(gca,'YDir','reverse')
   