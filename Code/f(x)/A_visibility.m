function visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector)
%   �﷨��
%   visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector)
% 
%   �������ܣ�
%   �˺���Ϊͨ������������ȡ�ɼ��Ⱥ���ģ�飬����Ϊ��
%   ��ȡ�޻���ӳ����������С����߷���ͼ��Ϣ������ɼ��Ⱥ�����Ϣ��

%����ؾ�����ȡ
Scene_power = T_dist_extent(1,:); %Դ�Ĺ�������
scene_theta = T_dist_extent(2,:); %Դ��λ������
for antenna_seria = 1:ant_num
    real_coef_matrix(antenna_seria) = {coef_vector};%��װ��cell��
end
for k = 1:ant_num %��ȡ��Ԫ���߷���ͼ
    coef_matrix(k,:) = cell2mat(real_coef_matrix(k));
end
for k=1:length(Scene_power)
    A(:,k)=sqrt(coef_matrix(:,k)).*[exp(2*pi*j*antenna_pos *scene_theta(k))].'; % ������������A��
end
self_correlation_matrix = A*diag(Scene_power)*A';% ����ź�����ؾ���


%% ͨ���ɼ��Ⱥ������з���
% x_len_raw= x_len + fill_zero;% ������������
% �ɼ��Ⱥ���ͨ��������غ�������ƽ�����
count = 0;
% �õ�uvƽ���Ŀɼ��ȷֲ�
for p = 1:length(antenna_pos )
    for q = 1:length(antenna_pos )
        count = count + 1;
        uv_point(count) = antenna_pos (p)-antenna_pos (q);% ����
    end
end
self_correlation_vector = reshape(conj(self_correlation_matrix'),1,ant_num*ant_num);

small_num = 10^(-2);
visibility = zeros(size(extent_UV));% �ɼ���
count  = zeros(size(extent_UV));% ����ƽ������
for k = 1:length(uv_point)
    x=extent_UV-uv_point(k);
    position = [];
    for m = 1:length(x)
        if abs(x(m)) < small_num
            position = m;
        end
    end
    if isempty(position) == 0   % �ҵ���λ�÷ǿ�
        visibility(position) = visibility(position)+self_correlation_vector(k);% ����λ����position���Ŀɼ���
        count(position) = count(position) + 1;
    end
end
% ���õ���uvƽ���Ŀɼ�������ƽ��
for k = 1:length(count)
    if 0 ~= count(k)
        visibility(k) = visibility(k)/count(k);
    end
end