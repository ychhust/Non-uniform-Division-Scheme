function uv_point=UV_point(ant_pos,min_spacing)


    count = 0;
    % 得到uv平面点的可见度分布
    for p = 1:size(ant_pos,2)
        for q = 1:size(ant_pos,2)
            count = count + 1;
            % 基线
            uv_point(1,count) = ant_pos(1,p)-ant_pos(1,q);
            uv_point(2,count)= ant_pos(2,p)-ant_pos(2,q);
        end
    end
    uv_point = uv_point*min_spacing;
    uv_point= uv_point(1,:) + j*uv_point(2,:);