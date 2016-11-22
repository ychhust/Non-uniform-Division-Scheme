clear all;
%  close all;

% 场景
figure()
%%% 画图
d=4;
x = -1:0.01:1;
for k = 1:length(x)
    y(k) = TB( x(k));
end
plot(x,y);
title('原始图像')



% 基线长度
% d =0.5;
% 基本划分方式 毎0.1划分点数
n_k = 2:2:60;



% 积分准确值假设为划分份数足够多的情况
v_accurate = IntegralNorm(-1,1,10000,d);

%%%%% 均匀划分时
% 划分点数
N_k = n_k*20;

for k = 1:length(N_k)
    sum_TB_norm(k) = IntegralNorm(-1,1,N_k(k),d);
end

figure()
plot(N_k,log(abs(v_accurate - sum_TB_norm)));

hold on

%%%%% 非均匀划分时
%基本划分方式
% -1到-0.4之间    0.5*n_k
% -0.4到-0.3之间  5*n_k
% -0.3到0.2之间   0.5*n_k
% 0.2到0.3之间    5*n_k
% 0.3到1之间      0.5*n_k

% 划分点数
N_k = n_k*(6*0.5+5+5*0.5+5+7*0.5);

for k = 1:length(N_k)

    d1 = IntegralNorm(-1,-0.4,6*0.5*n_k(k),d); 
    d2 = IntegralNorm(-0.4,-0.3,1*5*n_k(k),d);
    d3 = IntegralNorm(-0.3,0.2,7*0.5*n_k(k),d);
    d4 = IntegralNorm(0.2,0.3,1*5*n_k(k),d);
    d5 = IntegralNorm(0.3,1,7*0.5*n_k(k),d);
    sum_TB_non(k) = d1 + d2 +d3 + d4 + d5;
end

plot(N_k,log(abs(v_accurate - sum_TB_non)),'r')

title('可见度实部残差')
legend('均匀划分可见度','非均匀划分可见度')
