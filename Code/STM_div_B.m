clear all; clc;close all; 
 
%% 辐射计系统参数定义

%积分时间。单位：秒              
sys_param.integral_time = 1;    %
%阵列排布类型。  *AntennaPositionHELP()     
sys_param.array_type = 'ula';      
% 阵元数    
sys_param.ant_num = 30;               
%带宽。单位：Hz                    
sys_param.band = 100*10^6;
%空间theta角度离散划分   *SpaceDivisionHELP()
% sys_param.div = 'auto'; 
sys_param.div = 50;

 %射频信号中心频率，单位:Hz
sys_param.center_freq = 36.4e9;
 
%%基线类参数定义
%基线排列方式单位为波长：
% 最小间距
sys_param.min_spacing = 0.8;    
%接收机温度，即TB。单位：K
sys_param.T_rec = 300;

%% 场景定义
STM_param.extentpoint_simu = 1;      %是否仿真，0表示不仿真，1表示仿真
STM_param.extentpoint_place_start = [-20 0];       %来波方向起始位置，度
STM_param.extentpoint_power = [250 300];    %源的能量（K）
STM_param.extentpoint_place_end = [0 15];       %来波方向终止位置，度
  
%% 通道及误差参数定义
%天线类型    
SRM_param.antenna_pattern_info.antenna_type = 'isotropic';             
%天线长宽信息
SRM_param.antenna_pattern_info.antenna_size = 0.004;  

% % 天线位置生成
array_type=sys_param.array_type;
array_num=sys_param.ant_num ; 
switch array_type
    case 'mrla'
          %最小冗余阵ant_num
          ant_num=sys_param.ant_num;  
          r=fix((ant_num-4)/6);                      % r,l为标识阵元间隔,间隔重复次数的变量
          l=ant_num-4*r-3;
          aperture_length=4*r*r+8*r+4*r*l+3*l+3;     %aperture_length为阵列的最大长度
          element_spacing=zeros(1,ant_num-1);
          for i=1:r
              element_spacing(i)=1;
          end
          element_spacing(r+1)=r+1;
          for i=r+2:2*r+1
              element_spacing(i)=2*r+1;
          end
          for i=2*r+2:2*r+1+l
              element_spacing(i)=4*r+3;
          end
          for i=2*r+2+l:3*r+2+l
              element_spacing(i)=2*r+2;
          end
          for i=3*r+3+l:ant_num-1
              element_spacing(i)=1;
          end       % spacing为MRLA排列方式下的各阵元间隔
          r=fix((ant_num-4)/6)+1;
          l=ant_num-4*r-3;
          temp=4*r*r+8*r+4*r*l+3*l+3;                %temp为第二次计算的aperture_length值

          if(temp>aperture_length)                   %如果temp大于最初计算的aperture_length值,就将其设为阵列的最大长度
              aperture_length=temp;
          for i=1:r
              element_spacing(i)=1;
          end
          element_spacing(r+1)=r+1;
          for i=r+2:2*r+1
              element_spacing(i)=2*r+1;
          end
          for i=2*r+2:2*r+1+l
              element_spacing(i)=4*r+3;
          end
          for i=2*r+2+l:3*r+2+l
              element_spacing(i)=2*r+2;
          end
          for i=3*r+3+l:ant_num-1
              element_spacing(i)=1;
          end       % spacing为MRLA排列方式下的各阵元间隔
          end

    norm_ant_position=zeros(1,ant_num);             % ant_position为各阵元的位置
    for i=1:ant_num
        for j=1:i-1
        	norm_ant_position(i)=norm_ant_position(i)+element_spacing(j);
        end
    end
          SRM_param.ant_pos = norm_ant_position;
     case 'ula'
            %均匀直线阵
          SRM_param.ant_pos = [0:array_num-1];
end

%% 反演参数定义

switch array_type
    case 'mrla'
          sys_param.inverse_name = 'fft1D';
    case 'ula'
          sys_param.inverse_name = 'fft1D';
end
% 补零个数
IAM_param.fill_zero = 0;

