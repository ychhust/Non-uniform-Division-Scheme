function y = ComplexVector2TwoDimArray(x)

% ��n*2�ľ���ת��Ϊn*1�ĸ�������
% �����һ�б�ʾ������ʵ�����ڶ��б�ʾ�������鲿
% ������ y = TwoDimArray2ComplexVector(x)

y = [real(x) ; imag(x)];