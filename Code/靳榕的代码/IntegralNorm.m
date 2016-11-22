function sum_TB = IntegralNorm(s1,s2,N,d)

% 对TB(x)基本积分
% s1积分起点
% s2积分终点
% N积分划分点数
% d 基线长度(以波长为单位)

% 实例
% s1 = 0;
% s2 = 0.2;
% N = 30;
% d = 0.8;
% sum_TB = IntNorm(s1,s2,N,d);

% 划分方式
fov = linspace(s1,s2,N+1);


% 毎段积分值
for k = 1:length(fov)-1
    % 取曲线上中点的值
    x = (fov(k+1) + fov(k))/2;
    delta_x = sin(2*pi*d*fov(k+1)) - sin(2*pi*d*fov(k));
%     delta_x=fov(k+1)-fov(k);
%         y(k) = TB(x)/2/pi/d/sqrt(1-x^2)*delta_x;
      y(k) = (TB(fov(k+1))+TB(fov(k)))/2/2/pi/d/sqrt(1-x^2)*delta_x;
   
end

%求和
sum_TB = sum(y);

    