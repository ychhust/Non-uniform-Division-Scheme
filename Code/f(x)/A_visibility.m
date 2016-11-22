function visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector)
%   语法：
%   visibility=A_visibility(T_dist_extent,ant_num,antenna_pos,extent_UV,coef_vector)
% 
%   函数功能：
%   此函数为通过引导函数求取可见度函数模块，功能为：
%   读取无混叠视场、天线阵列、天线方向图信息，输出可见度函数信息。

%自相关矩阵求取
Scene_power = T_dist_extent(1,:); %源的功率向量
scene_theta = T_dist_extent(2,:); %源的位置向量
for antenna_seria = 1:ant_num
    real_coef_matrix(antenna_seria) = {coef_vector};%封装在cell中
end
for k = 1:ant_num %读取单元天线方向图
    coef_matrix(k,:) = cell2mat(real_coef_matrix(k));
end
for k=1:length(Scene_power)
    A(:,k)=sqrt(coef_matrix(:,k)).*[exp(2*pi*j*antenna_pos *scene_theta(k))].'; % 定义引导向量A：
end
self_correlation_matrix = A*diag(Scene_power)*A';% 求出信号自相关矩阵


%% 通过可见度函数进行反演
% x_len_raw= x_len + fill_zero;% 补零后的天线数
% 可见度函数通过对自相关函数冗余平均获得
count = 0;
% 得到uv平面点的可见度分布
for p = 1:length(antenna_pos )
    for q = 1:length(antenna_pos )
        count = count + 1;
        uv_point(count) = antenna_pos (p)-antenna_pos (q);% 基线
    end
end
self_correlation_vector = reshape(conj(self_correlation_matrix'),1,ant_num*ant_num);

small_num = 10^(-2);
visibility = zeros(size(extent_UV));% 可见度
count  = zeros(size(extent_UV));% 冗余平均次数
for k = 1:length(uv_point)
    x=extent_UV-uv_point(k);
    position = [];
    for m = 1:length(x)
        if abs(x(m)) < small_num
            position = m;
        end
    end
    if isempty(position) == 0   % 找到的位置非空
        visibility(position) = visibility(position)+self_correlation_vector(k);% 更新位置在position处的可见度
        count(position) = count(position) + 1;
    end
end
% 将得到的uv平面点的可见度冗余平均
for k = 1:length(count)
    if 0 ~= count(k)
        visibility(k) = visibility(k)/count(k);
    end
end