%   语法：
%   Draw_picture_2D()
% 
%   函数功能：
%   此函数为画图模块，功能为：
%   画出反演所得目标场景并根据仿真结果分析可见度函数误差。


%% 十字型阵可见度残差

V0_2D = reshape(V0_2D,(2*x_len+1),(2*y_len+1));
visibility_2D = reshape(visibility_2D,(2*x_len+1),(2*y_len+1));
visibility_non_2D= reshape(visibility_non_2D,(2*x_len+1),(2*y_len+1));

 xaxis = -x_len:x_len;
 yaxis = -y_len:y_len;
 figure()
 imagesc(xaxis,yaxis,real(V0_2D))
 title('理想可见度实部')
 axis square
 colorbar
 
 figure()
 imagesc(xaxis,yaxis,real(visibility_2D-V0_2D))
 title('均匀划分可见度残差')
 axis square
 colorbar
 
 figure()
 imagesc(xaxis,yaxis,real(visibility_non_2D-V0_2D))
 title('非均匀划分可见度残差')
 axis square
 colorbar
%% 十字型亮温残差 
T0 = T0(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
T1 = T1(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
T2 = T2(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
Fov =Fov(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
X = real(Fov);
Y = imag(Fov);
r_x = 1/2/min_spacing/(2*x_len);
r_y = 1/2/min_spacing/(2*y_len);
interval = [r_x r_x -r_x -r_x] + j*[r_y -r_y -r_y r_y];
X_vertex = real(interval);
Y_vertex = imag(interval);

figure()
for k = 1:length(T0)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T0(k),'linestyle', 'none');
end
xlabel('\xi = sin\thetacos\phi');
ylabel('\eta = sin\thetasin\phi');
title('理想情况场景亮温')
axis square
colorbar

figure()
for k = 1:length(T1)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T1(k),'linestyle', 'none');
end
xlabel('\xi = sin\thetacos\phi');
ylabel('\eta = sin\thetasin\phi');
title('均匀划分场景亮温')
axis square
colorbar
figure()
for k = 1:length(T2)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T2(k),'linestyle', 'none');
end
xlabel('\xi = sin\thetacos\phi');
ylabel('\eta = sin\thetasin\phi');
title('非均匀划分场景亮温')
axis square
colorbar


figure()
for k = 1:length(T0)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T1(k)-T0(k),'linestyle', 'none');
end
xlabel('\xi = sin\thetacos\phi');
ylabel('\eta = sin\thetasin\phi');
title('均匀划分场景亮温残差')
axis square
colorbar

figure()
for k = 1:length(T1)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T2(k)-T0(k),'linestyle', 'none');
end
xlabel('\xi = sin\thetacos\phi');
ylabel('\eta = sin\thetasin\phi');
title('非均匀划分场景亮温残差')
axis square
colorbar

%% y型阵可见度残差
% r = 2/3/ant_num/min_spacing;% 半径
% angle = pi/6:pi/3:11*pi/6;% 角度
% interval = r*exp(j*angle);% 得到以0为中心的六边形顶点
% X = real(Fov);
% Y = imag(Fov);
% 
% X_vertex = real(interval);
% Y_vertex = imag(interval);
% figure()
% for k = 1:length(V0_2D)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,real(V0_2D(k)),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('理想可见度实部')
% axis square
% colorbar
% 
% figure()
% for k = 1:length(V0_2D)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,real(V0_2D(k)-visibility_2D(k)),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('均匀划分可见度实部残差')
% axis square
% colorbar
% 
% figure()
% for k = 1:length(V0_2D)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,real(V0_2D(k)-visibility_non_2D(k)),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('非均匀划分可见度实部残差')
% axis square
% colorbar

%% y型阵亮温残差

% T0 = T0(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
% T1 = T1(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
% T2 = T2(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
% Fov =Fov(KeepPointsInRec(Fov,max(abs(real(pic_scope))),max(abs(imag(pic_scope)))));
% X = real(Fov);
% Y = imag(Fov);
% figure()
% for k = 1:length(T0)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,T0(k),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('理想情况场景亮温')
% axis square
% colorbar
% 
% figure()
% for k = 1:length(T1)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,T1(k),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('均匀划分场景亮温')
% axis square
% colorbar
% figure()
% for k = 1:length(T2)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,T2(k),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('非均匀划分场景亮温')
% axis square
% colorbar
% 
% 
% figure()
% for k = 1:length(T0)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,T1(k)-T0(k),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('均匀划分场景亮温残差')
% axis square
% colorbar
% 
% figure()
% for k = 1:length(T1)
%     xaxis = X(k)+X_vertex;
%     yaxis = Y(k)+Y_vertex;
%     hold on
%     fill(xaxis,yaxis,T2(k)-T0(k),'linestyle', 'none');
% end
% xlabel('\xi = sin\thetacos\phi');
% ylabel('\eta = sin\thetasin\phi');
% title('非均匀划分场景亮温残差')
% axis square
% colorbar
% 
