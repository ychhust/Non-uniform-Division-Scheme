function tab = KeepPointsInCircle(point_raw)

% �ҳ������ڵ�λԲ�ڵĵ��Ӧ��λ��

tab = [];
for k = 1:length(point_raw)
    if abs(point_raw(k)) < 1
        tab = [tab k];
    end
end