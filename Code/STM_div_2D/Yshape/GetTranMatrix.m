function [M,inv_M] = GetTranMatrix()

% ��������任����
% �����������������120�ȵ�������ʾ
% �� OrthGetTranMatrix() �е����괹ֱ

v1 = [cos(pi/6);-sin(pi/6)];
v2 = [0;1];

% �任����
M = [v1 v2];
% ���任����
inv_M = inv(M);