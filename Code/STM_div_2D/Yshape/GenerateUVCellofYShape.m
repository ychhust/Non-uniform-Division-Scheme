function [extent_UV,Fov,uv_point]= GenerateUVCellofYShape(min_spacing,num,ant_pos)

% ����Y��״������
% min_spacing    ���
% num            ������Ŀ
% extent_UV      Y�������չUVƽ��
% Fov            �ӳ���Χ�����ص�

% ��Ҫ˵��
% �����漰��3������ϵ��
% ��1�� ��ֱͨ�� uv��������ϵ�� �ڸ�����ϵ�£�extent_UV Ϊ��������
% ��2�� ����120�ȼ��������ɵ�����ϵ�� �ڸ�����ϵ�£�extent_UV ���ƺ�ɵõ�������
% ��3�� ����60�ȼ��������ɵ�����ϵ����������ϵ�����������ֱ���(2)����������ϵ��ֱ���� 
%  extent_UV�пɼ���uv������FFT��õ����·ֲ��ӳ���ΧFov�ڸ�����ϵ�ڡ�



% ���� num * num �ı�׼����������
uv_square = GenerateSquareVector(num);

%%%%%%%%%%%%%%%%%%%%%%%%%%uvƽ�������%%%%%%%%%%%%%%%%%%%%%%%%%

% uvƽ��������ν��зָ�ָ���ĸ�����
[A_area,B_area,C_area,D_area] = SquareCutForYArray(num);

% �������㻮�ֵ��ĸ�������
[points_in_A,points_in_B,points_in_C,points_in_D] = UVPoint2AreaForYArray(uv_square,A_area,B_area,C_area,D_area);

% �����ΰ��Ƴ�������
uv_move = Square2HexForYArray(uv_square,points_in_A,points_in_B,points_in_C,points_in_D);


% ��2������任������ϵ(1)��,�õ���������С����extent_UV
[M,inv_M] = GetTranMatrix();
extent_UV_raw = M * ComplexVector2TwoDimArray(uv_move);

% ����С�����ò�����λ��
extent_UV = min_spacing * TwoDimArray2ComplexVector(extent_UV_raw);


%%%%%%%%%%%%%%%%%%%%%%%%%%�ӳ������ص�%%%%%%%%%%%%%%%%%%%%%%%%%

% Fovƽ��������ν��зָ�ָ���ĸ�����
[E_area,F_area,G_area,H_area] = SquareCutForYArrayFov(num);

% �������㻮�ֵ��ĸ�������
[points_in_E,points_in_F,points_in_G,points_in_H] = UVPoint2AreaForYArray(uv_square,E_area,F_area,G_area,H_area);

% �����ΰ��Ƴ�������
Fov_move = Square2HexForYArrayFov(uv_square,points_in_E,points_in_F,points_in_G,points_in_H);

% ��3������任������ϵ(1)��,�õ���������С����Fov
[OrM,inv_OrM] = OrthGetTranMatrix();
Fov_raw = TwoDimArray2ComplexVector(OrM * ComplexVector2TwoDimArray(Fov_move));


% �õ��ӳ������ص�
Fov = (2*Fov_raw/sqrt(3)/num/min_spacing*exp(j*2*pi/3))';

% ���򵽴˴��Ѿ����Խ��������Ҳ����ȷ�ģ����ǳ������ص��ұ��ܱ���߶�2�У���������Щ���Գ�
% ��˽��ұ�һ�а��Ƶ����
%%%% ���� %%%%% 
% Fov = FovRegularForYArray(Fov);

count = 0;
for p = 1:size(ant_pos,2)% �õ�uvƽ���Ŀɼ��ȷֲ�
    for q = 1:size(ant_pos,2)
        count = count + 1;
        uv_point(1,count) = ant_pos(1,p)-ant_pos(1,q);% ����
        uv_point(2,count)= ant_pos(2,p)-ant_pos(2,q);
    end
end


