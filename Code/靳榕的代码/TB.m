function y = TB( x )

% 场景分布函数
% 参数定义
k1 = -20000; % 斜率
k2 = 20000; % 斜率
% 点的位置
p0 = -1;
p1 = - 0.4;
p2 = -0.3;
p3 = 0.2;
p4 = 0.3;
p5 =1;

% 每段初始亮温
T01 = 50;
T23 = 250;
T45 = 50;

if (x>=p0)&&(x<=p1)
    y =  T01;
elseif (x>p1)&&(x<= p2)
    y = 250 + k1*(x-p2)^2;
elseif (x>p2)&&(x<=p3)
    y = T23;
elseif (x>p3)&&(x<=p4)
    y = 50 + k2*(x-p4)^2;
elseif (x>p4)&&(x<=p5)
    y = T45;
else
    y = 0;
end


%%% 画图
% x = -1:0.01:1;
% for k = 1:length(x)
%     y(k) = TB( x(k) );
% end
% 
% plot(x,y);


