function draw_pic_2D(T,Fov,interval,AE_scope_line,AE_scope)
figure()

% ȡ�ڵ�λԲ�ڵĵ�
T = T(KeepPointsInCircle(Fov));
Fov = Fov(KeepPointsInCircle(Fov));

% x��y�������
X = real(Fov);
Y = imag(Fov);

% ���������
X_vertex = real(interval);
Y_vertex = imag(interval);

% ��ͼ
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
% �޻���ӳ���Χ����
if isempty(AE_scope_line) == 0
    for k = 1:size(AE_scope_line,1)     
        hold on
        plot(real(AE_scope_line(k,:)),imag(AE_scope_line(k,:)),'k-','LineWidth',1.5);
    end
end

% �޻���ӳ���Χ
 if isempty(AE_scope) == 0
    in = inpolygon(real(Fov),imag(Fov),real(AE_scope),imag(AE_scope));
    AE_Fov = Fov(in);
    AE_T = T(in);
    % x��y�������
    X = real(AE_Fov);
    Y = imag(AE_Fov);
    figure()
    % ��ͼ
    for k = 1:length(AE_T)
        xaxis = X(k)+X_vertex;
        yaxis = Y(k)+Y_vertex;
        hold on
        fill(xaxis,yaxis,AE_T(k),'linestyle', 'none');
    end
    title('�޻���ӳ��ڷ���ͼ��');
    xlabel('\xi');
    ylabel('\eta');
    axis square
 end
        