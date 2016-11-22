function [points_in_A,points_in_B,points_in_C,points_in_D] = UVPoint2AreaForYArray(uv_point,A_area,B_area,C_area,D_area)

% �������㻮�ֵ��ĸ�������
% uv_point     uvƽ�������
% A_area       A����

% points_in_A  ����Щ����A������

% uvƽ�����
num = length(uv_point);
% ����λ�ñ��
table = 1:num;

% A����
% �ж�uv�������Ƿ��ڸ�������
in_A = inpolygon(real(uv_point),imag(uv_point),A_area(1,:),A_area(2,:));
% ��ȡ�������ڵ����в������λ��
points_in_A = table(in_A);


% B����
in_B = inpolygon(real(uv_point),imag(uv_point),B_area(1,:),B_area(2,:));
points_in_B = table(in_B);


% C����
in_C = inpolygon(real(uv_point),imag(uv_point),C_area(1,:),C_area(2,:));
points_in_C = table(in_C);


% D����
in_D = inpolygon(real(uv_point),imag(uv_point),D_area(1,:),D_area(2,:));
points_in_D = table(in_D);
