function Fov_move = Square2HexForYArrayFov(Fov_point,tab_E,tab_F,tab_G,tab_H);

% �����ΰ��Ƴ�������

% ��ʼ��
Fov_move = Fov_point;
%������
num = sqrt(length(Fov_point));

% ����
% E ���򱣳ֲ���
% Fov_move(tab_E) = Fov_point(tab_E);

% F ���� x�� ������
Fov_move(tab_F) = Fov_point(tab_F)- num;

% G ���� x�� y�� ������
Fov_move(tab_G) = Fov_point(tab_G)- num - num*j;

% H ����  y�� ������
Fov_move(tab_H) = Fov_point(tab_H)- num*j;