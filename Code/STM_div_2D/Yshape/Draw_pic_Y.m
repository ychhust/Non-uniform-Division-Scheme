
interval = FovIntervalForY(ant_num,min_spacing);
% ȡ�ڵ�λԲ�ڵĵ�
% T = T(KeepPointsInCircle(DR_param.Fov));
% Fov = DR_param.Fov(KeepPointsInCircle(DR_param.Fov));
%  ȡĳһ�����ڵĵ�

T0 = T0(KeepPointsInRec(Fov,0.4,0.4));
T1 = T1(KeepPointsInRec(Fov,0.4,0.4));
T2 = T2(KeepPointsInRec(Fov,0.4,0.4));
FOV =Fov(KeepPointsInRec(Fov,0.4,0.4));

% x��y�������
X = real(Fov);
Y = imag(Fov);

% ���������
X_vertex = real(interval);
Y_vertex = imag(interval);


figure()
% ��ͼ
for k = 1:length(V0_2D)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,real(V0_2D(k)),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(visibility_2D)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,real(V0_2D(k)-visibility_2D(k)),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(visibility_non_2D)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,real(V0_2D(k)-visibility_non_2D(k)),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

X = real(FOV);
Y = imag(FOV);

figure()
for k = 1:length(T0)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T0(k),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(T1)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T1(k),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(T2)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T2(k),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(T1-T0)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T1(k)-T0(k),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square

figure()
for k = 1:length(T2-T0)
    xaxis = X(k)+X_vertex;
    yaxis = Y(k)+Y_vertex;
    hold on
    fill(xaxis,yaxis,T2(k)-T0(k),'linestyle', 'none');
end

% title(DR_param.title);
xlabel('\xi');
ylabel('\eta');
axis square