%% %%%%%%%%%%%%%%%%%%%仿真运算%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 场景部分
ant_pos=SRM_param.ant_pos ;
min_spacing = sys_param.min_spacing; 
ant_num = length(ant_pos(1,:));
switch array_type
    
    case 'mrla'
        %最小冗余阵
        array_placement = SRM_param.ant_pos;
        x_len = array_placement(array_num) - array_placement(1);
        y_len = 0;
        
    case 'ula'
        %均匀直线阵
        x_len = array_num-1;
        y_len = 0;
end
extent_UV = -x_len:x_len;
% 绝对位置 
extent_UV = extent_UV*min_spacing;
% 计算视场内分辨率单元点与网格点间的关系
Fov0 = -extent_UV/(2*x_len+1)/min_spacing/min_spacing;
% delta0 = (max(Fov0)-min(Fov0))/length(Fov0);
delta0 = 1/length(Fov0);

%%%%%%展源处理部分%%%%%%%
%积分运算
F=@(x)exp(1i*2*pi*x*1*min_spacing);
x1=sind(STM_param.extentpoint_place_start(1));
y1=sind(STM_param.extentpoint_place_end(1));
x2=sind(STM_param.extentpoint_place_start(2));
y2=sind(STM_param.extentpoint_place_end(2));
p1=STM_param.extentpoint_power(1);
p2=STM_param.extentpoint_power(2);
V0=p1/(max(Fov0)-min(Fov0))*quadl(@(x)F(x),x1,y1)+p2/(max(Fov0)-min(Fov0))*quadl(@(x)F(x),x2,y2);

div=sys_param.div ; 
N=60;
V1=zeros(1,N);
V2=zeros(1,N);
for i=(1:N)*div
    

if (ischar(div)==1) % 'auto' 按照分辨率单元划分
    Fov = Fov0;
    delta = delta0;
else
    % x 轴范围    
    x_scope = [min(real(Fov0)) max(real(Fov0))];
    % 按给定份数划分
    Fov = linspace(x_scope(1),x_scope(2),i);
%     delta = (x_scope(2) - x_scope(1)) /i;
    delta = 1 /i;
end
Fov =  asind(Fov);
T_dist_extent = [];
power=STM_param.extentpoint_power;
point_start=STM_param.extentpoint_place_start;
point_end=STM_param.extentpoint_place_end;

for k = 1:length(power)
    for point = 1:length(Fov)
        if (Fov(point)>point_start(k)) && (Fov(point)<point_end(k))
            c1 = [power(k)*delta ; Fov(point)];
            T_dist_extent = [T_dist_extent c1];
        end
    end
end

%% 自相关矩阵获取
antenna_pattern_info = SRM_param.antenna_pattern_info;   %天线方向图类
antenna_num = sys_param.ant_num ;      %天线个数从结构体中获取
T_rec = sys_param.T_rec;                                 %通道温度
%channel_info = SRM_param.channel_info;                   %通道信息类
%采样点数等于带宽乘积分时间
sampling_num = floor(sys_param.band*sys_param.integral_time); 
c = 3*10^8;                                                 %光速
antenna_pattern_info.wavelength = c/sys_param.center_freq;  %获取天线工作波长
angle_range = T_dist_extent; 
angle_range(1,:) = [];                %去掉亮温分布矩阵第一行中的亮温，保留角度信息

%%产生天线方向图
antenna_type = antenna_pattern_info.antenna_type; %天线类型从结构体中获取
antenna_size = antenna_pattern_info.antenna_size; %天线尺寸从结构体中获取
wavelength = antenna_pattern_info.wavelength;     %天线工作波长从结构体中获取
ant_pos=SRM_param.ant_pos ;
ant_pos =  min_spacing*ant_pos;
switch lower(antenna_type)
    case 'rectangle'% 矩形口面
        lx = pi*antenna_size(1)/wavelength;
        for k = 1:length(angle_range)
            coef_vector(k) = abs(cosd(angle_range(k))*sinc(lx*sind(angle_range(k))));
        end
    case 'isotropic'%理想，各个方向均为1
        coef_vector = ones(size(angle_range));
    case'circle'%圆形口面
        Ba = 2*pi*antenna_size/wavelength;
        for k = 1:length(angle_range)
            if (abs(sind(angle_range(k)))<=0.0001) %避免分母为0时出错
                 coef_vector(k) = 1;
            else
                 coef_vector(k) = abs(2*real(besselj(1,Ba*sind(angle_range(k))))/(Ba*sind(angle_info(k))));
            end
        end
