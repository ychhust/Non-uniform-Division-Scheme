function v1 = RowVec(v)

% ��֤v��һ��������
    % v���������������ת��Ϊ������
    % v��������������򱣳ֲ���
    
    
if    size(v,2) == 1
    v1= conj(v)';
else
    v1 = v;
end