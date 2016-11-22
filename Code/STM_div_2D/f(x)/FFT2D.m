function T = FFT2D(visibility,x_len,y_len)
%   �﷨��
%   T = FFT2D(visibility,x_len,y_len)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�����·���ģ�飬����Ϊ��
%   ��ȡ�ɼ��Ⱥ��������߷ֲ���Ϣ�������ά����������Ϣ��

    % ���ٶ�ά����Ҷ�任
    % visibility �ɼ���
    % T          ����


    % �ɼ�������ת��Ϊ����
    visibility_matrix = reshape(visibility,2*x_len+1,2*y_len+1);

    % ��ά����Ҷ�仯
    % ����Ҷ���ݵõ�ͼ��
    T_matrix = real(ifft2(ifftshift(visibility_matrix)));
    % ͼ�����
    T_matrix = fftshift(T_matrix);

    % ����ת��Ϊ����
%     T = reshape(T_matrix,(2*x_len+1)*(2*y_len+1),1);
    T=T_matrix;
    