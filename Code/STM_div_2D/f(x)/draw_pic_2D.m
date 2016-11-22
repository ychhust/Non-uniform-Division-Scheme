function draw_pic_2D(T,Fov,interval,AE_scope_line,AE_scope)
figure()

% 取在单位圆内的点
T = T(KeepPointsInCircle(Fov));
Fov = Fov(KeepPointsInCircle(Fov));

% x和y轴的坐标
X = real(Fov);
Y = imag(Fov);

% 顶点的坐标
X_vertex = real(interval);
Y_vertex = imag(interval);

% 画图
for k = 1:length(T)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T(k),'linestyle', 'none');
end

% title(DR_param.title);
% xlabel('\xi');
% ylabel('\eta');
% axis square

%%%%%%%%
% 无混叠视场范围线条
if isempty(AE_scope_line) == 0
    for k = 1:size(AE_scope_line,1)     
        hold on
        plot(real(AE_scope_line(k,:)),imag(AE_scope_line(k,:)),'k-','LineWidth',1.5);
    end
end

% 无混叠视场范围
 if isempty(AE_scope) == 0
    in = inpolygon(real(Fov),imag(Fov),real(AE_scope),imag(AE_scope));
    AE_Fov = Fov(in);
    AE_T = T(in);
    % x和y轴的坐标
    X = real(AE_Fov);
    Y = imag(AE_Fov);
    figure()
    % 画图
    for k = 1:length(AE_T)
        xaxis = X(k)+X_vertex;
        yaxis = Y(k)+Y_vertex;
        hold on
        fill(xaxis,yaxis,AE_T(k),'linestyle', 'none');
    end
    title('无混叠视场内反演图像');
    xlabel('\xi');
    ylabel('\eta');
    axis square
 end
        