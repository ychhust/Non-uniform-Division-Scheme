function [M,inv_M] = OrthGetTranMatrix()

% ��������任����
% �����������������60�ȵ�������ʾ
% �� GetTranMatrix() �е����괹ֱ

v1 = [cos(pi/3);sin(pi/3)];
v2 = [1;0];

% �任����
M = [v1 v2];
% ���任����
inv_M = inv(M);