clear all; clc;close all; 
 
%% �����ϵͳ��������

%����ʱ�䡣��λ����              
sys_param.integral_time = 1;    %
%�����Ų����͡�  *AntennaPositionHELP()     
sys_param.array_type = 'ula';      
% ��Ԫ��    
sys_param.ant_num = 30;               
%������λ��Hz                    
sys_param.band = 100*10^6;
%�ռ�theta�Ƕ���ɢ����   *SpaceDivisionHELP()
% sys_param.div = 'auto'; 
sys_param.div = 50;

 %��Ƶ�ź�����Ƶ�ʣ���λ:Hz
sys_param.center_freq = 36.4e9;
 
%%�������������
%�������з�ʽ��λΪ������
% ��С���
sys_param.min_spacing = 0.8;    
%���ջ��¶ȣ���TB����λ��K
sys_param.T_rec = 300;

%% ��������
STM_param.extentpoint_simu = 1;      %�Ƿ���棬0��ʾ�����棬1��ʾ����
STM_param.extentpoint_place_start = [-20 0];       %����������ʼλ�ã���
STM_param.extentpoint_power = [250 300];    %Դ��������K��
STM_param.extentpoint_place_end = [0 15];       %����������ֹλ�ã���
  
%% ͨ��������������
%��������    
SRM_param.antenna_pattern_info.antenna_type = 'isotropic';             
%���߳�����Ϣ
SRM_param.antenna_pattern_info.antenna_size = 0.004;  

% % ����λ������
array_type=sys_param.array_type;
array_num=sys_param.ant_num ; 
switch array_type
    case 'mrla'
          %��С������ant_num
          ant_num=sys_param.ant_num;  
          r=fix((ant_num-4)/6);                      % r,lΪ��ʶ��Ԫ���,����ظ������ı���
          l=ant_num-4*r-3;
          aperture_length=4*r*r+8*r+4*r*l+3*l+3;     %aperture_lengthΪ���е���󳤶�
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
          end       % spacingΪMRLA���з�ʽ�µĸ���Ԫ���
          r=fix((ant_num-4)/6)+1;
          l=ant_num-4*r-3;
          temp=4*r*r+8*r+4*r*l+3*l+3;                %tempΪ�ڶ��μ����aperture_lengthֵ

          if(temp>aperture_length)                   %���temp������������aperture_lengthֵ,�ͽ�����Ϊ���е���󳤶�
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
          end       % spacingΪMRLA���з�ʽ�µĸ���Ԫ���
          end

    norm_ant_position=zeros(1,ant_num);             % ant_positionΪ����Ԫ��λ��
    for i=1:ant_num
        for j=1:i-1
        	norm_ant_position(i)=norm_ant_position(i)+element_spacing(j);
        end
    end
          SRM_param.ant_pos = norm_ant_position;
     case 'ula'
            %����ֱ����
          SRM_param.ant_pos = [0:array_num-1];
end

%% ���ݲ�������

switch array_type
    case 'mrla'
          sys_param.inverse_name = 'fft1D';
    case 'ula'
          sys_param.inverse_name = 'fft1D';
end
% �������
IAM_param.fill_zero = 0;

%% %%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ��������
ant_pos=SRM_param.ant_pos ;
min_spacing = sys_param.min_spacing; 
ant_num = length(ant_pos(1,:));
switch array_type
    
    case 'mrla'
        %��С������
        array_placement = SRM_param.ant_pos;
        x_len = array_placement(array_num) - array_placement(1);
        y_len = 0;
        
    case 'ula'
        %����ֱ����
        x_len = array_num-1;
        y_len = 0;
end
extent_UV = -x_len:x_len;
% ����λ�� 
extent_UV = extent_UV*min_spacing;
% �����ӳ��ڷֱ��ʵ�Ԫ����������Ĺ�ϵ
Fov0 = -extent_UV/(2*x_len+1)/min_spacing/min_spacing;
% delta0 = (max(Fov0)-min(Fov0))/length(Fov0);
delta0 = 1/length(Fov0);

%%%%%%չԴ������%%%%%%%
%��������
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
    

if (ischar(div)==1) % 'auto' ���շֱ��ʵ�Ԫ����
    Fov = Fov0;
    delta = delta0;
else
    % x �᷶Χ    
    x_scope = [min(real(Fov0)) max(real(Fov0))];
    % ��������������
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

%% ����ؾ����ȡ
antenna_pattern_info = SRM_param.antenna_pattern_info;   %���߷���ͼ��
antenna_num = sys_param.ant_num ;      %���߸����ӽṹ���л�ȡ
T_rec = sys_param.T_rec;                                 %ͨ���¶�
%channel_info = SRM_param.channel_info;                   %ͨ����Ϣ��
%�����������ڴ���˻���ʱ��
sampling_num = floor(sys_param.band*sys_param.integral_time); 
c = 3*10^8;                                                 %����
antenna_pattern_info.wavelength = c/sys_param.center_freq;  %��ȡ���߹�������
angle_range = T_dist_extent; 
angle_range(1,:) = [];                %ȥ�����·ֲ������һ���е����£������Ƕ���Ϣ

