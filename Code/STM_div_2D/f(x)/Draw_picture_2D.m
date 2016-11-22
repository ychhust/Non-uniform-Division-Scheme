%   �﷨��
%   Draw_picture_2D()
% 
%   �������ܣ�
%   �˺���Ϊ��ͼģ�飬����Ϊ��
%   ������������Ŀ�곡�������ݷ����������ɼ��Ⱥ�����


%% ʮ������ɼ��Ȳв�

V0_2D = reshape(V0_2D,(2*x_len+1),(2*y_len+1));
visibility_2D = reshape(visibility_2D,(2*x_len+1),(2*y_len+1));
visibility_non_2D= reshape(visibility_non_2D,(2*x_len+1),(2*y_len+1));

 xaxis = -x_len:x_len;
 yaxis = -y_len:y_len;
 figure()
 imagesc(xaxis,yaxis,real(V0_2D))
 title('����ɼ���ʵ��')
 axis square
 colorbar
 
 figure()
 imagesc(xaxis,yaxis,real(visibility_2D-V0_2D))
 title('���Ȼ��ֿɼ��Ȳв�')
 axis square
 colorbar
 
 figure()
 imagesc(xaxis,yaxis,real(visibility_non_2D-V0_2D))
 title('�Ǿ��Ȼ��ֿɼ��Ȳв�')
 axis square
 colorbar
%% ʮ�������²в� 
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
title('���������������')
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
title('���Ȼ��ֳ�������')
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
title('�Ǿ��Ȼ��ֳ�������')
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
title('���Ȼ��ֳ������²в�')
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
title('�Ǿ��Ȼ��ֳ������²в�')
axis square
colorbar

%% y����ɼ��Ȳв�
% r = 2/3/ant_num/min_spacing;% �뾶
% angle = pi/6:pi/3:11*pi/6;% �Ƕ�
% interval = r*exp(j*angle);% �õ���0Ϊ���ĵ������ζ���
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
% title('����ɼ���ʵ��')
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
% title('���Ȼ��ֿɼ���ʵ���в�')
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
% title('�Ǿ��Ȼ��ֿɼ���ʵ���в�')
% axis square
% colorbar

%% y�������²в�

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
% title('���������������')
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
% title('���Ȼ��ֳ�������')
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
% title('�Ǿ��Ȼ��ֳ�������')
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
% title('���Ȼ��ֳ������²в�')
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
% title('�Ǿ��Ȼ��ֳ������²в�')
% axis square
% colorbar
% 
