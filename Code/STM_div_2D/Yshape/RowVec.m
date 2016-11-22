function v1 = RowVec(v)

% 保证v是一个行向量
    % v如果是列向量，则转化为行向量
    % v如果是行向量，则保持不变
    
    
if    size(v,2) == 1
    v1= conj(v)';
else
    v1 = v;
end