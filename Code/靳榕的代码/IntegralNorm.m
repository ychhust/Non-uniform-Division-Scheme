function sum_TB = IntegralNorm(s1,s2,N,d)

% ��TB(x)��������
% s1�������
% s2�����յ�
% N���ֻ��ֵ���
% d ���߳���(�Բ���Ϊ��λ)

% ʵ��
% s1 = 0;
% s2 = 0.2;
% N = 30;
% d = 0.8;
% sum_TB = IntNorm(s1,s2,N,d);

% ���ַ�ʽ
fov = linspace(s1,s2,N+1);


% ���λ���ֵ
for k = 1:length(fov)-1
    % ȡ�������е��ֵ
    x = (fov(k+1) + fov(k))/2;
    delta_x = sin(2*pi*d*fov(k+1)) - sin(2*pi*d*fov(k));
%     delta_x=fov(k+1)-fov(k);
%         y(k) = TB(x)/2/pi/d/sqrt(1-x^2)*delta_x;
      y(k) = (TB(fov(k+1))+TB(fov(k)))/2/2/pi/d/sqrt(1-x^2)*delta_x;
   
end

%���
sum_TB = sum(y);

    