function interval = FovIntervalFor2DArray(min_spacing,x_len,y_len)

% ���Y���ӳ���Χ���ص���Χ�ɵ������Σ��ø�����ʾ

% �߳�
r_x = 1/2/min_spacing/(2*x_len);
r_y = 1/2/min_spacing/(2*y_len);

% �õ���0Ϊ���ĵ������ζ���
interval = [r_x r_x -r_x -r_x] + j*[r_y -r_y -r_y r_y];