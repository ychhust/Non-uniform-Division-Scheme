function position = FindZero(x)

% Ѱ��������ӽ�0����

position = [];
% ���ڱȽϵ�С��
small_num = 10^(-2);

for k = 1:length(x)
    if abs(x(k)) < small_num
        position = k;
    end
end