%%�������߷���ͼ
antenna_type = antenna_pattern_info.antenna_type; %�������ʹӽṹ���л�ȡ
antenna_size = antenna_pattern_info.antenna_size; %���߳ߴ�ӽṹ���л�ȡ
wavelength = antenna_pattern_info.wavelength;     %���߹��������ӽṹ���л�ȡ
ant_pos=SRM_param.ant_pos ;
ant_pos =  min_spacing*ant_pos;
switch lower(antenna_type)
    case 'rectangle'% ���ο���
        lx = pi*antenna_size(1)/wavelength;
        for k = 1:length(angle_range)
            coef_vector(k) = abs(cosd(angle_range(k))*sinc(lx*sind(angle_range(k))));
        end
    case 'isotropic'%���룬���������Ϊ1
        coef_vector = ones(size(angle_range));
    case'circle'%Բ�ο���
        Ba = 2*pi*antenna_size/wavelength;
        for k = 1:length(angle_range)
            if (abs(sind(angle_range(k)))<=0.0001) %�����ĸΪ0ʱ����
                 coef_vector(k) = 1;
            else
                 coef_vector(k) = abs(2*real(besselj(1,Ba*sind(angle_range(k))))/(Ba*sind(angle_info(k))));
            end
        end
end

%%����ؾ�����ȡ
scene_power = T_dist_extent(1,:); %Դ�Ĺ�������
scene_theta = T_dist_extent(2,:); %Դ��λ������
for antenna_seria = 1:antenna_num
%     real_coef_matrix(:)=[];
    real_coef_matrix(antenna_seria) = {coef_vector};%��װ��cell��
end
for k = 1:antenna_num %��ȡ��Ԫ���߷���ͼ
    coef_matrix(k,:) = cell2mat(real_coef_matrix(k));
end           
% ������������A��
for k=1:length(scene_power)
    A(:,k)=sqrt(coef_matrix(:,k)).*[exp(2*pi*j*ant_pos*sind(scene_theta(k)))].';       
end
 % ����ź�����ؾ���
    self_correlation_matrix = A*diag(scene_power)*A';
    
    
%% ͨ���ɼ��Ⱥ������з���
 % ������������ 
 x_len_raw= x_len + IAM_param.fill_zero;
 % �ɼ��Ⱥ���ͨ��������غ�������ƽ�����
count = 0;
% �õ�uvƽ���Ŀɼ��ȷֲ�
for p = 1:length(ant_pos)
    for q = 1:length(ant_pos)
        count = count + 1;
        % ����
        uv_point(count) = ant_pos(p)-ant_pos(q);
    end
end
self_correlation_vector = reshape(conj(self_correlation_matrix'),1,antenna_num*antenna_num);

small_num = 10^(-2);
visibility = zeros(size(extent_UV));% �ɼ���
count  = zeros(size(extent_UV));% ����ƽ������
for k = 1:length(uv_point)
    x=extent_UV-uv_point(k);
    position = [];
    for m = 1:length(x)
        if abs(x(m)) < small_num
            position = m;
        end
    end
    % �ҵ���λ�÷ǿ�
    if isempty(position) == 0        
        % ����λ����position���Ŀɼ���
        visibility(position) = visibility(position)+self_correlation_vector(k);
        count(position) = count(position) + 1; 
    end
end
% ���õ���uvƽ���Ŀɼ�������ƽ��
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
legend('�ɼ���ʵ���仯','�ɼ���ʵ������ֵ')
xlabel('�����ָ�����')
ylabel('�ɼ���ʵ��')
title('�ɼ���ʵ���볡���ָ������Ĺ�ϵ')

subplot(2,1,2)
plot((1:N)*div,V2,'b',(1:N)*div,Vi,'r','LineWidth',2)
legend('�ɼ����鲿�仯','�ɼ����鲿����ֵ')
xlabel('�����ָ�����')
ylabel('�ɼ����鲿')
title('�ɼ����鲿�볡���ָ������Ĺ�ϵ')


%%һά����Ҷ�任
T = fftshift(ifft(ifftshift(visibility)));
% ȡͼ��ʵ��
T = real(T);
% �������������
T = T*x_len/x_len_raw;

figure(2)
subplot(2,1,1)
plot((1:N)*div,abs(V1-Vr),'LineWidth',2)
xlabel('�����ָ�����')
ylabel('�ɼ���ʵ��������')
subplot(2,1,2)
plot((1:N)*div,abs(V2-Vi),'LineWidth',2)
xlabel('�����ָ�����')
ylabel('�ɼ����鲿������')

figure(3)
plot(-extent_UV/(2*x_len+1)/min_spacing/min_spacing,T,'-','LineWidth',2)
axis square



    




