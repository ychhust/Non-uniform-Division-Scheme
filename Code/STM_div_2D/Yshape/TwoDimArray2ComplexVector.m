function y = TwoDimArray2ComplexVector(x)

% ��n*1�ĸ�������ת��Ϊn*2�ľ���
% �����һ�б�ʾ������ʵ�����ڶ��б�ʾ�������鲿
% ������ y = ComplexVector2TwoDimArray(x)

y = x(1,:) + j*x(2,:);