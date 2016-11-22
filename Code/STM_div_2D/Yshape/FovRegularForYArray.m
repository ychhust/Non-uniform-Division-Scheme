function Fov_adjust = FovRegularForYArray(Fov)

% ³õÊ¼»¯
Fov_adjust = Fov;

adjust_amount = 10^(-2);
real_Fov = real(Fov);
rightmost = max(real_Fov);
leftmost = min(real_Fov);
span = rightmost - leftmost + (abs(Fov(1)-Fov(2)))/2;

for k = 1:length(Fov)
    if real_Fov(k) > rightmost - adjust_amount
        Fov_adjust(k) = Fov_adjust(k) - span;
    end
end