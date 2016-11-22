function uv_square = GenerateSquareVector(num)

% 生成 num * num 的标准正方形向量

uv_square = zeros(1,num*num);

count = 0;
for p = 0:num-1
    for q = 0:num-1
        count = count + 1;
        uv_square(count) =q+j*p;
    end
end

        