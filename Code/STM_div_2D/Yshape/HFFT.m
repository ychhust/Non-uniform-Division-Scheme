function  T = HFFT(visibility)

% ���������θ���Ҷ�任
% visibility �ɼ���
% T          ����

% ���߸���
ant_num = sqrt(length(visibility));

% �ɼ�������ת��Ϊ����
visibility_matrix = reshape(visibility,ant_num,ant_num);

% ��ά���ٸ���Ҷ�任
T_matrix = real(ifft2(visibility_matrix));

% ����ת��Ϊ����
T = reshape(T_matrix,ant_num*ant_num,1);
% T=T_matrix;