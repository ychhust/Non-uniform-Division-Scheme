function tab = KeepPointsInRec(point_raw,l_len,m_len)

% �ҳ������ڵ�λԲ�ڵĵ��Ӧ��λ��

tab = [];
for k = 1:length(point_raw)
    if (abs(real(point_raw(k))) < l_len) && (abs(imag(point_raw(k))) < m_len)
        tab = [tab k];
    end
end