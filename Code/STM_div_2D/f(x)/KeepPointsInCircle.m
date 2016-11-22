function tab = KeepPointsInCircle(point_raw)

% 找出所有在单位圆内的点对应的位置

tab = [];
for k = 1:length(point_raw)
    if abs(point_raw(k)) < 1
        tab = [tab k];
    end
end