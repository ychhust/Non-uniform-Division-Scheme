function uv_square = GenerateSquareVector(num)

% ���� num * num �ı�׼����������

uv_square = zeros(1,num*num);

count = 0;
for p = 0:num-1
    for q = 0:num-1
        count = count + 1;
        uv_square(count) =q+j*p;
    end
end

        