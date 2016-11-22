function tab = KeepPointsInRec(point_raw,l_len,m_len)

% 找出所有在单位圆内的点对应的位置

tab = [];
for k = 1:length(point_raw)
    if (abs(real(point_raw(k))) < l_len) && (abs(imag(point_raw(k))) < m_len)
        tab = [tab k];
    end
end