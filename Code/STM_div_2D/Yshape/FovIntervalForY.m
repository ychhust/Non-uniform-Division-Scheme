function interval = FovIntervalForY(ant_num,min_spacing)

% ���Y���ӳ���Χ���ص���Χ�ɵ������Σ��ø�����ʾ

% �뾶
% r = 1/sqrt(3)/ant_num/min_spacing;
r = 2/3/ant_num/min_spacing;
% �Ƕ�
angle = pi/6:pi/3:11*pi/6;
% �õ���0Ϊ���ĵ������ζ���
interval = r*exp(j*angle);
