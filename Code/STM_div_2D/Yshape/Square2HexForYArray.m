function uv_move = Square2HexForYArray(uv_point,tab_A,tab_B,tab_C,tab_D);

% �����ΰ��Ƴ�������
% ��Hex2SquareForYArray��Ϊ���任��ͼ�λ��ֺ���


% ��ʼ��
uv_move = uv_point;
%������
num = sqrt(length(uv_point));

% ����
% A ���򱣳ֲ���
% uv_move(tab_A) = uv_point(tab_A);

% B ���� x�� ������
uv_move(tab_B) = uv_point(tab_B)- num;

% C ���� x�� y�� ������
uv_move(tab_C) = uv_point(tab_C)- num - num*j;

% D ����  y�� ������
uv_move(tab_D) = uv_point(tab_D)- num*j;
