function [extent_UV,Fov,uv_point]= GenerateUVCellofYShape(min_spacing,num,ant_pos)

% 计算Y形状阵网格
% min_spacing    间距
% num            天线数目
% extent_UV      Y形阵的扩展UV平面
% Fov            视场范围内像素点

% 重要说明
% 程序涉及到3个坐标系：
% （1） 普通直角 uv采样坐标系， 在该坐标系下，extent_UV 为正六边形
% （2） 两个120度间隔向量组成的坐标系， 在该坐标系下，extent_UV 搬移后可得到正方形
% （3） 两个60度间隔向量组成的坐标系，（该坐标系的两个向量分别与(2)中两个坐标系垂直）， 
%  extent_UV中可见度uv采样点FFT后得到亮温分布视场范围Fov在该坐标系内。



% 生成 num * num 的标准正方形向量
uv_square = GenerateSquareVector(num);

%%%%%%%%%%%%%%%%%%%%%%%%%%uv平面采样点%%%%%%%%%%%%%%%%%%%%%%%%%

% uv平面对正方形进行分割，分割成四个部分
[A_area,B_area,C_area,D_area] = SquareCutForYArray(num);

% 将采样点划分到四个部分中
[points_in_A,points_in_B,points_in_C,points_in_D] = UVPoint2AreaForYArray(uv_square,A_area,B_area,C_area,D_area);

% 正方形搬移成六边形
uv_move = Square2HexForYArray(uv_square,points_in_A,points_in_B,points_in_C,points_in_D);


% （2）坐标变换到坐标系(1)中,得到不考虑最小间距的extent_UV
[M,inv_M] = GetTranMatrix();
extent_UV_raw = M * ComplexVector2TwoDimArray(uv_move);

% 乘最小间隔获得采样点位置
extent_UV = min_spacing * TwoDimArray2ComplexVector(extent_UV_raw);


%%%%%%%%%%%%%%%%%%%%%%%%%%视场内像素点%%%%%%%%%%%%%%%%%%%%%%%%%

% Fov平面对正方形进行分割，分割成四个部分
[E_area,F_area,G_area,H_area] = SquareCutForYArrayFov(num);

% 将采样点划分到四个部分中
[points_in_E,points_in_F,points_in_G,points_in_H] = UVPoint2AreaForYArray(uv_square,E_area,F_area,G_area,H_area);

% 正方形搬移成六边形
Fov_move = Square2HexForYArrayFov(uv_square,points_in_E,points_in_F,points_in_G,points_in_H);

% （3）坐标变换到坐标系(1)中,得到不考虑最小间距的Fov
[OrM,inv_OrM] = OrthGetTranMatrix();
Fov_raw = TwoDimArray2ComplexVector(OrM * ComplexVector2TwoDimArray(Fov_move));


% 得到视场内像素点
Fov = (2*Fov_raw/sqrt(3)/num/min_spacing*exp(j*2*pi/3))';

% 程序到此处已经可以结束，结果也是正确的，但是成像像素点右边总比左边多2行，六边形有些不对称
% 因此将右边一行搬移到左边
%%%% 美化 %%%%% 
% Fov = FovRegularForYArray(Fov);

count = 0;
for p = 1:size(ant_pos,2)% 得到uv平面点的可见度分布
    for q = 1:size(ant_pos,2)
        count = count + 1;
        uv_point(1,count) = ant_pos(1,p)-ant_pos(1,q);% 基线
        uv_point(2,count)= ant_pos(2,p)-ant_pos(2,q);
    end
end