end

%%自相关矩阵求取
scene_power = T_dist_extent(1,:); %源的功率向量
scene_theta = T_dist_extent(2,:); %源的位置向量
for antenna_seria = 1:antenna_num
%     real_coef_matrix(:)=[];
    real_coef_matrix(antenna_seria) = {coef_vector};%封装在cell中
end
for k = 1:antenna_num %读取单元天线方向图
    coef_matrix(k,:) = cell2mat(real_coef_matrix(k));
end           
% 定义引导向量A：
for k=1:length(scene_power)
    A(:,k)=sqrt(coef_matrix(:,k)).*[exp(2*pi*j*ant_pos*sind(scene_theta(k)))].';       
end
 % 求出信号自相关矩阵
    self_correlation_matrix = A*diag(scene_power)*A';
    
    
%% 通过可见度函数进行反演
 % 补零后的天线数 
 x_len_raw= x_len + IAM_param.fill_zero;
 % 可见度函数通过对自相关函数冗余平均获得
count = 0;
% 得到uv平面点的可见度分布
for p = 1:length(ant_pos)
    for q = 1:length(ant_pos)
        count = count + 1;
        % 基线
        uv_point(count) = ant_pos(p)-ant_pos(q);
    end
end
self_correlation_vector = reshape(conj(self_correlation_matrix'),1,antenna_num*antenna_num);

small_num = 10^(-2);
visibility = zeros(size(extent_UV));% 可见度
count  = zeros(size(extent_UV));% 冗余平均次数
for k = 1:length(uv_point)
    x=extent_UV-uv_point(k);
    position = [];
    for m = 1:length(x)
        if abs(x(m)) < small_num
            position = m;
        end
    end
    % 找到的位置非空
    if isempty(position) == 0        
        % 更新位置在position处的可见度
        visibility(position) = visibility(position)+self_correlation_vector(k);
        count(position) = count(position) + 1; 
    end
end
% 将得到的uv平面点的可见度冗余平均
for k = 1:length(count)
    if 0 ~= count(k)
        visibility(k) = visibility(k)/count(k);
    end
end
V1(i/div)=real(visibility(31));
V2(i/div)=imag(visibility(31));
coef_matrix(:)=[];
end
Vr=ones(1,N)*real(V0);
Vi=ones(1,N)*imag(V0);
figure(1)
subplot(2,1,1)
plot((1:N)*div,V1,'b',(1:N)*div,Vr,'r','LineWidth',2)
legend('可见度实部变化','可见度实部理论值')
xlabel('场景分隔点数')
ylabel('可见度实部')
title('可见度实部与场景分隔点数的关系')

subplot(2,1,2)
plot((1:N)*div,V2,'b',(1:N)*div,Vi,'r','LineWidth',2)
legend('可见度虚部变化','可见度虚部理论值')
xlabel('场景分隔点数')
ylabel('可见度虚部')
title('可见度虚部与场景分隔点数的关系')


%%一维傅里叶变换
T = fftshift(ifft(ifftshift(visibility)));
% 取图像实部
T = real(T);
% 补偿补零的能量
T = T*x_len/x_len_raw;

figure(2)
subplot(2,1,1)
plot((1:N)*div,abs(V1-Vr),'LineWidth',2)
xlabel('场景分隔点数')
ylabel('可见度实部相对误差')
subplot(2,1,2)
plot((1:N)*div,abs(V2-Vi),'LineWidth',2)
xlabel('场景分隔点数')
ylabel('可见度虚部相对误差')

figure(3)
plot(-extent_UV/(2*x_len+1)/min_spacing/min_spacing,T,'-','LineWidth',2)
axis square



    




