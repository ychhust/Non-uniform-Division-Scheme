function [AE_scope_line,AE_scope] = GenerateAEScope2DArray(min_spacing)

% ��ö�ά���е��޻���ӳ��� �� ��Χ

% ��Բ����Ϊ���·���(Խ��Խ׼ȷ)
lin_num = 100;
circle = exp(j*2*pi*[0:1/lin_num:1-1/lin_num]);

% Բ����Բ��֮��ļ��
center_int = 1/min_spacing;
% (0,0)�����4�����Բ
o1 = center_int + circle;
o2 = j*center_int + circle;
o3 = -1*center_int + circle*exp(j*pi); %��������ʼ��
o4 = -j*center_int + circle;

% �ӳ���Χ�ĸ���
Fov = ([1 -1 -1 1] + [1 1 -1 -1]*j)/2/min_spacing;
% Χ�ɵķ���ı���
Fov = [Fov Fov(1)];

% �ֱ�ȡ�ӳ��ڵ�����
in_1 = inpolygon(real(o1),imag(o1),real(Fov),imag(Fov));
in_2 = inpolygon(real(o2),imag(o2),real(Fov),imag(Fov));
in_3 = inpolygon(real(o3),imag(o3),real(Fov),imag(Fov));
in_4 = inpolygon(real(o4),imag(o4),real(Fov),imag(Fov));
AE_scope_line_1 = o1(in_1);
AE_scope_line_2 = o2(in_2);
AE_scope_line_3 = o3(in_3);
AE_scope_line_4 = o4(in_4);
% �ϲ�
AE_scope_line = [AE_scope_line_4;AE_scope_line_3;AE_scope_line_2;AE_scope_line_1];

if center_int/sqrt(2) >= 1
    AE_scope = [Fov(4) AE_scope_line_4 Fov(3) AE_scope_line_3 Fov(2) AE_scope_line_2 Fov(1) AE_scope_line_1 Fov(4)];
else
    % �ĸ�����
    cross = ([1 -1 -1 1] + [1 1 -1 -1]*j) * (center_int/2 - sqrt(1/2 - center_int^2/4));
    AE_scope_line_vec = [AE_scope_line_4 AE_scope_line_3 AE_scope_line_2 AE_scope_line_1];;
    in = inpolygon(real(AE_scope_line_vec),imag(AE_scope_line_vec),real(cross),imag(cross));
    AE_scope = AE_scope_line_vec(in);
    AE_scope = [AE_scope AE_scope(1)];
end